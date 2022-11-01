#!/bin/bash
export cleanner=~/m3note/output
export ak3c=~/AnyKernel3/kernel.zip

if [[  -d $cleanner ]];then
rm -rf output
printf "making clean!"
else
echo "You Kernel source was cleaned!"
fi

if [[ -e $ak3c ]];then
rm -rf ~/AnyKernel3/kernel.zip
rm -rf ~/AnyKernel3/Image.gz-dtb
echo "======cleanner AK3 Dir=========="
echo "======cleanner was finish=========="
else 
echo "+++++++++NO NEED CLEAN!++++++++++++"
fi

read -p "do you need make mrproper or clean?(Y or N)" jk
case $jk in
(y | Y )
make mrproper && make clean
esac
case $jk in
(n | N)
echo "WE NOT MAKE MRPROPER NOW!"
esac