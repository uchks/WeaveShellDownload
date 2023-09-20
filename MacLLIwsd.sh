#!/bin/bash

echo "Attempting to end task: lunarclient"
killall -KILL lunarclient

mkdir -p ~/Documents/lunar-launcher-inject
cd ~/Documents/lunar-launcher-inject

echo "Before you open LLI:"
echo "Lunar's launcher must not be running at all, not even in the background."
echo "You must run 'chmod +x lli' whilst in the directory."

curl -L -o lli "https://github.com/Nilsen84/lunar-launcher-inject/releases/download/v1.3.0/lunar-launcher-inject-mac-1.3.0"
curl -L -o Weave-Loader-Agent.0.2.4.jar "https://github.com/Weave-MC/Weave-Loader/releases/download/v0.2.4/Weave-Loader-Agent-0.2.4.jar"

mkdir -p ~/.weave/mods
echo "Put your modifications in ~/.weave/mods"

echo "Lunar will open soon, just launch and weave will be attached."
chmod +x lli
timeout 5s ./lli
