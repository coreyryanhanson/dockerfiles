# docker-nvidia-dockerfile

Dockerfile to for running an instance of docker in a docker container but using the NVIDIA CUDA image as the base instead of Alpine.

When running make sure to pass the argument mounting to your hosts docker socket<br>
`-v /var/run/docker.sock:/var/run/docker.sock`

A blog post on what this is doing can be found [here](https://jpetazzo.github.io/2015/09/03/do-not-use-docker-in-docker-for-ci/).

_Note:  By changing the base image referenced in the dockerfile this code could easily be applied to create a plain Ubuntu Docker in Docker image._
