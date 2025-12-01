# Specify the base image that we're building the image on top of
FROM alpine:latest

# Build the image as root user
USER root

# This sets the default working directory when a container is launched from the image
WORKDIR /home/docker

# Install system dependencies
RUN apk update && \
    apk add --no-cache \
        build-base \
        python3-dev \
        musl-dev \
        bash

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Create docker user
RUN adduser -D docker
# Run as docker user by default when the container starts up
USER docker

# COPY <path on host> <path in container image>
COPY README.md .
COPY pyproject.toml .
COPY uv.lock .
COPY src ./src

RUN uv add scikit-learn

# only exists during build time 
ARG VERSION=0.1.0
RUN echo "VERSION ARG: $VERSION"

ENV APP_ENV=dev

# tell docker that I need this port 
EXPOSE 8000

# CMD is run when container starts
# Can override it in run command

# CMD ["bash"]
CMD ["uv", "run", "src/holymeow/main.py"]

# ENTRYPOINT defines a command thats always run on container start
# If ENTRYPOINT is present then CMD provides inputs to the ENTRYPOINT
# Can override these arguments in run command 

# ENTRYPOINT ["uv", "run"]
# CMD ["src/holymeow/main.py"]

