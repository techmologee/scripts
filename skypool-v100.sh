#!/bin/bash

cd $HOME/Downloads
wget https://github.com/skypool-org/skypool-nimiq-miner/releases/download/v1.0.0/skypool-nimiq-v1.0.0-linux-x64-compat.zip && unzip skypool-nimiq-v1.0.0-linux-x64-compat.zip
cd skypool-nimiq-v1.0.0-linux-x64-compat
echo "{
  \"address\": \"NQ34 A51K 3K6J 4E6Q 07JR VBQA 0JJ3 HC5E AG7U\",
  \"name\": \"*\",
  \"thread\": 0,
  \"percent\": 100,
  \"server\": \"https://us3.nimiq.skypool.org\"
}" > config.txt
