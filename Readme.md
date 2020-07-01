Scripts to get Expansion Hunter Denovo running on Slurm based cluster, using container pulled from https://hub.docker.com/layers/boxcroft/expansionhunterdenovo/v1/images/sha256-69dc18311a1dd95ba9c022e185055ca6a7a725006efb90bab1c358b1d501ba7a?context=explore

# Usage
git clone this repo for the scripts. they will need to be edited for your own system.

download the docker image with singularity
```
module load singularity
singularity pull docker://boxcroft/expansionhunterdenovo:v1
```
start with STRprofiles.sh, then create the [manifest file] https://github.com/Illumina/ExpansionHunterDenovo/blob/master/documentation/03_Case_control_quickstart.md]. Then merge the STR profiles using the method you want (i.e. outlier or case control). There is a script for making every sample the only case and m aking all the others controls, if you wanted to do that. 
