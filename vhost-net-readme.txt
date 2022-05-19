# How to create 42 ubuntu 20.04 test vm disks
./create-vm.sh vm-spec-vhost-net-ubuntu/vm-spec-vhost-net-00 -base
./create-vm.sh vm-spec-vhost-net-centos/vm-spec-vhost-net-00 -base
# /etc/machine-id 내용 제거: backing image에 machine-id가 정의되어 있으면, 이를 기반으로 한 vm image에 모두 동일한 machine-id가 적용되어 동일한 DHCP IP를 받게 되는 문제가 있음

# for ubuntu 20.04, machine-id file should be emptied, not deleted
# ubuntu 20.04 cloud image has empty machie-id file
echo -n > /etc/machine-id

# for centos7, machine-id file should be deleted, not emptied
# centos7 cloud image has the following machine-id file
# 754f8a1ad2654504b10cacfb2e9d5eb0

# for archlinux, there is no machine-id file in cloud image
# for alpine, there is no machine-id file, because it not cloud image 

# 혹은 image file mount하여 직접 수정: https://www.jamescoyle.net/how-to/1818-access-a-qcow2-virtual-disk-image-from-the-host

# grub 수정
/etc/default/grub
# for ubuntu
GRUB_CMDLINE_LINUX="biosdevname=0 net.ifnames=0"
update-grub

# for centos
grub2-mkconfig -o /boot/grub2/grub.cfg

# sshd 수정
/etc/ssh/sshd_config
PermitRootLogin yes

# package 설치
apt update
apt install -y iperf iperf3

# for centos
yum install -y iperf3 tcpdump tmux
yum install -y epel-release
yum install -y iperf

# for centos, remove mac for eth0
/etc/sysconfig/network-scripts/ifcfg-eth0
remove HWADDR

# check again /etc/machine-id file

poweroff
virsh undefine focal

./create-vm.sh vm-spec-vhost-net-ubuntu/vm-spec-vhost-net-00 -onbase
./create-vm.sh vm-spec-vhost-net-ubuntu/vm-spec-vhost-net-01 -onbase
./create-vm.sh vm-spec-vhost-net-ubuntu/vm-spec-vhost-net-02 -onbase
./create-vm.sh vm-spec-vhost-net-ubuntu/vm-spec-vhost-net-03 -onbase
./create-vm.sh vm-spec-vhost-net-ubuntu/vm-spec-vhost-net-04 -onbase
./create-vm.sh vm-spec-vhost-net-ubuntu/vm-spec-vhost-net-05 -onbase
./create-vm.sh vm-spec-vhost-net-ubuntu/vm-spec-vhost-net-06 -onbase
./create-vm.sh vm-spec-vhost-net-ubuntu/vm-spec-vhost-net-07 -onbase
./create-vm.sh vm-spec-vhost-net-ubuntu/vm-spec-vhost-net-08 -onbase
./create-vm.sh vm-spec-vhost-net-ubuntu/vm-spec-vhost-net-09 -onbase
./create-vm.sh vm-spec-vhost-net-ubuntu/vm-spec-vhost-net-10 -onbase
./create-vm.sh vm-spec-vhost-net-ubuntu/vm-spec-vhost-net-11 -onbase
./create-vm.sh vm-spec-vhost-net-ubuntu/vm-spec-vhost-net-12 -onbase
./create-vm.sh vm-spec-vhost-net-ubuntu/vm-spec-vhost-net-13 -onbase
./create-vm.sh vm-spec-vhost-net-ubuntu/vm-spec-vhost-net-14 -onbase
./create-vm.sh vm-spec-vhost-net-ubuntu/vm-spec-vhost-net-15 -onbase
./create-vm.sh vm-spec-vhost-net-ubuntu/vm-spec-vhost-net-16 -onbase
./create-vm.sh vm-spec-vhost-net-ubuntu/vm-spec-vhost-net-17 -onbase
./create-vm.sh vm-spec-vhost-net-ubuntu/vm-spec-vhost-net-18 -onbase
./create-vm.sh vm-spec-vhost-net-ubuntu/vm-spec-vhost-net-19 -onbase
./create-vm.sh vm-spec-vhost-net-ubuntu/vm-spec-vhost-net-20 -onbase
./create-vm.sh vm-spec-vhost-net-ubuntu/vm-spec-vhost-net-21 -onbase
./create-vm.sh vm-spec-vhost-net-ubuntu/vm-spec-vhost-net-22 -onbase
./create-vm.sh vm-spec-vhost-net-ubuntu/vm-spec-vhost-net-23 -onbase
./create-vm.sh vm-spec-vhost-net-ubuntu/vm-spec-vhost-net-24 -onbase
./create-vm.sh vm-spec-vhost-net-ubuntu/vm-spec-vhost-net-25 -onbase
./create-vm.sh vm-spec-vhost-net-ubuntu/vm-spec-vhost-net-26 -onbase
./create-vm.sh vm-spec-vhost-net-ubuntu/vm-spec-vhost-net-27 -onbase
./create-vm.sh vm-spec-vhost-net-ubuntu/vm-spec-vhost-net-28 -onbase
./create-vm.sh vm-spec-vhost-net-ubuntu/vm-spec-vhost-net-29 -onbase
./create-vm.sh vm-spec-vhost-net-ubuntu/vm-spec-vhost-net-30 -onbase
./create-vm.sh vm-spec-vhost-net-ubuntu/vm-spec-vhost-net-31 -onbase
./create-vm.sh vm-spec-vhost-net-ubuntu/vm-spec-vhost-net-32 -onbase
./create-vm.sh vm-spec-vhost-net-ubuntu/vm-spec-vhost-net-33 -onbase
./create-vm.sh vm-spec-vhost-net-ubuntu/vm-spec-vhost-net-34 -onbase
./create-vm.sh vm-spec-vhost-net-ubuntu/vm-spec-vhost-net-35 -onbase
./create-vm.sh vm-spec-vhost-net-ubuntu/vm-spec-vhost-net-36 -onbase
./create-vm.sh vm-spec-vhost-net-ubuntu/vm-spec-vhost-net-37 -onbase
./create-vm.sh vm-spec-vhost-net-ubuntu/vm-spec-vhost-net-38 -onbase
./create-vm.sh vm-spec-vhost-net-ubuntu/vm-spec-vhost-net-39 -onbase
./create-vm.sh vm-spec-vhost-net-ubuntu/vm-spec-vhost-net-40 -onbase
./create-vm.sh vm-spec-vhost-net-ubuntu/vm-spec-vhost-net-41 -onbase

./create-vm.sh vm-spec-vhost-net-centos/vm-spec-vhost-net-00 -onbase
./create-vm.sh vm-spec-vhost-net-centos/vm-spec-vhost-net-01 -onbase
./create-vm.sh vm-spec-vhost-net-centos/vm-spec-vhost-net-02 -onbase
./create-vm.sh vm-spec-vhost-net-centos/vm-spec-vhost-net-03 -onbase
./create-vm.sh vm-spec-vhost-net-centos/vm-spec-vhost-net-04 -onbase
./create-vm.sh vm-spec-vhost-net-centos/vm-spec-vhost-net-05 -onbase
./create-vm.sh vm-spec-vhost-net-centos/vm-spec-vhost-net-06 -onbase
./create-vm.sh vm-spec-vhost-net-centos/vm-spec-vhost-net-07 -onbase
./create-vm.sh vm-spec-vhost-net-centos/vm-spec-vhost-net-08 -onbase
./create-vm.sh vm-spec-vhost-net-centos/vm-spec-vhost-net-09 -onbase
./create-vm.sh vm-spec-vhost-net-centos/vm-spec-vhost-net-10 -onbase
./create-vm.sh vm-spec-vhost-net-centos/vm-spec-vhost-net-11 -onbase
./create-vm.sh vm-spec-vhost-net-centos/vm-spec-vhost-net-12 -onbase
./create-vm.sh vm-spec-vhost-net-centos/vm-spec-vhost-net-13 -onbase
./create-vm.sh vm-spec-vhost-net-centos/vm-spec-vhost-net-14 -onbase
./create-vm.sh vm-spec-vhost-net-centos/vm-spec-vhost-net-15 -onbase
./create-vm.sh vm-spec-vhost-net-centos/vm-spec-vhost-net-16 -onbase
./create-vm.sh vm-spec-vhost-net-centos/vm-spec-vhost-net-17 -onbase
./create-vm.sh vm-spec-vhost-net-centos/vm-spec-vhost-net-18 -onbase
./create-vm.sh vm-spec-vhost-net-centos/vm-spec-vhost-net-19 -onbase
./create-vm.sh vm-spec-vhost-net-centos/vm-spec-vhost-net-20 -onbase
./create-vm.sh vm-spec-vhost-net-centos/vm-spec-vhost-net-21 -onbase
./create-vm.sh vm-spec-vhost-net-centos/vm-spec-vhost-net-22 -onbase
./create-vm.sh vm-spec-vhost-net-centos/vm-spec-vhost-net-23 -onbase
./create-vm.sh vm-spec-vhost-net-centos/vm-spec-vhost-net-24 -onbase
./create-vm.sh vm-spec-vhost-net-centos/vm-spec-vhost-net-25 -onbase
./create-vm.sh vm-spec-vhost-net-centos/vm-spec-vhost-net-26 -onbase
./create-vm.sh vm-spec-vhost-net-centos/vm-spec-vhost-net-27 -onbase
./create-vm.sh vm-spec-vhost-net-centos/vm-spec-vhost-net-28 -onbase
./create-vm.sh vm-spec-vhost-net-centos/vm-spec-vhost-net-29 -onbase
./create-vm.sh vm-spec-vhost-net-centos/vm-spec-vhost-net-30 -onbase
./create-vm.sh vm-spec-vhost-net-centos/vm-spec-vhost-net-31 -onbase
./create-vm.sh vm-spec-vhost-net-centos/vm-spec-vhost-net-32 -onbase
./create-vm.sh vm-spec-vhost-net-centos/vm-spec-vhost-net-33 -onbase
./create-vm.sh vm-spec-vhost-net-centos/vm-spec-vhost-net-34 -onbase
./create-vm.sh vm-spec-vhost-net-centos/vm-spec-vhost-net-35 -onbase
./create-vm.sh vm-spec-vhost-net-centos/vm-spec-vhost-net-36 -onbase
./create-vm.sh vm-spec-vhost-net-centos/vm-spec-vhost-net-37 -onbase
./create-vm.sh vm-spec-vhost-net-centos/vm-spec-vhost-net-38 -onbase
./create-vm.sh vm-spec-vhost-net-centos/vm-spec-vhost-net-39 -onbase
./create-vm.sh vm-spec-vhost-net-centos/vm-spec-vhost-net-40 -onbase
./create-vm.sh vm-spec-vhost-net-centos/vm-spec-vhost-net-41 -onbase

# create storage pool
virsh pool-define-as nfs dir - - - - "/mnt/nfs"
virsh pool-build nfs
virsh pool-start nfs
virsh pool-autostart nfs
virsh pool-list

cd <script-floder>
./create_vhost_user_1c2g.sh
./mod_vhost_user_xml_42vms_mac4_1q.sh
./start_all_vhost_user.sh

./add-vmnet-to-PM1.sh

#add-vmnet-to-PM1.sh
#!/bin/bash

for i in 0{0..9} {10..20}
do
	ansible vhost-net-$i -m shell -a "cat << EOF > /etc/vmnet.env
MY_IP=1.4.200.`expr $i + 0`/8
E_PEER_IP=1.5.200.`expr $i + 0`
I_PEER_IP=1.4.200.`expr $i + 21`
EOF
"
done

for i in {21..41}
do
	ansible vhost-net-$i -m shell -a "cat << EOF > /etc/vmnet.env
MY_IP=1.4.200.`expr $i + 0`/8
E_PEER_IP=1.5.200.`expr $i + 0`
I_PEER_IP=1.4.200.`expr $i - 21`
EOF
"
done

#add-vmnet-to-PM2.sh
#!/bin/bash

for i in 0{0..9} {10..20}
do
        ansible vhost-net-$i -m shell -a "cat << EOF > /etc/vmnet.env
MY_IP=1.5.200.`expr $i + 0`/8
E_PEER_IP=1.4.200.`expr $i + 0`
I_PEER_IP=1.5.200.`expr $i + 21`
EOF
"
done

for i in {21..41}
do
        ansible vhost-net-$i -m shell -a "cat << EOF > /etc/vmnet.env
MY_IP=1.5.200.`expr $i + 0`/8
E_PEER_IP=1.4.200.`expr $i + 0`
I_PEER_IP=1.5.200.`expr $i - 21`
EOF
"
done

