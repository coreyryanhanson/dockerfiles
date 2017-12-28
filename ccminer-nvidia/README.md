# ccminer-nvidia-dockerfile
Sets up an environment to build [tpruvot's fork of CC Miner](https://github.com/tpruvot/ccminer) for NVIDIA Cuda mining through the use of a [docker](https://github.com/docker/docker-ce) container.

Use this if you are running a non-Ubuntu distro of Linux and need a way around conflicting dependencies. If you are running a Mac or Windows this repo will not help you.

Tested on CentOS 7.4 using NVIDIA GTX980M.

**Installation steps:**
_Swap out CUDA 9 For CUDA 8 if you want to use the older version of CUDA.

1. Download and install the [latest version of docker](https://docs.docker.com/engine/installation/).<br><br>
    _It works similarly to using virtual machines, but unlike VMs there is very little sacrifice in speed._
<br>

2. Download and install the [latest version of the Docker Engine Utility for NVIDIA GPUs](https://github.com/NVIDIA/nvidia-docker).<br><br>
    _This will allow the docker container to integrate with your locally installed NVIDIA GPU._
<br>

3. (OPTIONAL STEP) If you want to build the first part yourself instead of downloading the image from DockerHub, in terminal run:<br><br>
    `$ docker build -t coreyhanson/ccminer-nvidia:cuda9 https://raw.githubusercontent.com/coreyryanhanson/ccminer-nvidia-dockerfile/master/cuda9-ubuntu16/Dockerfile`<br><br>
    _This creates a docker image that is ready to build ccminer._
<br>

4. Start the docker image that you created by running:<br><br>
    `$ nvidia-docker run -ti coreyhanson/ccminer-nvidia:cuda9`<br><br>
    _After this command, you should see your terminal username change to reflect being inside the docker container._
<br>

5. Test that your NVIDIA driver is working properly by typing this command:<br><br>
    `$ nvidia-smi`<br><br>
    _This is why step 6 used "nvidia-docker-run" vs "docker-run", If this command causes nothing to happen, something needs to be fixed before the build will work._
<br>

6. Run the build script:<br><br>
    `$ ./install-ccminer.sh`<br><br>
    _This will likely take a while._
<br>

7. If all goes well, it should be installed. Start mining away:
<br>

8. Hit **Control+D** once to exit back a regular bash session. Find the id of the container you were just working in by typing:<br><br>
    `$ docker ps -l`<br><br>
    _The container id looks like a sequence of random characters_
<br>

9. Create an image that you can return to using your container id.<br><br>
    `$ docker commit (container id) (image name)`<br><br>
    _Replace the stuff in the parentheses with the information from step 9 and whatever name you'd like to call the image. After that you can always return to that image by command from step 5, substituting in your newly created image name_
<br>

10. ???
<br>

11. Profit
<!-- -->
<br>


