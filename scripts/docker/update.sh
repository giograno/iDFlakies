#!/bin/bash

SCRIPT_USERNAME="idflakies"
TOOL_REPO="iDFlakies"
BSC_TRANSFORM="bsc-sourcetransform"

# Script that updates Git repositories of tooling code to latest and rebuilds

cd /home/$SCRIPT_USERNAME/testrunner/ && git pull && /home/$SCRIPT_USERNAME/apache-maven/bin/mvn clean install -B
cd /home/$SCRIPT_USERNAME/$TOOL_REPO/ && git pull && /home/$SCRIPT_USERNAME/apache-maven/bin/mvn clean install -B

# Fetches the module that changes the code for the performances and builds it
cd /home/$SCRIPT_USERNAME/$TOOL_REPO/ && git submodule update --init --recursive
cd /home/$SCRIPT_USERNAME/$TOOL_REPO/$BSC_TRANSFORM && /home/$SCRIPT_USERNAME/apache-maven/bin/mvn clean package