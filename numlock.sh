#!/bin/bash
# Turn on numlock in sddm
echo "[General]" | tee -a /etc/sddm.conf
echo "Numlock=on" | tee -a /etc/sddm.conf

# remember to change numlock to on here fluffy@archlinux ~> sudo micro  /usr/lib/sddm/sddm.conf.d/default.conf
