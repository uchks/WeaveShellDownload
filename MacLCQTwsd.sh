#!/bin/bash

cd ~/Documents
mkdir lunar-client-qt
cd lunar-client-qt

curl -L -o mac.tar.gz "https://github.com/Youded-byte/lunar-client-qt/releases/download/v1.5.4/mac.tar.gz"
curl -L -o Weave-Loader-Agent-0.2.4.jar "https://github.com/Weave-MC/Weave-Loader/releases/download/v0.2.4/Weave-Loader-Agent-0.2.4.jar"
tar -xf mac.tar.gz
timeout 1s rm mac.tar.gz

cd ~/
mkdir -p .weave/mods

echo "Put your modifications in ~/.weave/mods."
echo "LCQT should open now, just add Weave as an agent. ~/Documents/lunar-client-qt/Weave-Loader-0.2.4.jar"
echo "LCQT also has a nice mod manager you can use if you wish."
echo "I would also recommend defining your Java runtime in the general tab to Lunar's bundled Java installation in ~/.lunarclient/jre"

cd ~/Documents/lunar-client-qt/Lunar\ Client\ Qt
./lunar-client-qt
