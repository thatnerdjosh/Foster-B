#!/bin/bash

# The name of the base image we created
IMAGE_NAME="foster-standalone-prealpha"

rm -Rfv $workspace/output
rm -Rfv $workspace/sources/cache
sudo rm -Rfv $workspace/logs

# delete the container
docker rm ${IMAGE_NAME}

# Remove old container image
docker image rm "${IMAGE_NAME}" 2>/dev/null
