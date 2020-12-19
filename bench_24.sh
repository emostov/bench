
sleep 30
echo ---
echo Starting up Sidecar with clinic doctor
(
  cd ~/substrate-api-sidecar \
  SAS_SUBSTRATE_WS_URL=wss://rpc.polkadot.io \
  SAS_LOG_LEVEL=http \
  clinic doctor -- node build/src/main.js
)

sleep 30
echo ---
echo Start benchmarking about 24 hours
siege --file=sidecar_bench_urls.txt --delay=1 --log=siege-v2-1440.log --concurrent=2 --reps=1440

echo Done with all testing
echo ---