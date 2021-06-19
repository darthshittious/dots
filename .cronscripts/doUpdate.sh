#!/bin/sh
set -e
/home/sauron/.cronscripts/waitfornetwork.sh
pacman -Syu --noconfirm

