#!/bin/bash
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --time=00:10:00
#SBATCH --job-name=annotate
#SBATCH --partition=workq
#SBATCH --account=pawsey0001
#SBATCH --output=annotate-%j.log
#SBATCH --error=annotate-%J.log
#SBATCH --array=0-75

echo "All jobs in this array have:"
echo "- SLURM_ARRAY_JOB_ID=${SLURM_ARRAY_JOB_ID}"
echo "- SLURM_ARRAY_TASK_COUNT=${SLURM_ARRAY_TASK_COUNT}"
echo "- SLURM_ARRAY_TASK_MIN=${SLURM_ARRAY_TASK_MIN}"
echo "- SLURM_ARRAY_TASK_MAX=${SLURM_ARRAY_TASK_MAX}"
 
echo "This job in the array has:"
echo "- SLURM_JOB_ID=${SLURM_JOB_ID}"
echo "- SLURM_ARRAY_TASK_ID=${SLURM_ARRAY_TASK_ID}"

# grab our filename from a directory listing
FILES=($(ls -1 D*_locus.tsv))
FILENAME=${FILES[$SLURM_ARRAY_TASK_ID]}
echo "My input file is ${FILENAME}"



bash annotate_ehdn.sh \
    --ehdn-results $FILENAME \
    --ehdn-annotated-results $FILENAME.annotated.tsv \
    --annovar-annotate-variation /group/pawsey0339/sbeecroft/annovar/annotate_variation.pl \
    --annovar-humandb /group/pawsey0339/sbeecroft/annovar/humandb \
    --annovar-buildver hg38
