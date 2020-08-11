#!/bin/bash
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --time=00:10:00
#SBATCH --job-name=batch_outlier_locus
#SBATCH --partition=workq
#SBATCH --account=pawsey0001
#SBATCH --output=batch_outlier_locus-%j.log
#SBATCH --error=batch_outlier_locus-%J.log
#SBATCH --array=1-34

echo "All jobs in this array have:"
echo "- SLURM_ARRAY_JOB_ID=${SLURM_ARRAY_JOB_ID}"
echo "- SLURM_ARRAY_TASK_COUNT=${SLURM_ARRAY_TASK_COUNT}"
echo "- SLURM_ARRAY_TASK_MIN=${SLURM_ARRAY_TASK_MIN}"
echo "- SLURM_ARRAY_TASK_MAX=${SLURM_ARRAY_TASK_MAX}"
 
echo "This job in the array has:"
echo "- SLURM_JOB_ID=${SLURM_JOB_ID}"
echo "- SLURM_ARRAY_TASK_ID=${SLURM_ARRAY_TASK_ID}"

# grab our filename from a directory listing
FILES=($(ls -1 D*.manifest.tsv))
FILENAME=${FILES[$SLURM_ARRAY_TASK_ID]}
echo "My input file is ${FILENAME}"

module load singularity

singularity exec expansionhunterdenovo_latest.sif /ExpansionHunterDenovo/scripts/outlier.py locus \
        --manifest ${FILENAME} \
        --multisample-profile broad_dataset1.multisample_profile.json \
        --output ${FILENAME}.outlier_locus.tsv
