# ccminer-nvidia-dockerfile
Sets up an environment to build [tpruvot's fork of CC Miner](https://github.com/tpruvot/ccminer) for NVIDIA Cuda mining through the use of a [docker](https://github.com/docker/docker-ce) container.

Use this if you are running a non-Ubuntu distro of Linux and need a way around conflicting dependencies. If you are running a Mac or Windows this repo will not help you.

There are also several default arguments that can be adjusted to change the username and password while building. See other dockerfiles in this repository if you need help changing these values.<br>
root password `<fannieearl>`<br>
username `<creepminer>`<br>
user password `<zulway>`

Tested on CentOS 7.4 using NVIDIA GTX980M.

**Installation steps:**<br>
_Swap out CUDA 9 For CUDA 8 if you want to use the older version of CUDA._

1. Download and install the [latest version of docker](https://docs.docker.com/engine/installation/).<br><br>
    _It works similarly to using virtual machines, but unlike VMs there is very little sacrifice in speed._
<br>

2. Download and install the [latest version of the Docker Engine Utility for NVIDIA GPUs](https://github.com/NVIDIA/nvidia-docker).<br><br>
    _This will allow the docker container to integrate with your locally installed NVIDIA GPU._
<br>

3. Download this repository from github. in terminal make sure git is installed and run:<br><br>
    `$ git clone https://github.com/coreyryanhanson/dockerfiles.git`<br>
    `$ cd dockerfiles/ccminer-nvidia/ubuntu16-cuda9/`<br>

4. (OPTIONAL STEP) If you want to build the first part yourself instead of downloading the image from DockerHub, run:<br><br>
    `$ docker build -t coreyhanson/ccminer-nvidia:cuda9-src -f Dockerfile-dependencies .`<br><br>
    _This creates a docker image that is ready to build ccminer._
<br>

5. Start the docker image that you created by running:<br><br>
    `$ nvidia-docker run -ti coreyhanson/ccminer-nvidia:cuda9-src`<br><br>
    _After this command, you should see your terminal username change to reflect being inside the docker container._
<br>

6. Test that your NVIDIA driver is working properly by typing this command:<br><br>
    `$ nvidia-smi`<br><br>
    _This is why step 5 used "nvidia-docker-run" vs "docker-run", If this command causes nothing to happen, something needs to be fixed before the build will work._
<br>

7. Exit the docker session by hitting **Control+D** and build a new docker image using the prior one with the dependencies:<br><br>
    `$ docker build -t coreyhanson/ccminer-nvidia:cuda9 .`<br><br>
    _The dockerfile is configured to find what it needs automatically, (as long as you are in the same directory). This step will likely take a while._
<br>

8. If all goes well, it should be installed. Start mining away. You can access this image in the future by entering:<br><br>
    `$ nvidia-docker run -ti coreyhanson/ccminer-nvidia:cuda9`<br><br>
    _The guides for using ccMiner should take you the rest of the way_
<br>

9. ???
<br>

10. Profit
<!-- -->
<br>
