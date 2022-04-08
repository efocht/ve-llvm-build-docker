# Docker Image for LLVM Builds

## Build

```
docker build --network host --tag efocht/ve-llvm-build:veos2.11.1 .
docker image tag efocht/ve-llvm-build:veos2.11.1 efocht/ve-llvm-build:latest
```
## Push to docker hub
```
docker push efocht/ve-llvm-build:veos2.11.1
docker push efocht/ve-llvm-build:latest
```

## Tag image with fancy names
```
docker image tag efocht/ve-llvm-build:latest centos-worker:v1
```
