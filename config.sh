#!/bin/bash
export ARCH=arm64
echo "rebuild kernel config script"
read -p "clean-config or full-config [c or f or m]" choi
case $choi in
(c | C)
ls arch/arm64/configs
read -p "choice config for you want " tg
make $tg && make savedefconfig && mv defconfig arch/$ARCH/configs/$tg
echo "regen clean-config was finish"
echo "cleanning kernel source"
make mrproper
echo "cleanning finished"
esac;
case $choi in
(f | F)
echo "=======regen full-config========="
ls arch/arm64/configs
read -p "choice config for you want " tg
make $tg && mv .config arch/$ARCH/configs/$tg
echo "regen full-config was complete"
echo "start clean kernel source"
make mrproper
echo "cleanning finished"
exit
esac
case $choi in
(m | M)
echo "=======make menuconfig!!!========="
ls arch/arm64/configs
read -p "choice config for you want " tg
make menuconfig $tg 
echo "Press any key to save"
read
make savedefconfig && mv defconfig arch/$ARCH/configs/$tg
echo "Regen-menu-config was finished"
echo "now,clean kernel source"
make mrproper
echo "cleanning complete" 
exit
esac