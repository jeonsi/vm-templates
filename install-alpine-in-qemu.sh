# https://wiki.alpinelinux.org/wiki/Install_Alpine_in_QEMU
wget https://dl-cdn.alpinelinux.org/alpine/v3.14/releases/x86_64/alpine-virt-3.14.4-x86_64.iso

# IDE
qemu-img create -f qcow2 alpine314.qcow2 2G

qemu-system-x86_64 -m 512 -nic user -boot d -cdrom alpine-virt-3.14.4-x86_64.iso -hda alpine314.qcow2 -display gtk -enable-kvm -cpu host

qemu-system-x86_64 -m 512 -nic user -hda alpine314.qcow2 -enable-kvm -cpu host

# virtio-blk
qemu-img create -f qcow2 alpine-virtio-blk.qcow2 2G
qemu-system-x86_64 -m 512 -nic user -boot d -cdrom alpine-virt-3.14.4-x86_64.iso \
  -device virtio-blk-pci,scsi=off,drive=vda,id=vvda,bootindex=1,bus=pci.0,addr=0xb \
  -drive file=alpine-virtio-blk.qcow2,if=none,id=vda,cache=none,format=qcow2 \
  -display gtk -enable-kvm -cpu host

qemu-system-x86_64 -m 512 -nic user \
  -device virtio-blk-pci,scsi=off,drive=vda,id=vvda,bootindex=1,bus=pci.0,addr=0xb \
  -drive file=alpine-virtio-blk.qcow2,if=none,id=vda,cache=none,format=qcow2 \
  -display gtk -enable-kvm -cpu host

# virsh
virt-install --name alpine314 --memory 512 --disk alpine314.qcow2,device=disk,bus=virtio --disk alpine-virt-3.14.4-x86_64.iso,device=cdrom --os-type linux --os-variant alpinelinux3.14 --virt-type kvm --graphics none --network network=default,model=virtio --boot cdrom

virt-install --name alpine314 --memory 512 --disk alpine314.qcow2,device=disk,bus=virtio --os-type linux --os-variant alpinelinux3.14 --virt-type kvm --graphics none --network network=default,model=virtio --import

