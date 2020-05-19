#!/bin/bash
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --time=10:00:00
#SBATCH --job-name=cram-merge
#SBATCH --partition=workq
#SBATCH --account=pawsey0001
#SBATCH --output=cram-merge-%j.log
#SBATCH --error=cram-merge-%J.log

module load singularity
basedir=/scratch/pawsey0339/sbeecroft/broad
container=/group/pawsey0339/sbeecroft/expansion-hunter-denovo_v0.8.7.sif
ref=${basedir}/Homo_sapiens_assembly38.fasta

singularity exec ${container} /ExpansionHunterDenovo merge \
        --reference $ref \
        --manifest manifest.tsv \
        --output-prefix broad_dataset1
