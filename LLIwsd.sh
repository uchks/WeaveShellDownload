#!/usr/bin/env bash
clear

get_latest_weave_loader_version() {
  local wl_latest_version_url="https://api.github.com/repos/Weave-MC/Weave-Loader/releases/latest"
  local wlversion
  wlversion=$(curl -s "$wl_latest_version_url" | grep -oE '"tag_name": "([^"]+)' | cut -d'"' -f4)
  if [ $? -eq 0 ]; then
    wlversion="${wlversion#v}"
    echo "$wlversion"
  else
    echo "Failed to fetch Weave Loader version."
    exit 1
  fi
}

get_latest_lli_version() {
  local lli_latest_version_url="https://api.github.com/repos/Nilsen84/lunar-launcher-inject/releases/latest"
  local lliversion
  lliversion=$(curl -s "$lli_latest_version_url" | grep -oE '"tag_name": "([^"]+)' | cut -d'"' -f4)
  if [ $? -eq 0 ]; then
    lliversion="${lliversion#v}"
    echo "$lliversion"
  else
    echo "Failed to fetch Lunar Launcher Inject version."
    exit 1
  fi
}

echo "Attempting to end task: lunarclient"
killall -KILL lunarclient

mkdir -p ~/Documents/lunar-launcher-inject
cd ~/Documents/lunar-launcher-inject

echo "Before you open LLI:"
echo "Lunar's launcher must not be running at all, not even in the background."
echo "You must run 'chmod +x lli' whilst in the directory."

latest_lli_version=$(get_latest_lli_version)
if [[ "$OSTYPE" == "linux"* ]]; then
  curl -L -o lli "https://github.com/Nilsen84/lunar-launcher-inject/releases/download/v$latest_lli_version/lunar-launcher-inject-linux-$latest_lli_version"
elif [[ "$(uname)" == "Darwin" ]]; then
  curl -L -o lli "https://github.com/Nilsen84/lunar-launcher-inject/releases/download/v$latest_lli_version/lunar-launcher-inject-mac-$latest_lli_version"
else
  echo "Unsupported operating system."
  exit 1
fi

latest_weave_loader_version=$(get_latest_weave_loader_version)
curl -L -o Weave-Loader-Agent-$latest_weave_loader_version.jar "https://github.com/Weave-MC/Weave-Loader/releases/download/v$latest_weave_loader_version/Weave-Loader-Agent-$latest_weave_loader_version.jar"

mkdir -p ~/.weave/mods
echo "Put your mods in ~/.weave/mods"

echo "Lunar will open soon, just launch, and Weave will be attached."
chmod +x lli
./lli
