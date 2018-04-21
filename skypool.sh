#!/bin/bash
sudo apt update && sudo apt upgrade -y
sleep 3s
THREADS=$(grep -c ^processor /proc/cpuinfo)
NAME=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 6 ; echo '')
sudo apt-get install unzip
sudo apt-get install htop
wget https://github.com/skypool-org/skypool-nimiq-miner/releases/download/v1.1.0/skypool-nimiq-v1.1.0-linux-x64-extreme.zip && unzip skypool-nimiq-v1.1.0-linux-x64-extreme.zip
sleep 3s
wget https://github.com/skypool-org/skypool-nimiq-miner/releases/download/v1.1.0/skypool-nimiq-v1.1.0-linux-x64-fast.zip && unzip skypool-nimiq-v1.1.0-linux-x64-fast.zip
cd skypool-nimiq-v1.1.0-linux-x64-extreme
echo "{
  \"address\": \"NQ34 A51K 3K6J 4E6Q 07JR VBQA 0JJ3 HC5E AG7U\",
  \"name\": \"$NAME\",
  \"thread\": $THREADS,
  \"percent\": 100,
  \"server\": \"https://us3.nimiq.skypool.org\"
}" > config.txt
cd ~/skypool-nimiq-v1.1.0-linux-x64-fast
echo "{
  \"address\": \"NQ34 A51K 3K6J 4E6Q 07JR VBQA 0JJ3 HC5E AG7U\",
  \"name\": \"$NAME\",
  \"thread\": $THREADS,
  \"percent\": 100,
  \"server\": \"https://us3.nimiq.skypool.org\"
}" > config.txt
cd ~
rm skypool-nimiq-v1.1.0-linux-x64-fast.zip
rm skypool-nimiq-v1.1.0-linux-x64-extreme.zip
rm skypool.sh
