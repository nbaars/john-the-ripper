# Docker build for John the Ripper

## Introduction

This repository contains a Docker file which creates a Docker image for
using John the Ripper.

## Usage

Pull the image:

```shell script
docker pull -t nbaars/john-the-ripper
```

Running:

```shell script
docker run -it nbaars/john-the-ripper -v ${PWD}/examples:/home/john/examples
```

Once you have a shell in the container you can start running a command:

