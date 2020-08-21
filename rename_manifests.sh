#!/bin/bash

manifest_file=$1
#set -x

#a loop which changes 'control' to 'case' for each sample one at a time, outputting a single new manifest for each sample
#in each manifest, only one sample is 'case' and the rest are all control
#need to change the number array to {1..x} where x is the number of samples you have
#max=$(ls *.json | wc -l)

for num in {1..33}
do
prefix=$(awk -v a="$num" 'NR==a{print $1}' manifest_file)
sed "${num}s/control/case/" $manifest_file > $prefix.manifest.tsv
done
