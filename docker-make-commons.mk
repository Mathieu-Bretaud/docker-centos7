##########################################################
# Makefile commons for Docker
#
# Creation : 30/06/2017
# Auteurs : Mathieu BRETAUD
#
# In your Makefile, you need to define :
#   tag_name
#   little_name
##########################################################

# Docker Registry
DOCKER_REGISTRY=phenix-registry.edc.carrefour.com/datascience

# Proxy configuration
PROXY_IP=10.54.64.5
PROXY_PORT=8080
PROXY=$(username):$(password)@$(PROXY_IP):$(PROXY_PORT)

# Build arguments
BUILD_ARGS=\
    --build-arg PROXY=$(PROXY) \
    --build-arg http_proxy=http://$(PROXY) \
    --build-arg https_proxy=https://$(PROXY) \
    --build-arg HTTP_PROXY=http://$(PROXY) \
    --build-arg HTTPS_PROXY=https://$(PROXY)

# Execution environment variables
EXEC_ENV=\
    -e http_proxy=http://$(PROXY) \
    -e https_proxy=https://$(PROXY) \
    -e no_proxy \
    -e HTTP_PROXY=http://$(PROXY) \
    -e HTTPS_PROXY=https://$(PROXY) \
    -e NO_PROXY

# Command to pass on a Docker
COMMAND=

build:
        docker build $(BUILD_ARGS) -t $(tag_name) .

exec:
        docker exec -it $(tag_name) /bin/bash

logs:
        docker logs $(tag_name)

push:
        docker push $(tag_name)

rm:
        docker rm -f $(tag_name) | true

rmi:
        docker rmi -f $(tag_name) | true

run:
        docker run $(EXEC_ENV) -d --name $(little_name) $(tag_name) $(COMMAND)

run-it:
        docker run $(EXEC_ENV) --rm -it --name $(little_name) $(tag_name) $(COMMAND)

stop:
        docker stop $(tag_name)