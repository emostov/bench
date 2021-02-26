#!/bin/sh

# wrk -d1m \ # Run the teset for 60 seconds
#   -t4  \ # Use 2 threads to manage all the requests
#   -c39 \ # A total of 39 connections, so eessentially 39 concurrent workers which should amount
# to each block getting requested at least once
#   --timeout 30s \ # Record a request as timedout if it doesn't respond within 30 seconds
#   -s polkadot-cc1.lua \ # Use a lua script that covers a fixed set of blocks from around launch
#   http://127.0.0.1:8080 # Assume SAS is runnig on the default port

wrk -d1m -t4 -c39 --timeout 30s -s polkadot-cc1.lua http://127.0.0.1:8080 