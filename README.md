# Docker build for John the Ripper

## Introduction

This repository contains a Docker file which creates a Docker image for
using John the Ripper.


## Usage

Pull the image:

```
docker pull -t nbaars/john-the-ripper
```

Running:

```
docker run -it nbaars/john-the-ripper -v .:/home/john/data
```

Once you have a shell in the container you can start running a command: