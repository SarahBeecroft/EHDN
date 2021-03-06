Scripts to get Expansion Hunter Denovo running on Slurm based cluster, using container pulled from https://hub.docker.com/layers/boxcroft/expansionhunterdenovo/v1/images/sha256-69dc18311a1dd95ba9c022e185055ca6a7a725006efb90bab1c358b1d501ba7a?context=explore

# Usage
## Installation 
git clone this repo for the scripts. they will need to be edited for your own system.

download the docker image with singularity (placed in group dir on my pawsey account)
```
module load singularity
singularity pull docker://boxcroft/expansionhunterdenovo:v1
```

## Step 1
Make STR profiles for your input samples (and controls if necessary) using `STRprofiles.sh`. This uses cram files but can be modified to use bam files (just change all instances of cram to bam). This will run your jobs in parallel via the job scheduler, and completes in less than an hour. If you want to put all output files into a new dir (e.g. str-profiles) you need to make that dir first.

## Step 2
Make the manifest file https://github.com/Illumina/ExpansionHunterDenovo/blob/master/documentation/03_Case_control_quickstart.md 

## Step 3
Merge the STR profiles using merge.sha

## Step 4
perform the wanted analysis (i.e. outlier or case control). There is a script for making every sample the only case and making all the others controls, if you want to do that. this requires `rename_manifests.sh`.
### Script explanations
`merge.sh` --> merges the STR profiles to create one large profile. Does not perform any analysis.

`rename_manifests.sh` --> creates a seperate manifest file for each sample. Using this method, each manifest has only one sample marked as 'affected' and all the rest are 'controls/unaffacted'.  This is the expected input for the scripts prefixed with multi.

`single_casectrl_locus.sh` --> performs case/control locus analysis on a single manifest

`single_casectrl_motif.sh` --> performs case/control motif analysis on a single manifest

`single_outlier_locus.sh` --> performs outlier locus analysis on a single manifest

`single_outlier_motif.sh` --> performs outlier motif analysis on a single manifest

`multi_casectrl_locus.sh` --> performs case/control locus analysis multiple manifests, where each manifest has only one affected individual (made from `rename_manifests.sh`)

`multi_casectrl_motif.sh` --> performs case/control motif analysis multiple manifests, where each manifest has only one affected individual (made from `rename_manifests.sh`)

`multi_outlier_locus.sh` --> performs outlier locus analysis on multiple manifests, where each manifest has only one affected individual (made from `rename_manifests.sh`)

`multi_outlier_motif.sh` --> performs outlier motif analysis on multiple manifests, where each manifest has only one affected individual (made from `rename_manifests.sh`)
