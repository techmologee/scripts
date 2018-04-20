#!/bin/bash
THREADS=$(grep -c ^processor /proc/cpuinfo)
NAME=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 6 ; echo '')
sudo apt-get install unzip
sudo apt-get install htop
wget https://github.com/skypool-org/skypool-nimiq-miner/releases/download/v1.1.0/skypool-nimiq-v1.1.0-linux-x64-fast.zip && skypool-nimiq-v1.1.0-linux-x64-fast.zip
sleep 3s
cd skypool-nimiq-v1.1.0-linux-x64-fast
echo "{
  \"address\": \"NQ34 A51K 3K6J 4E6Q 07JR VBQA 0JJ3 HC5E AG7U\",
  \"name\": $NAME,
  \"thread\": $THREADS,
  \"percent\": 100,
  \"server\": \"https://us3.nimiq.skypool.org\"
}" > config.txt
cd ~
rm skypool_fast-v110.sh
rm skypool-nimiq-v1.1.0-linux-x64-fast.zip
