#!/bin/sh
for ch in `seq 13 62`; do
	dvbv5-zap -C JP -a 0 -c ./dvbv5_channels_all.conf -r -P DVBC_${ch} -t 10 -o ${ch}.ts
done
for ch in `seq 13 63`; do
	dvbv5-zap -C JP -a 0 -c ./dvbv5_channels_all.conf -r -P C${ch} -t 10 -o C${ch}.ts
done
