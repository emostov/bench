#!/bin/sh


# PID of this script
PID=$!

echo sleep 30
sleep 30
echo ---
echo Start benchmarking 1 request per sec
siege --file=sidecar_bench_urls.txt --delay=1 --log=siege-v2.log --concurrent=1 --reps=150

echo sleep 30
sleep 30
echo ---
echo Start benchmarking 5 request per sec
siege --file=sidecar_bench_urls.txt --delay=1 --log=siege-v2.log --concurrent=5 --reps=150

echo sleep 30
sleep 30
echo ---
echo Start benchmarking 1 request per sec
siege --file=sidecar_bench_urls.txt --delay=1 --log=siege-v2.log --concurrent=1 --reps=150

echo ---
echo cooldown
sleep 300

echo Done with all testing
echo ---

kill $PID