# How to create 42 ubuntu 20.04 test vm disks
./mod-base-image.sh vm-spec-vhost-user-ubuntu/vm-spec-vhost-user-00
./mod-base-image.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-00
# /etc/machine-id 내용 제거: backing image에 machine-id가 정의되어 있으면, 이를 기반으로 한 vm image에 모두 동일한 machine-id가 적용되어 동일한 DHCP IP를 받게 되는 문제가 있음
echo -n > /etc/machine-id

/etc/default/grub
GRUB_CMDLINE_LINUX="biosdevname=0 net.ifnames=0"
update-grub

/etc/ssh/sshd_config
PermitRootLogin yes

apt update
apt install -y iperf iperf3

# do it once again to make sure
echo -n > /etc/machine-id

poweroff
virsh undefine focal

./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-00
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-01
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-02
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-03
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-04
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-05
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-06
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-07
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-08
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-09
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-10
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-11
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-12
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-13
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-14
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-15
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-16
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-17
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-18
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-19
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-20
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-21
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-22
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-23
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-24
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-25
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-26
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-27
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-28
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-29
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-30
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-31
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-32
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-33
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-34
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-35
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-36
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-37
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-38
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-39
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-40
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-41

./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-00
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-01
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-02
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-03
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-04
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-05
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-06
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-07
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-08
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-09
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-10
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-11
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-12
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-13
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-14
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-15
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-16
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-17
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-18
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-19
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-20
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-21
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-22
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-23
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-24
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-25
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-26
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-27
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-28
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-29
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-30
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-31
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-32
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-33
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-34
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-35
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-36
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-37
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-38
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-39
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-40
./create-vm.sh vm-spec-vhost-user-centos/vm-spec-vhost-user-41

cd <script-floder>
./create_vhost_user_1c2g.sh
./mod_vhost_user_xml_42vms_mac4_1q.sh
./start_all_vhost_user.sh

./add-vmnet-to-PM1.sh

#add-vmnet-to-PM1.sh
#!/bin/bash

for i in 0{0..9} {10..20}
do
	ansible vhost-user-$i -m shell -a "cat << EOF > /etc/vmnet.env
MY_IP=1.4.200.`expr $i + 0`/8
E_PEER_IP=1.5.200.`expr $i + 0`
I_PEER_IP=1.4.200.`expr $i + 21`
EOF
"
done

for i in {21..41}
do
	ansible vhost-user-$i -m shell -a "cat << EOF > /etc/vmnet.env
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
        ansible vhost-user-$i -m shell -a "cat << EOF > /etc/vmnet.env
MY_IP=1.5.200.`expr $i + 0`/8
E_PEER_IP=1.4.200.`expr $i + 0`
I_PEER_IP=1.5.200.`expr $i + 21`
EOF
"
done

for i in {21..41}
do
        ansible vhost-user-$i -m shell -a "cat << EOF > /etc/vmnet.env
MY_IP=1.5.200.`expr $i + 0`/8
E_PEER_IP=1.4.200.`expr $i + 0`
I_PEER_IP=1.5.200.`expr $i - 21`
EOF
"
done

