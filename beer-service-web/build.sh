#!/bin/bash

TAG=0.1

# exit immediately on failure
set -e

# build linux binary
CGO_ENABLED=0 GOOS=linux GOARCH=386 go build -ldflags="-s -w" -o beer-service-web-linux

# build docker image
docker build -t rimusz/beer-service-web:$TAG -t rimusz/beer-service-web:latest .

# push to docker registry
docker push rimusz/beer-service-web
