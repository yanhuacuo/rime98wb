#!/bin/bash
for username in `ls /home`      
do
      echo /home/$username
      if [ -d /home/$username/.local/share/fcitx5/rime ];then
      rm -rf /home/$username/.local/share/fcitx5/rime
      fi
      mkdir -p /home/$username/.local/share/fcitx5/rime/build
      if [ ! -d /home/$username/.local/share/fcitx5/themes ]; then
      mkdir /home/$username/.local/share/fcitx5/themes
      fi
      if [ ! -d /home/$username/.local/share/fonts/ ];then
      mkdir /home/$username/.local/share/fonts
      fi
      if [ -f /home/$username/.local/share/fonts/98WB-0.otf ];then
      rm -rf /home/$username/.local/share/fonts/98WB*.otf
      fi
      cp -rf /opt/rime98wb/rime-data/* /home/$username/.local/share/fcitx5/rime
      cp -rf /opt/rime98wb/themes/* /home/$username/.local/share/fcitx5/themes
      cp -rf /opt/rime98wb/fonts/98WB*.otf /home/$username/.local/share/fonts
      chmod -R 777 /home/$username/.local/share/fcitx5
      chmod -R 777 /opt/rimetool
      cd /home/$username/.local/share/fonts
      mkfontscale
      mkfontdir
      fc-cache -fv
done
echo 'Please Redeploy Your Fcitx5-rime!'