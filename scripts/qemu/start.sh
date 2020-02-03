#!/bin/bash

if [[ $1 =~ "86" ]]; then
    QEMU=qemu-system-i386
elif [[ $1 =~ "64" ]]; then
    QEMU=qemu-system-x86_64
fi

ARG=""
if [ ! -z $2 ]; then
    ARG="-cdrom $2"
fi

$QEMU -enable-kvm \
    -monitor unix:/tmp/qemu-monitor.sock,server,nowait \
    $ARG \
    -boot c $1 \
    -vga std \
    -cpu host,hv_vendor_id=null,-hypervisor \
    -smp $(nproc) \
    -net nic,model=virtio -net user \
    -m 4096
    #-fda /path/to/virtio-win-0.1.173_x86.vfd \
    #-audiodev id=pa,driver=pa \
    #-soundhw hda
