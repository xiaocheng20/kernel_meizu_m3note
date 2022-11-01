#!/bin/bash
./clean.sh
mkdir output
echo "Auto Kernel Build Script!"
export Kpass=~/m3note/output/arch/arm64/boot/Image.gz-dtb
export CROSS_COMPILE=~/Toolchain/google_gcc/aarch64-linux-android-4.9/bin/aarch64-linux-android-
export CROSS_COMPILE_ARM32=arm-linux-gnueabi-
export ARCH=arm64
export SUBARCH=arm64
echo "=========================="
echo "Use google_gcc to compile kernel"
echo "==========================="
echo "gcc version android-4.9"
echo "========================"
echo "                        "
echo "                        "
ls arch/arm64/configs
read -p "choice Your defconfig: " defconfig
make O=output $defconfig -j16
make O=output -j16

if [[ -e "$Kpass" ]];then
echo "compile complete"
read -p "Do U need zip kernelfile in AK3 [Y/N]?" ans
case $ans in
(Y | y) 
echo "zipfile"
cp output/arch/arm64/boot/Image.gz-dtb ../AnyKernel3/
cd ../AnyKernel3
zip kernel.zip anykernel.sh LICENSE META-INF modules patch ramdisk README.md tools Image.gz-dtb
       echo "finish"
       exit
(N | n)
 echo "=========="
       echo "exit"
esac     
else 
echo "GG"
fi         
