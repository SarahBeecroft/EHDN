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

container=/group/pawsey0339/sbeecroft/expansionhunterdenovo_v1.sif

singularity exec $container /ExpansionHunterDenovo-v0.8.7-linux_x86_64/scripts/casecontrol.py locus \
        --manifest manifest.tsv \
        --multisample-profile broad_dataset1.multisample_profile.json \
        --output broad_dataset1.casecontrol_locus.tsv
