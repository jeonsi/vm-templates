mkdir vm240-spec-vhost-net-ubuntu
cd vm240-spec-vhost-net-ubuntu
for i in {1..240}
do
    cat << EOF > ./vm-spec-vhost-net-$i
VM_NAME="vhost-net-$i"
OS_VARIANT="ubuntu20.04"
USERNAME="root"
PASSWORD="changeme"
MEMORY=1024
EOF
done

cd ..
for i in {1..240}; do ./create-vm.sh vm240-spec-vhost-net-ubuntu/vm-spec-vhost-net-$i -onbase; done

cd ..
mkdir nfs
cd nfs
cp ../vm-templates/*.qcow2 .


for i in {1..240}
do
    mv vhost-net-$i.qcow2 vhost-user-$i.qcow2
done
