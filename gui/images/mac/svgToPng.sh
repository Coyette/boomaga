#!/bin/bash

SVG_FILE="boomaga.svg"
zcat ../boomaga.svgz > ${SVG_FILE}

function createPng
{
    local size=$1
    local name=$2
    rsvg-convert ${SVG_FILE} -w $size -h $size -o boomaga.iconset/$name
}

[ -d boomaga.iconset ] || mkdir boomaga.iconset

createPng 16   "icon_16x16.png"
createPng 32   "icon_16x16@2x.png"

createPng 32   "icon_32x32.png"
createPng 64   "icon_32x32@2x.png"

createPng 128  "icon_128x128.png"
createPng 256  "icon_128x128@2x.png"

createPng 256  "icon_256x256.png"
createPng 512  "icon_256x256@2x.png"

createPng 512  "icon_512x512.png"
createPng 1024 "icon_512x512@2x.png"

rm ${SVG_FILE}