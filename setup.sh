#!/bin/bash
cd source/miner
THREADS=$(grep -c ^processor /proc/cpuinfo)
NAME=$(head /dev/urandom | tr -dc 0-9 | head -c 4 ; echo '')

echo "{
  \"address\": \"NQ13 KDKE C869 FTAR R9FA TD1V X7U7 F0PH FTNK\",
  \"name\": \"GC-$NAME\",
  \"threads\": $THREADS,
  \"server\": \"us.sushipool.com\"
}" > sushipool.conf
screen ./sushipool
