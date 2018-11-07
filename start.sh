#!/bin/bash
cd beepminer-0.3.3
THREADS=$(grep -c ^processor /proc/cpuinfo)
NAME=$(head /dev/urandom | tr -dc 0-9 | head -c 4 ; echo '')
env UV_THREADPOOL_SIZE=$THREADS ./miner -miner=$THREADS --statistics=10 --wallet-address="NQ13 KDKE C869 FTAR R9FA TD1V X7U7 F0PH FTNK" --extra-data=GC-$NAME
