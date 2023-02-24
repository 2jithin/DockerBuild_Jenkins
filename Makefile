IMAGE_NAME=simpleapachehttp
IMAGE_TAG=latest

.PHONY: build tag push

build:
    docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .

tag:
    docker tag $(IMAGE_NAME):$(IMAGE_TAG) my-registry.com/$(IMAGE_NAME):$(IMAGE_TAG)

push:
    docker push my-registry.com/$(IMAGE_NAME):$(IMAGE_TAG)


#make build tag push
