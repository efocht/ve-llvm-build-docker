# Docker Image for LLVM Builds

## Build

```
docker build --network host --tag efocht/ve-llvm-build:veos2.8.3 .
docker image tag efocht/ve-llvm-build:veos2.8.3 efocht/ve-llvm-build:latest
```
## Push to docker hub
```
docker push efocht/ve-llvm-build:veos2.8.3
docker push efocht/ve-llvm-build:latest
```

## Tag image with fancy names
```
docker image tag efocht/ve-llvm-build:latest centos-worker:v1
```
