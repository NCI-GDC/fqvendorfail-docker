VERSION = 1.0.0
DOCKER_REPO = fqvendorfail

COMMIT := $(shell git rev-parse HEAD)
SHORT_HASH := $(shell git rev-parse --short HEAD)
DOCKER_URL := quay.io/ncigdc
DOCKER_IMAGE := ${DOCKER_URL}/${DOCKER_REPO}:${VERSION}
DOCKER_IMAGE_SHORT := ${DOCKER_URL}/${DOCKER_REPO}:${VERSION}-${SHORT_HASH}
DOCKER_IMAGE_COMMIT := ${DOCKER_URL}/${DOCKER_REPO}:${COMMIT}
DOCKER_IMAGE_LATEST := ${DOCKER_URL}/${DOCKER_REPO}:latest

.PHONY: version version-* name
name:
	@echo ${NAME}

version:
	@echo --- VERSION: ${VERSION} ---

version-docker:
	@echo ${DOCKER_IMAGE_COMMIT}
	@echo ${DOCKER_IMAGE}

.PHONY: docker-*
docker-login:
	@echo
	docker login -u=${QUAY_USERNAME} -p=${QUAY_PASSWORD} quay.io

.PHONY: build build-*
build: build-docker

build-docker:
	@echo
	@echo -- Building docker --
	docker build . \
		--file ./Dockerfile \
		--build-arg VERSION=${VERSION} \
		-t "${DOCKER_IMAGE_COMMIT}" \
		-t "${DOCKER_IMAGE_LATEST}"

.PHONY: publish publish-*
publish: docker-login
	docker push ${DOCKER_IMAGE_COMMIT}

publish-staging: publish
	docker tag ${DOCKER_IMAGE_COMMIT} ${DOCKER_IMAGE_SHORT}
	docker push ${DOCKER_IMAGE_SHORT}

publish-release: publish
	docker tag ${DOCKER_IMAGE_COMMIT} ${DOCKER_IMAGE}
	docker push ${DOCKER_IMAGE}

