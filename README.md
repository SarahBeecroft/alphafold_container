# Quick start guide

## Do I need to build the container from scratch?
Nope, if you have Singularity installed (and loaded if that's relevant), you can just pull the container with 

`singularity pull docker://quay.io/sarahbeecroft9/alphafold:latest`


## What if I want to build the container for some reason?

The you can do the following on a machine where you can use sudo, and you've got Docker installed


```
git clone https://github.com/SarahBeecroft/alphafold_container.git
cd alphafold_container
sudo docker build -f docker/Dockerfile -t alphafold .
```

## How can I push the build to quay.io?
Follow these instructions
https://docs.quay.io/solution/getting-started.html


Then you can pull down with Singularity or Docker anytime!

See the Topaz.sh script for running the container on Topaz. 

Alphafold databases available on /group/data/alphafold (pre-Setonix) or /software/references/alphafold (Setonix)
