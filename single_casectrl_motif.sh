#!/bin/bash
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --time=00:10:00
#SBATCH --job-name=cram-motif
#SBATCH --partition=workq
#SBATCH --account=pawsey0001
#SBATCH --output=cram-motif-%j.log
#SBATCH --error=cram-motif-%J.log

module load singularity

singularity exec expansionhunterdenovo_latest.sif /ExpansionHunterDenovo/scripts/outlier.py motif \
        --manifest manifest.tsv \
        --multisample-profile broad_dataset1.multisample_profile.json \
        --output broad_dataset1.casecontrol_motif.tsv
