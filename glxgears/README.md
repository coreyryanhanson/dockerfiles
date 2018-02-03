# glxgears-dockerfile
Installs glxgears and [glmark2](https://github.com/glmark2/glmark2) on the NVIDIA opengl base image for testing OpenGL and X11 performance on images with NVIDIA docker.

Once you have [docker](https://github.com/docker/docker-ce), [NVIDIA-docker](https://github.com/NVIDIA/nvidia-docker), and the NVIDIA drivers installed on your host, you can run by copying and pasting this:

`nvidia-docker run -ti --rm \`<br>
`-v /tmp/.X11-unix:/tmp/.X11-unix \`<br>
`-e DISPLAY=unix$DISPLAY \`<br>
`--name glxgears \`<br>
`coreyhanson/glxgears-nvidia`

Once inside the container type `glxgears` or `glmark2` to run the utils.
