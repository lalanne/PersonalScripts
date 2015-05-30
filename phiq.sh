#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <time> <project>" >&2
  exit 1
fi

time=$1
proj=$2

qsub -I -q PhiQ -l nodes=1:ppn=20 -l walltime=$time -A $proj



