#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <time>" >&2
  exit 1
fi

time=$1
qsub -I -q PhiQ -l nodes=1:ppn=20 -l walltime=$time -A ipcc
