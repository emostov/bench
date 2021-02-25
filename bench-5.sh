#!/bin/sh


# PID of this script
PID=$!

# echo ---
# echo Starting up Sidecar
# (
#   cd /Users/zeke/Documents/parity/substrate-api-sidecar \
#   && yarn build \
#   && SAS_SUBSTRATE_WS_URL=wss://rpc.polkadot.io \
#   SAS_LOG_LEVEL=http \
#   clinic doctor -- node build/src/main.js
# )

echo sleep 30
sleep 30
echo ---
echo Start benchmarking 1 request per sec
siege --file=sidecar_bench_urls.txt --delay=1 --log=siege-v2.log --concurrent=1 --reps=once

echo sleep 30
sleep 30
echo ---
echo Start benchmarking 2 request per sec
siege --file=sidecar_bench_urls.txt --delay=1 --log=siege-v2.log --concurrent=2 --reps=once

echo sleep 30
sleep 30
echo ---
echo Start benchmarking 3 request per sec
siege --file=sidecar_bench_urls.txt --delay=1 --log=siege-v2.log --concurrent=3 --reps=once

echo sleep 30
sleep 30
echo ---
echo Start benchmarking 4 request per sec
siege --file=sidecar_bench_urls.txt --delay=1 --log=siege-v2.log --concurrent=4 --reps=once

echo sleep 30
sleep 30
echo ---
echo Start benchmarking 1 request per sec
siege --file=sidecar_bench_urls.txt --delay=1 --log=siege-v2.log --concurrent=1 --reps=once

echo ---
echo cooldown
sleep 180

echo Done with all testing
echo ---

kill $PID