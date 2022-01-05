#!/bin/sh
cdrdao write --driver generic-mmc:0x10 -v 2 --multi -n info.toc &&
cdrecord -msinfo | while read SSZ ; do
    mkisofs -J -r -V "CAUTAM_COMORI" -C $SSZ -o cd_plus.iso date
done &&
cdrecord -v -tao gracetime=3 -data cd_plus.iso
