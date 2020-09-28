maxTime="10000"
rounds="20"
csvDir="icst-dataset/comprehensive-individual-split"

for entry in "$csvDir"/*
do
  if [[ "$entry" == *csv ]]
  then
    slug=$(echo $(cat ${entry}) | cut -d',' -f1 | rev | cut -d'/' -f1-2 | rev)
    echo "Computing: $slug"
    outFile=$(echo ${slug} | tr / .)
    sudo nohup bash create_and_run_dockers.sh $entry $rounds $maxTime > $outFile.out 2>&1 &
  else
    continue
  fi
done
