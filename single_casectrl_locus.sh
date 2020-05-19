#!/bin/bash
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --time=00:10:00
#SBATCH --job-name=cram-locus
#SBATCH --partition=workq
#SBATCH --account=pawsey0001
#SBATCH --output=cram-locus-%j.log
#SBATCH --error=cram-locus-%J.log

module load singularity

singularity exec expansionhunterdenovo_latest.sif /ExpansionHunterDenovo/scripts/casecontrol.py locus \
        --manifest manifest.tsv \
        --multisample-profile broad_dataset1.multisample_profile.json \
        --output broad_dataset1.casecontrol_locus.tsv
