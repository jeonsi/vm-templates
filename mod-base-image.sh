#!/bin/bash
set -e

__usage="
Usage: $(basename $0) <vm-spec-file>
"

num_params=$#
if [ $num_params -ne 1 ]; then
    echo "$__usage"
    exit 1
fi

. $1

DISK_NAME=$VM_NAME.qcow2

if [[ $OS_VARIANT == "ubuntu20.04" ]]; then
    DISK_NAME=focal-server-cloudimg-amd64.img
    VM_NAME=focal
elif [[ $OS_VARIANT == "centos7.0" ]]; then
    DISK_NAME=CentOS-7-x86_64-GenericCloud.qcow2
    VM_NAME=CentOS7
elif [[ $OS_VARIANT == "alpinelinux3.14" ]]; then
    DISK_NAME=alpinelinux3.14.qcow2
    VM_NAME=alpine
elif [[ $OS_VARIANT == "archlinux" ]]; then
    DISK_NAME=Arch-Linux-x86_64-cloudimg-20220325.51113.qcow2
    VM_NAME=arch
else
    echo "$OS_VARIANT not supported"
    exit 1
fi

cat << EOF > $VM_NAME-user-data
#cloud-config
system_info:
  default_user:
    name: $USERNAME
    home: /home/$USERNAME

password: $PASSWORD
chpasswd: { expire: False }
hostname: $VM_NAME

# configure sshd to allow users logging in using password
# rather than just keys
ssh_pwauth: True
EOF

echo "instance-id: $(uuidgen || echo i-abcdefg)" > $VM_NAME-meta-data
#echo -n > $VM_NAME-meta-data

cloud-localds $VM_NAME-cloud-init.iso $VM_NAME-user-data $VM_NAME-meta-data

echo "virt-install \\"
echo "  --name $VM_NAME \\"
echo "  --memory $MEMORY \\"
echo "  --disk $DISK_NAME,device=disk,bus=virtio \\"
echo "  --disk $VM_NAME-cloud-init.iso,device=cdrom \\"
echo "  --os-type linux \\"
echo "  --os-variant $OS_VARIANT \\"
echo "  --virt-type kvm \\"
if [[ -z $VNC ]]; then
    echo "  --graphics none \\"
else
    echo "  --graphics vnc,listen=0.0.0.0 \\"
fi
if [[ -n $OVS ]]; then
    echo "  --network bridge=$OVS,virtualport_type=openvswitch,model=virtio \\"
else
    echo "  --network network=default,model=virtio \\"
fi
echo "  --import"

#rm -f $VM_NAME-user-data $VM_NAME-meta-data
