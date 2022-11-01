#!/bin/bash
echo "=======GUIDE FOR JERRY KERNEL==========="
echo "Build kernel=bk clean source=cs regen config=rc"
read -p "what do you want to do ?" da
case $da in
(bk | BK)
./build.sh
esac
case $da in
(cs | CS)
./clean.sh
esac
case $da in
(rc | RC)
./config.sh
esac
echo "good job man ,to rest or enjoy!"
