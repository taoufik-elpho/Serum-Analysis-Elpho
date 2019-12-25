#!/bin/bash

. $HOME/.bashrc

HOMEDIR="/home/taoufik/data"
source activate proteos

## Nextflowscript here
cd ${HOMEDIRE}
##rm -R  /home/taoufik/data/work/
rm -R  /home/taoufik/data/LOG/
/home/taoufik/data/combiningpipeline/nextflow -log ${HOMEDIR}/combiningpipeline/LOG/SUI.log \
    run ${HOMEDIR}/combiningpipeline/SUI_Combining.nf \
    -c ${HOMEDIR}/combiningpipeline/SUI_Combining.config \
    -w ${HOMEDIR}/combiningpipeline/work \
    -profile slurm
