#!/bin/bash
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --time=00:10:00
#SBATCH --job-name=cram-outlier-motif
#SBATCH --partition=workq
#SBATCH --account=pawsey0001
#SBATCH --output=cram-outlier-motif-%j.log
#SBATCH --error=cram-outlier-motif-%J.log

module load singularity

singularity exec expansionhunterdenovo_latest.sif /ExpansionHunterDenovo/scripts/outlier.py motif \
        --manifest manifest.tsv \
        --multisample-profile broad_dataset1.multisample_profile.json \
        --output broad_dataset1.casecontrol_outlier_motif.tsv
