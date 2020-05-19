#!/bin/bash

#input_file=manifest.tsv
#set -x


for num in {1..34}
do
prefix=$(awk -v a="$num" 'NR==a{print $1}' manifest.tsv)
sed "${num}s/control/case/" manifest.tsv > $prefix.manifest.tsv
done
