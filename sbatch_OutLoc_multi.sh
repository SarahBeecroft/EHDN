#!/bin/bash
 
# get count of files in this directory
NUMFILES=$(ls -1 D*.manifest.tsv | wc -l)
# subtract 1 as we have to use zero-based indexing (first element is 0)
ZBNUMFILES=$(($NUMFILES - 1))
# submit array of jobs to SLURM
if [ $ZBNUMFILES -ge 0 ]; then
  sbatch --array=0-$ZBNUMFILES multi_outlier_locus.sh
else
  echo "No jobs to submit, since no input files in this directory."
fi
