# Docker Image for LLVM Builds

## Build

```
VEOS=2.11.1
docker build --network host --tag efocht/ve-llvm-build:veos$VEOS .
docker image tag efocht/ve-llvm-build:veos$VEOS efocht/ve-llvm-build:latest
```
## Push to docker hub
```
docker push efocht/ve-llvm-build:veos$VEOS
docker push efocht/ve-llvm-build:latest
```

## Tag image with fancy names
```
docker image tag efocht/ve-llvm-build:latest centos-worker:v1
```
