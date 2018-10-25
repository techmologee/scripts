#!/usr/bin/env bash

sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install -y gcc g++ make nodejs screen curl git htop slurm tcptrack
curl -sL https://deb.nodesource.com/setup_9.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt-get install -y nodejs

curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install -y yarn build-essential

if [ -d "source" ]; then
    echo 'Existing source directory found. Updating to latest SushiPool codes.'
    cd source/miner
    git pull
else
    echo 'Cloning the latest SushiPool codes.'
    git clone https://github.com/Sushipool/source
    cd source/miner
fi
yarn

cd source/miner
THREADS=$(grep -c ^processor /proc/cpuinfo)
NAME=$(head /dev/urandom | tr -dc 0-9 | head -c 4 ; echo '')

echo "{
  \"address\": \"NQ14 APUB HLB7 56K9 6SC1 C1QD TAH2 M4PV MXA4\",
  \"name\": \"GC-$NAME\",
  \"threads\": $THREADS,
  \"server\": \"us.sushipool.com\"
}" > sushipool.conf
screen ./sushipool
