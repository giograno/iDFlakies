#!/bin/bash
maxTime="1000000"
rounds="20"
csvDir="icst-dataset/comprehensive-individual-split"
noJobs=10

# parallel jobs
find $csvDir -maxdepth 1 -type f -name "*.csv" | parallel -I% --jobs=$noJobs --max-args 1 sudo bash create_and_run_dockers.sh % $rounds $maxTime '>' log_{/.}.out