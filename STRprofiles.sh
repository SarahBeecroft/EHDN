#!/bin/bash
#SBATCH --nodes=2
#SBATCH --cpus-per-task=1
#SBATCH --time=24:00:00
#SBATCH --job-name=cram-str
#SBATCH --partition=workq 
#SBATCH --account=pawsey0001
#SBATCH --output=cram-str-%j.log
#SBATCH --error=cram-str-%J.log

echo "All jobs in this array have:"
echo "- SLURM_ARRAY_JOB_ID=${SLURM_ARRAY_JOB_ID}"
echo "- SLURM_ARRAY_TASK_COUNT=${SLURM_ARRAY_TASK_COUNT}"
echo "- SLURM_ARRAY_TASK_MIN=${SLURM_ARRAY_TASK_MIN}"
echo "- SLURM_ARRAY_TASK_MAX=${SLURM_ARRAY_TASK_MAX}"
 
echo "This job in the array has:"
echo "- SLURM_JOB_ID=${SLURM_JOB_ID}"
echo "- SLURM_ARRAY_TASK_ID=${SLURM_ARRAY_TASK_ID}"

# grab our filename from a directory listing
FILES=($(ls -1 *.cram))
FILENAME=${FILES[$SLURM_ARRAY_TASK_ID]}
echo "My input file is ${FILENAME}"

module load singularity

basedir=$(pwd)
container=/group/pawsey0339/sbeecroft/expansionhunterdenovo_v1.sif
ref=Homo_sapiens.GRCh37.dna.primary_assembly.fa
singularity exec ${container} /ExpansionHunterDenovo profile \
        --reads ${basedir}/${FILENAME} \
        --reference ${ref} \
        --output-prefix ${basedir}/str-profiles/${FILENAME} \
        --min-anchor-mapq 50 \
        --max-irr-mapq 40
