#!/usr/bin/env bash

# Step 1
# Build docker image
docker build -t capstone-docker-image-app .

# Step 2
# List docker images
docker images