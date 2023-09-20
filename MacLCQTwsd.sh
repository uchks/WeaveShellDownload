#!/bin/bash

cd ~/Documents
mkdir lunar-client-qt
cd lunar-client-qt

curl -L -o mac.tar.gz "https://github.com/Youded-byte/lunar-client-qt/releases/download/v1.5.4/mac.tar.gz"
curl -L -o Weave-Loader-Agent-0.2.4.jar "https://github.com/Weave-MC/Weave-Loader/releases/download/v0.2.4/Weave-Loader-Agent-0.2.4.jar"
tar -xf mac.tar.gz
rm mac.tar.gz

cd ~/
mkdir -p .weave/mods

echo "Put your modifications in ~/.weave/mods."
echo "LCQT should open now, just add Weave as an agent. ~/Documents/lunar-client-qt/Weave-Loader-0.2.4.jar"
echo "LCQT also has a nice mod manager you can use if you wish."
echo "I would also recommend defining your Java runtime in the general tab to Lunar's bundled Java installation in ~/.lunarclient/jre"
echo "If there's an error here it's probably formatting because MacOS is weird and I don't have anyone to test with."
echo "If you could possibly help me resolve this issue by testing for me, it'd be greatly appreciated."

cd ~/Documents/lunar-client-qt/Lunar\ Client\ Qt/
./lunar-client-qt
