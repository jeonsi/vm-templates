#!/bin/bash

VNC=true
OVS="x"

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
