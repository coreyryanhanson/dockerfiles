# docker-ubuntu-dockerfile

Need to dockerize an app that uses docker, but have no clue how the heck to make it work in Alpine? Then this image is for you.

Also contains another version built on the Nvidia-CUDA image that can be accessed with the tag `cuda9-rt`

When running make sure to pass the argument mounting to your hosts docker socket<br>
`-v /var/run/docker.sock:/var/run/docker.sock`

A blog post on what this is doing can be found [here](https://jpetazzo.github.io/2015/09/03/do-not-use-docker-in-docker-for-ci/).
