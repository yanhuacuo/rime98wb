#!/bin/bash
sudo chmod 755 -R ./makePackage/rime98wb
dpkg -b ./makePackage/rime98wb ./makePackage
sudo chmod 777 ./makePackage/rime98wb*.deb
echo "Done!"