#!/bin/sh



echo ---
echo Starting up Sidecar
(
  cd /Users/zeke/Documents/parity/substrate-api-sidecar \
  && SAS_SUBSTRATE_WS_URL=wss://rpc.polkadot.io \
  SAS_LOG_LEVEL=http \
  clinic doctor -- node build/src/main.js
)

sleep 30
echo ---
echo Start benchmarking 1 request per sec
siege --file=sidecar_bench_urls.txt --delay=1 --log=siege-v2-c1.log --concurrent=1 --reps=once

sleep 30
echo ---
echo Start benchmarking 2 request per sec
siege --file=sidecar_bench_urls.txt --delay=1 --log=siege-v2-c2.log --concurrent=2 --reps=once

sleep 30
echo ---
echo Start benchmarking 3 request per sec
siege --file=sidecar_bench_urls.txt --delay=1 --log=siege-v2-c3.log --concurrent=3 --reps=once

echo Done with all testing
echo ---