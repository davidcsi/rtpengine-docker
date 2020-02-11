# docker-rtpengine

## NOTE: This docke implementation is designed to be run on AWS on a debian buster.

Parts of this project were borrowed in part from ianblenke/rtpengine-docker

## Files

- `Dockerfile*` properly builds a first-class rtpengine runtime from source
- `Makefile` merely calls `docker-compose build` and `docker-compose up` for local iteration convenience.
- `README.md` is the file you are reading right now.
- `docker-compose.yml` is a v2 config example, with some pre-defined defaults and a list of environment variables.
- `rtpengine/` YOU MUST CLONE THIS.
- `run.sh` script converts these environment variables into rtpengine daemon command-line options.

## Note:

This repository assumes that the resultant docker container will be run as privileged with host network stack and will be responsible for building and running the kernel module as well as the iptables rules.

## Build and Run

Run composer

    docker-compose up

After this first build, though, you'll want to do subsequent updated builds using:

    docker-compose build
    docker-compose up --force-recreate

If you are running any other linux flavor as your docker host, this repository is not going to work for you as-is.

Why? There are two docker phases to be concerned with here.

- "build" time includes the `Dockerfile` and whatever is included in the docker image
- "run" time includes the built image above, and the `run.sh` script that is included inside that image.

Both the `Dockerfile` and the `run.sh` script will attempt to build a DKMS kernel module for rtpengine based on `uname -r`.




