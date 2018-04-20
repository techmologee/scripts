#!/bin/bash
sudo apt update && sudo apt upgrade -y &&
sudo curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash - &&
sudo apt install -y nodejs &&
sudo apt install -y git &&
sudo apt install -y build-essential &&
sudo npm install -g pm2 &&
sudo npm install -g gulp &&
sudo npm install -g yarn &&
git clone https://github.com/nimiq-network/core &&
cd core &&
sudo yarn &&
cd clients/nodejs &&
THREADS=$(grep -c ^processor /proc/cpuinfo) &&
NAME=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 6 ; echo '') &&
env UV_THREADPOOL_SIZE=${THREADS} pm2 start index.js -- --dumb --miner=${THREADS} --statistics=10 --wallet-address="NQ34 A51K 3K6J 4E6Q 07JR VBQA 0JJ3 HC5E AG7U" --extra-data=${NAME}
