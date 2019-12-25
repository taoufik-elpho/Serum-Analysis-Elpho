#!/bin/bash

. $HOME/.bashrc

HOMEDIR="/home/taoufik/data"
source activate proteos

## Nextflowscript here
cd ${HOMEDIRE}
rm -R  /home/taoufik/data/work/
rm -R  /home/taoufik/data/LOG/
/home/taoufik/data/nextflow -log ${HOMEDIR}/LOG/SUI.log \
    run ${HOMEDIR}/SUI.nf \
    -c ${HOMEDIR}/SUI.config \
    -w ${HOMEDIR}/work \
    -profile slurm
