#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Step 1:
# Create dockerpath
dockerpath=0147896325/capstone-docker-image-app

# Step 2:
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker tag capstone-docker-image-app $dockerpath

# Step 3:
# Push image to a docker repository
docker push $dockerpath:latest

# Step 4
# List docker images
docker images