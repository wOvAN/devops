#!/bin/sh

# exit on errors
set -e
# verbose mode
# set -x

# Globals
# get REPO from CI variable
REPO="${CI_REGISTRY_IMAGE}"
if [ "$REPO" == "" ]; then
    echo "Repo is empty."
    exit 1;
fi

FILE="$1"
if [ "$FILE" == "" ]; then
    echo "No input file provided."
    exit 2;
fi

                                                 
# push image to local docker $REPO
function dock_mirror_image () {
    image=$1
    docker pull ${image}
    docker tag ${image} ${REPO}/${image}
    docker push ${REPO}/${image}
} 

# read image names, line by line skipping comments and empty lines
#
function process_file () {
    file=$1
    grep -v '^ *#' $file | while read -r line; do
	if [ ! -z "$line" ]; then

            echo "-------------------------------------------------------------"
	    echo "--> processing image: [${line}]"
	    dock_mirror_image "${line}"

	fi
    done
}

# do the job
process_file "$FILE"

