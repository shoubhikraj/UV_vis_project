#!/bin/bash
#$ -q all.q
#$ -N xtbstdarun
#$ -l fat
#$ -pe smp 4
#$ -o $HOME/logs
#$ -S /bin/bash -cwd -j y

set host=`hostname -s`
set OMP_NUM_THREADS=4
module load stda

cd $SGE_O_WORKDIR

for i in {0..19..1}
  do
    echo "Processing bench-${i}.xyz"
    xtb4stda bench-${i}.xyz > bench-${i}.xtb4stda
    stda -xtb -e 10 > bench-${i}-stda.out
    rm -f ./wfn.xtb
    rm -f ./charges
    rm -f ./charges3
  done
