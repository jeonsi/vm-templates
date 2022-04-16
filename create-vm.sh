#!/bin/bash
set -e

__usage="
Usage: $(basename $0) <vm-spec-file> [-mod]

  -mod : modifies base image directly
"

num_params=$#
if [ $num_params -eq 0 ]; then
    echo "$__usage"
    exit 1
fi

# default values
VM_NAME="ubuntu"
OS_VARIANT="ubuntu20.04"
USERNAME="ubuntu"
PASSWORD="changeme"
MEMORY=1024
VCPUS=1
DISKSIZE=10G
VNC=""
OVS=""

# override values
. $1

# define derived variables
DISK_NAME=$VM_NAME.qcow2

# clound image names:
CENTOS=CentOS-7-x86_64-GenericCloud-2111.qcow2
UBUNTU20=ubuntu-20.04-server-cloudimg-amd64.img
UBUNTU21=ubuntu-21.10-server-cloudimg-amd64.img
ARCH=Arch-Linux-x86_64-cloudimg-20220415.53207.qcow2
ALPINE=alpine3.14.6.qcow2

if [[ $2 == "-mod" ]]; then	# modifies image directly
    if [[ $OS_VARIANT == "ubuntu20.04" ]]; then
        VM_NAME=ubuntu20-base
	DISK_NAME=$VM_NAME.qcow2
	cp $UBUNTU20 $DISK_NAME
    elif [[ $OS_VARIANT == "ubuntu21.04" ]]; then
        VM_NAME=ubuntu21-base
	DISK_NAME=$VM_NAME.qcow2
	cp $UBUNTU21 $DISK_NAME
    elif [[ $OS_VARIANT == "centos7.0" ]]; then
        VM_NAME=centos7-base
	DISK_NAME=$VM_NAME.qcow2
	cp $CENTOS $DISK_NAME
    elif [[ $OS_VARIANT == "archlinux" ]]; then
        VM_NAME=arch-base
	DISK_NAME=$VM_NAME.qcow2
	cp $ARCH $DISK_NAME
    elif [[ $OS_VARIANT == "alpinelinux3.14" ]]; then
        VM_NAME=alpine-base
	DISK_NAME=$VM_NAME.qcow2
	cp $ALPINE $DISK_NAME
    else
        echo "$OS_VARIANT not supported"
        exit 1
    fi
else	# normal creation
    if [[ $OS_VARIANT == "ubuntu20.04" ]]; then
        qemu-img create -q -b $UBUNTU20 -f qcow2 -F qcow2 $DISK_NAME $DISKSIZE
    elif [[ $OS_VARIANT == "ubuntu21.04" ]]; then
        qemu-img create -q -b $UBUNTU21 -f qcow2 -F qcow2 $DISK_NAME $DISKSIZE
    elif [[ $OS_VARIANT == "centos7.0" ]]; then
        qemu-img create -q -b $CENTOS -f qcow2 -F qcow2 $DISK_NAME $DISKSIZE
    elif [[ $OS_VARIANT == "archlinux" ]]; then
        qemu-img create -q -b $ARCH -f qcow2 -F qcow2 $DISK_NAME $DISKSIZE
    elif [[ $OS_VARIANT == "alpinelinux3.14" ]]; then
        qemu-img create -q -b $ALPINE -f qcow2 -F qcow2 $DISK_NAME $DISKSIZE
    else
        echo "$OS_VARIANT not supported"
        exit 1
    fi
fi

# create user-data
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

# create meta-data
echo "instance-id: $(uuidgen || echo i-abcdefg)" > $VM_NAME-meta-data
#echo -n > $VM_NAME-meta-data

# create cloud-init.iso
cloud-localds $VM_NAME-cloud-init.iso $VM_NAME-user-data $VM_NAME-meta-data

# output virt-install command
# use    eval "$(./create_vm.sh <vm-spec-file>)"    for running the output as a command
echo "virt-install \\"
echo "  --name $VM_NAME \\"
echo "  --cpu host \\"
echo "  --vcpus=$VCPUS \\"
echo "  --check-cpu \\"
echo "  --memory $MEMORY \\"
echo "  --disk $DISK_NAME,device=disk,bus=virtio \\"
echo "  --disk $VM_NAME-cloud-init.iso,device=cdrom \\"
echo "  --os-type linux \\"
echo "  --os-variant $OS_VARIANT \\"
echo "  --virt-type kvm \\"
if [[ $VNC == "true" ]] ; then
    echo "  --graphics vnc,listen=0.0.0.0 \\"
else
    echo "  --graphics none \\"
fi
if [[ -n $OVS ]]; then
    echo "  --network bridge=$OVS,virtualport_type=openvswitch,model=virtio \\"
else
    echo "  --network network=default,model=virtio \\"
fi
echo "  --import"

# remove in-process files
# rm -f $VM_NAME-user-data $VM_NAME-meta-data
