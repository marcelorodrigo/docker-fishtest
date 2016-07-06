marcelorodrigo/fishtest
================================
Docker image to run and contribute with FishTest (https://github.com/glinscott/fishtest) suite


[![Docker Stars](https://img.shields.io/docker/stars/marcelorodrigo/fishtest.svg?maxAge=2592000)]()
[![Docker Pulls](https://img.shields.io/docker/pulls/marcelorodrigo/fishtest.svg?maxAge=2592000)]()
[![Let's play Chess](https://img.shields.io/badge/let's%20play-chess-orange.svg)]()

Running FishTest
--------------------------------------

Start your image using your username and password to your container:

    docker run -e username=yourUserName -e password=yourPassword marcelorodrigo/fishtest
    
Running with more CPU Cores
--------------------------------------

You can start the test suite with more CPU Cores with more concurrency. By default this image starts with one single core, in this example below you can start the container with 4 cores:

    docker run -e concurrency=4 -e username=yourUserName -e password=yourPassword marcelorodrigo/fishtest


Troubleshooting
--------------------------------------

Some docker machines are configured to use only one CPU, and perhaps you got this error:

    Not enough CPUs to run fishtest (it requires at least two)
    
In this case you need to modify your docker machine to use more than one CPU directly on Virtualbox or running these commands:

    docker-machine stop
    VBoxManage modifyvm default --cpus 2
    docker-machine start
