# Electrum-dockerfile
Installs the GUI version of the Electrum wallet.

Either build yourself or download from the automated builds on DockerHub.

To run you need to pass the x11 environment variables and volumes.

**Note:** Likely will not work without NVIDIA docker because it calls for GLX. On other setups there may be a way to get it to work by tweaking the dockerfile and startup commands.

Copy and past this code, but be sure to replace `<blockchain directory>` with the path where you want to download the blockchain.

`docker run -ti --rm \`<br>
`-v /tmp/.X11-unix:/tmp/.X11-unix \`<br>
`-e DISPLAY=unix$DISPLAY \`<br>
`-v <blockchain directory>:/home/electrum/.electrum \`<br>
`--name electrum \`<br>
`coreyhanson/electrum`

By default, there are premade values for the:<br>
root password `<boogiewoogiewoogie>`<br>
username `<electrum>`<br>
user password `<itselectrum>`

But a build can be automated with your own values if you download the repository and using `docker build` setting your own arguments.

The variables for the arguments are:<br>
`$docker_root_pass`<br>
`$docker_unprivileged_user`<br>
`$docker_unprivileged_pass`<br>

For example if you wanted to change the image to have a default root password of doublesecret, a default username of person, and a default user password of password, you would enter (substituting in the dockerfile path):<br>
`docker build -t coreyhanson/electrum \`<br>
`--build-arg docker_root_pass=doublesecret \`<br>
`--build-arg docker_unprivileged_user=person \`<br>
`--build-arg docker_unprivileged_pass=password \`<br>
`<path to the dockerfile>`

Then all values will be updated the resulting image. Note that changing the username means that the `/home/electrum/` argument used to start to begin the container will have to be updated accordingly.
