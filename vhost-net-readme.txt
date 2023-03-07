# How to create 42 ubuntu 20.04 test vm disks
# cloud-localds not found
# sudo apt install cloud-image-utils
# for virtualization
# apt install ansible sshpass python-is-python3 qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virtinst cloud-image-utils
# sudo yum install cloud-utils
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
# 불필요한 부하유발 패키지 제거
apt purge landscape-common unattended-upgrades -y
apt autoremove

# for centos
yum install -y iperf3 tcpdump tmux
yum install -y epel-release
yum install -y iperf

# for ubuntu
/etc/netplan/50-cloud-init.yaml
network:
    ethernets:
        eth0:
            dhcp4: true
    version: 2

# for centos, remove mac for eth0
/etc/sysconfig/network-scripts/ifcfg-eth0
remove HWADDR

# check again /etc/machine-id file

poweroff
virsh undefine ubuntu20-base

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
./create_virtio_net_1c2g.sh
./start_all_vhost_net.sh

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

ansible all -m shell -a 'hostnamectl set-hostname ubuntu20'

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

cp vhost-net-00.qcow2 vhost-user-00.qcow2
cp vhost-net-01.qcow2 vhost-user-01.qcow2
cp vhost-net-02.qcow2 vhost-user-02.qcow2
cp vhost-net-03.qcow2 vhost-user-03.qcow2
cp vhost-net-04.qcow2 vhost-user-04.qcow2
cp vhost-net-05.qcow2 vhost-user-05.qcow2
cp vhost-net-06.qcow2 vhost-user-06.qcow2
cp vhost-net-07.qcow2 vhost-user-07.qcow2
cp vhost-net-08.qcow2 vhost-user-08.qcow2
cp vhost-net-09.qcow2 vhost-user-09.qcow2
cp vhost-net-10.qcow2 vhost-user-10.qcow2
cp vhost-net-11.qcow2 vhost-user-11.qcow2
cp vhost-net-12.qcow2 vhost-user-12.qcow2
cp vhost-net-13.qcow2 vhost-user-13.qcow2
cp vhost-net-14.qcow2 vhost-user-14.qcow2
cp vhost-net-15.qcow2 vhost-user-15.qcow2
cp vhost-net-16.qcow2 vhost-user-16.qcow2
cp vhost-net-17.qcow2 vhost-user-17.qcow2
cp vhost-net-18.qcow2 vhost-user-18.qcow2
cp vhost-net-19.qcow2 vhost-user-19.qcow2
cp vhost-net-20.qcow2 vhost-user-20.qcow2
cp vhost-net-21.qcow2 vhost-user-21.qcow2
cp vhost-net-22.qcow2 vhost-user-22.qcow2
cp vhost-net-23.qcow2 vhost-user-23.qcow2
cp vhost-net-24.qcow2 vhost-user-24.qcow2
cp vhost-net-25.qcow2 vhost-user-25.qcow2
cp vhost-net-26.qcow2 vhost-user-26.qcow2
cp vhost-net-27.qcow2 vhost-user-27.qcow2
cp vhost-net-28.qcow2 vhost-user-28.qcow2
cp vhost-net-29.qcow2 vhost-user-29.qcow2
cp vhost-net-30.qcow2 vhost-user-30.qcow2
cp vhost-net-31.qcow2 vhost-user-31.qcow2
cp vhost-net-32.qcow2 vhost-user-32.qcow2
cp vhost-net-33.qcow2 vhost-user-33.qcow2
cp vhost-net-34.qcow2 vhost-user-34.qcow2
cp vhost-net-35.qcow2 vhost-user-35.qcow2
cp vhost-net-36.qcow2 vhost-user-36.qcow2
cp vhost-net-37.qcow2 vhost-user-37.qcow2
cp vhost-net-38.qcow2 vhost-user-38.qcow2
cp vhost-net-39.qcow2 vhost-user-39.qcow2
cp vhost-net-40.qcow2 vhost-user-40.qcow2
cp vhost-net-41.qcow2 vhost-user-41.qcow2


