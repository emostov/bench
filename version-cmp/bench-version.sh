#!/bin/sh

echo -n "Enter sidecar version: "
read SASVERSION
echo "You entered sidecar version ${SASVERSION}"

echo -n "Enter blocks endpoint version (0 or 1): "
read BLOCKVERSION
echo "You entered block endpoint version ${BLOCKVERSION}"

echo ---
echo Start benchmarking 2 request per sec
siege --file=sidecar_bench_urls-v${BLOCKVERSION}.txt --delay=1 --log=siege-c2-sas-${SASVERSION}.log --concurrent=2 --reps=once


echo Done with all testing