#!/bin/bash

SCRIPT_USERNAME="idflakies"
TOOL_REPO="iDFlakies"
BSC_TRANSFORM="bsc-sourcetransform"

echo "Running the performance injection modification"

script_to_run="/home/$SCRIPT_USERNAME/$TOOL_REPO/scripts/docker/performance_injection.sh"

slug=$1
commit_hash=$2

PROJECT_DIR="/home/$SCRIPT_USERNAME/${slug}"

#su - "$SCRIPT_USERNAME" -c "java -jar /home/$SCRIPT_USERNAME/$TOOL_REPO/$BSC_TRANSFORM/target/bsc-sourcetransform-0.0.1-jar-with-dependencies.jar $PROJECT_DIR $PROJECT_DIR/mes.txt $slug $commit_hash"
java -jar /home/$SCRIPT_USERNAME/$TOOL_REPO/$BSC_TRANSFORM/target/bsc-sourcetransform-0.0.1-jar-with-dependencies.jar $PROJECT_DIR $PROJECT_DIR/mes.txt $slug $commit_hash

if [ $? -eq 0 ]
then
  echo "The performance injection was successful"
  exit 0
else
  echo "The performance injection failed" >&2
  exit 1
fi