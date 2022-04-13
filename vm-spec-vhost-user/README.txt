# How to create 42 ubuntu 20.04 test vm disks
./mod-base-image.sh vm-spec-vhost-user/vm-spec-vhost-user-00
/etc/default/grub
GRUB_CMDLINE_LINUX="biosdevname=0 net.ifnames=0"
update-grub

/etc/ssh/sshd_config
PermitRootLogin yes

apt update
apt install -y iperf iperf3
reboot
poweroff
virsh undefine focal

eval "$(./create-vm.sh vm-spec-vhost-user/vm-spec-vhost-user-00)"
login
/etc/netplan/50-cloud-init.yaml
# remove mac match
poweroff

cd ~irteamsu/kvm_perf/script/n4d/vdpa/
./undefine_all_vhost_user.sh
cd -

#!/bin/bash

for i in 0{0..9} {10..20}
do
	ansible vhost-user-$i -m shell -a "cat << EOF > /etc/vmnet.env
MY_IP=1.4.200.$i/8
E_PEER_IP=1.5.200.$i
I_PEER_IP=1.4.200.`expr $i + 21`
EOF
"
done

for i in {21..41}
do
	ansible vhost-user-$i -m shell -a "cat << EOF > /etc/vmnet.env
MY_IP=1.4.200.$i/8
E_PEER_IP=1.5.200.$i
echo "I_PEER_IP=1.4.200.`expr $i - 21`"
EOF
"
done


#!/bin/bash

for i in 0{0..9} {10..20}
do
        ansible vhost-user-$i -m shell -a "cat << EOF > /etc/vmnet.env
MY_IP=1.5.200.$i/8
E_PEER_IP=1.4.200.$i
I_PEER_IP=1.5.200.`expr $i + 21`
EOF
"
done

for i in {21..41}
do
        ansible vhost-user-$i -m shell -a "cat << EOF > /etc/vmnet.env
MY_IP=1.5.200.$i/8
E_PEER_IP=1.4.200.$i
echo "I_PEER_IP=1.5.200.`expr $i - 21`"
EOF
"
done

