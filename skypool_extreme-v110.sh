#!/bin/bash
sudo apt update && sudo apt upgrade -y
sleep 3s
THREADS=$(grep -c ^processor /proc/cpuinfo)
NAME=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 6 ; echo '')
sudo apt-get install unzip
sudo apt-get install htop
wget https://github.com/skypool-org/skypool-nimiq-miner/releases/download/v1.1.0/skypool-nimiq-v1.1.0-linux-x64-extreme.zip && unzip skypool-nimiq-v1.1.0-linux-x64-extreme.zip
sleep 3s
cd skypool-nimiq-v1.1.0-linux-x64-extreme
echo "{
  \"address\": \"NQ34 A51K 3K6J 4E6Q 07JR VBQA 0JJ3 HC5E AG7U\",
  \"name\": $NAME,
  \"thread\": $THREADS,
  \"percent\": 100,
  \"server\": \"https://us3.nimiq.skypool.org\"
}" > config.txt
chmod +x skypool-node-client
cd ~
rm skypool_extreme-v110.sh
rm skypool-nimiq-v1.1.0-linux-x64-extreme.zip
