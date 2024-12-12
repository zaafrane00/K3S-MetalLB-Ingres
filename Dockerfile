FROM gitlab/gitlab-runner:alpine

# Install Docker inside the GitLab Runner container
RUN apk update && \
    apk add --no-cache \
    docker \
    bash

# Set Docker CLI path
ENV DOCKER_CLI_EXPERIMENTAL=enabled

# Allow privileged mode to enable Docker-in-Docker (DinD)
RUN mkdir -p /certs/client

RUN chmod +x entrypoint.sh