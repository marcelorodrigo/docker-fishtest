marcelorodrigo/fishtest
================================
Docker image to run and contribute with [FishTest](https://github.com/glinscott/fishtest) suite.


[![Docker Stars](https://img.shields.io/docker/stars/marcelorodrigo/fishtest.svg?maxAge=2592000)]()
[![Docker Pulls](https://img.shields.io/docker/pulls/marcelorodrigo/fishtest.svg?maxAge=2592000)]()
[![](https://images.microbadger.com/badges/image/marcelorodrigo/fishtest.svg)](http://microbadger.com/images/marcelorodrigo/fishtest)
[![Let's play Chess](https://img.shields.io/badge/let's%20play-chess-orange.svg)]()

Features
---
- Based on Ubuntu 22.04 LTS
- Updates on the fly (every time you run your docker container, you get the latest code from fishtest repository)
- Configurable regarding concurrency and credentials

Running FishTest
--------------------------------------

## Secrets
You must configure concurrency, username and password using Docker Secrets.
This is a safer way to store your credentials:

```
docker secret create fishtest \
    "$(echo -e "concurrency=1\nusername=yourusername\npassword=yourpassword")"
```

Running with more CPU Cores
--------------------------------------

You can start the test suite with more CPU Cores with more concurrency. By default this image starts with one single
core.


Troubleshooting
--------------------------------------

Some docker machines are configured to use only one CPU, and perhaps you got this error:

    Not enough CPUs to run fishtest (it requires at least two)
    
In this case you need to modify your docker machine to use more than one CPU cores or running these
commands:

    docker run --cpus=2 marcelorodrigo/fishtest

We can also specify the priority of CPU allocation.
The default is 1024, and higher numbers are higher priority:

    docker run --cpus=2 --cpu-shares=2000 marcelorodrigo/fishtest

Similar to the memory reservation, CPU shares play the main role when computing power is scarce and needs to be
divided between competing processes.
