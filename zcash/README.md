# Zcash-dockerfile
Installs the zcash-cli.

Either build yourself or download from the automated builds on DockerHub.

if this is your first run, you will want to establish a way to save your data outside of the image. Start by running without bind mounting any volumes:

`docker run -ti --rm \`<br>
`--name zcash \`<br>
`coreyhanson/zcash`

In the newly started container, you will want also want to download the zero knowledge parameters by entering this command.<br>
`zcash-fetch-params`

Then open a second terminal window with the first still running and copy the necessary files by pasting the following command while inserting your own `<blockchain directory>`.

`docker cp zcash:/home/zcash/ <blockchain directory>`


Now you can run a new disposable container each time while externally saving your data with this command:
`docker run -ti --rm \`<br>
`-v <blockchain directory>:/home/zcash/ \`<br>
`--name zcash \`<br>
`coreyhanson/zcash`

This is a command line interface that can be accessed with the `zcashd` command. The miner is disabled by default but can be enabled by editing the config file.

**Default Passwords**<br>
By default, there are premade values for the:<br>
root password `<zonkey>`<br>
username `<zcash>`<br>
user password `<zebra>`

But a build can be automated with your own values if you download the repository and using `docker build` setting your own arguments.

The variables for the arguments are:<br>
`$docker_root_pass`<br>
`$docker_unprivileged_user`<br>
`$docker_unprivileged_pass`<br>

For example if you wanted to change the image to have a default root password of doublesecret, a default username of person, and a default user password of password, you would enter (substituting in the dockerfile path):<br>
`docker build -t coreyhanson/evergreencoin \`<br>
`--build-arg docker_root_pass=doublesecret \`<br>
`--build-arg docker_unprivileged_user=person \`<br>
`--build-arg docker_unprivileged_pass=password \`<br>
`<path to the dockerfile>`

Then all values will be updated the resulting image. Note that changing the username means that the `/home/zcash/` argument used to start to begin the container will have to be updated accordingly.
