# ccminer-nvidia-dockerfile
Sets up an environment to build [tpruvot's fork of CC Miner](https://github.com/tpruvot/ccminer) for NVIDIA Cuda mining through the use of a [docker](https://github.com/docker/docker-ce) container.

Use this if you are running a non-Ubuntu distro of Linux and need a way around conflicting dependencies. If you are running a Mac or Windows this repo will not help you.

Tested on CentOS 7.4 using NVIDIA GTX980M.

**Installation steps:**

1. Download and install the [latest version of docker](https://docs.docker.com/engine/installation/).<br>
    _It works similarly to using virtual machines, but unlike VMs there is very little sacrifice in speed._
<br>

2. Download and install the [latest version of the Docker Engine Utility for NVIDIA GPUs](https://github.com/NVIDIA/nvidia-docker).<br>
    _This will allow the docker container to integrate with your locally installed NVIDIA GPU._
<br>

3. Create a directory and [download ccminer into it as a tarfile](https://github.com/tpruvot/ccminer/archive/linux.tar.gz). Open a bash(terminal) window if you haven't done so already and use it to inside the directory where you downloaded the file.<br>
    _You will need some terminal trickery from here on out to get this going. Nothing too difficult. Just do what it takes to be in that folder with the download from step 2 because the step 4 will require it._
<br>

4. In terminal run:<br>
    `$ docker build -t coreyhanson/ccminer-nvidia:prebuild https://raw.githubusercontent.com/coreyryanhanson/ccminer-nvidia-dockerfile/master/cuda8-ubuntu16/Dockerfile`<br>
    _This creates a docker image that is ready to build ccminer._
<br>

5. Start the docker image that you created by running:<br>
    `$ nvidia-docker run -ti coreyhanson/ccminer-nvidia:prebuild bash`<br>
    _After this command, you should see your terminal username change to reflect being inside the docker container._
<br>

6. Test that your NVIDIA driver is working properly by typing this command:<br>
    `$ nvidia-smi`<br>
    _This is why step 6 used "nvidia-docker-run" vs "docker-run", If this command causes nothing to happen, something needs to be fixed before the build will work._
<br>

7. Navigate to the ccminer directory in this container you created:<br>
    `$ cd /ccminer-linux/`
<br>

8. Run these commands one at a time to build ccminer.<br>
    `$ ./autogen.sh`
`$ ./configure`
`$ ./build.sh`<br>
    _The last command will likely take a while._
<br>

9. If all goes well you should be able to install with:<br>
    `$ make install`
<br>

10. Hit **Control+D** once to exit back a regular bash session. Find the id of the container you were just working in by typing:<br>
    `$ docker ps -l`
    _The container id looks like a sequence of random characters_
<br>

11. Create an image that you can return to using your container id.<br>
    `$ docker commit (container id) (image name)`<br>
    _Replace the stuff in the parentheses with the information from step 9 and whatever name you'd like to call the image. After that you can always return to that image by command from step 5, substituting in your newly created image name_
<br>

12. ???
<br>

13. Profit
<!-- -->
<br>

**Notes:**

I built/tested it using [this commit](https://github.com/tpruvot/ccminer/archive/df4fcbe3a4d1ce9ca023fccc2e09f1275ab86f85.tar.gz). It is an active project and the code does not stay the same, so if there are errors in the build, downloading that file to replace the one in step 3 may fix them. The filename is different, so you will have to rename it or edit the dockerfile for it to be recognized.
