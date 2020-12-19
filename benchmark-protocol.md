# Application

- substrate-api-sidecar v.0.12.0
- node v14.6.0

# Tools

- [seige (v4.0.7)](https://linux.die.net/man/1/siege)

# Run

``` bash
bash ./bench.sh
```

# Testing

We perform a regression test critical CC1 blocks. The ordering and content of
blocks are considered high difficulty as the span across runtime upgrades and
fetch the blocks of the upgrades, which are very large as they contain the wasm blob.

# Drawbacks

Currently the setup has siege on the same machine as Sidecar, which does not simulate
how a real client would interact with the service. Testing has
been run on a average consumer laptop, which could be improved by using a cloud
instance. The node used was the parity public node, which was a significant
geographically distance from the machine the testing was done on.

# Future testing

An optimal setup would have a test similar to this that could be triggered by
a CI pipeline. A warning could be given if any significant regression is detected.
Barring CI integration, benchmarking could be completed regularly to gauge the
how performance evolves. This testing should be done under best effort control
conditions. If conditions need to change, testing for previous releases should be
repeated in order to have more realistic relative values.


# Hardware

  Processor Name:	Intel Core i5
  Processor Speed:	1.4 GHz
  Number of Processors:	1
  Total Number of Cores:	4
  L2 Cache (per Core):	256 KB
  L3 Cache:	6 MB
  Hyper-Threading Technology:	Enabled
  Memory:	8 GB
  Boot ROM Version:	1037.120.87.0.0 (iBridge: 17.16.15290.0.0,0)
