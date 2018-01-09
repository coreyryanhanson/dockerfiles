# EverGreenCoin-dockerfile
Installs the GUI version of the EverGreenCoin local wallet.

Either build yourself or download from the automated builds on DockerHub.

To run you need to pass the x11 environment variables and volumes.

Copy and past this code, but be sure to replace `<blockchain directory>` with the path where you want to download the blockchain.

`docker run -ti --rm \`<br>
`-v /tmp/.X11-unix:/tmp/.X11-unix \`<br>
`-e DISPLAY=unix$DISPLAY \`<br>
`-v <blockchain directory>:/home/evergreen/.evergreencoin \`<br>
`--name evergreencoin \`<br>
`coreyhanson/evergreencoin`

By default, there are premade values for the:<br>
root password `<starcatfish>`<br>
username `<evergreen>`<br>
user password `<walrus>`

But a build can be automated with your own values if you download the repository and using `docker build` setting your own arguments.

The variables for the arguments are:<br>
`$docker_root_pass`<br>
`$docker_unprivileged_user`<br>
`$docker_unprivileged_pass`<br>

For example if you wanted to change the image to have a default root password of blockchain, a default username of wallet, and a default user password of password, you would enter (substituting in the dockerfile path):<br>
`docker build -t coreyhanson/evergreencoin \`<br>
`--build-arg docker_root_pass=blockchain \`<br>
`--build-arg docker_unprivileged_user=wallet \`<br>
`--build-arg docker_unprivileged_pass=password \`<br>
`<path to the dockerfile>`

Then all values will be updated the resulting image. Please note that the work directory can't be changed as it would break the link that facilitates a customizable volume to download the blockchain files.

Also note that that this image does not use the GPU so there will be errors initializing OpenGL, but the wallet still functions without it.
