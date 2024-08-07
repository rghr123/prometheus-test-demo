#!/bin/sh

set -x

IMAGE_NAME="demo"
VERSION_ID="${BUILD_ID}"
IMAGE_ADDR="harbor.edu.cn/nju12/${IMAGE_NAME}"

docker build -f Dockerfile --build-arg jar_name=target/prometheus-test-demo-0.0.1-SNAPSHOT.jar -t ${IMAGE_NAME}:${VERSION_ID} .

docker tag  ${IMAGE_NAME}:${VERSION_ID}  ${IMAGE_ADDR}:${VERSION_ID}
docker login --username=nju12 --password=cloudnju12 harbor.edu.cn
docker push ${IMAGE_ADDR}:${VERSION_ID}
