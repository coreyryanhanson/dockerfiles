# Burstcoin-dockerfile
Installs the GUI version of the Burstcoin local wallet. This creates a local web server that once running in Docker, allows access to the wallet by bringing any internet browser to `localhost:8125`.

Either build yourself or download from the automated builds on DockerHub.

To run copy and past this code, but be sure to replace `<blockchain directory>` with the path where you want to download the blockchain.

`docker run -ti --rm \`<br>
`-v <blockchain directory>:/var/lib/mysql \`<br>
`--network=host \`<br>
`--name burstcoin \`<br>
`coreyhanson/burstcoin`

**Initial setup**

These steps are necessary because this wallet's database is managed through MariaDB (mySQL) which can be extremely particular about access to it. It won't be a problem if you don't need to mount a directory (removing the line with the `-v`) but that is strongly discouraged as it would require re-downloading the blockchain every single time.

Instead when you first run, use a second terminal window to extract the directory to your desired location.

First run:<br>
`docker run -ti --rm \`<br>
`--network=host \`<br>
`--name burstcoin \`<br>
`coreyhanson/burstcoin /bin/bash`

So that you can mount the databases created by the build, use this command to copy them while the other terminal window is running with:<br>
`docker cp  coreyhanson/burstcoin:/var/lib/mysql/ <blockchain directory>`

Now, whenever you start and stop the image, you can run the regular code and continue your download of the blockchain.<br>
`docker run -ti --rm \`<br>
`-v <blockchain directory>:/var/lib/mysql \`<br>
`--network=host \`<br>
`--name burstcoin \`<br>
`coreyhanson/burstcoin`<br>

There is a script that makes sure all of the file permissions are ok for MariaDB to recognize the database. The only side effect is that it locks the blockchain files as "read only" to other users. If you need to delete them, you would need to do it as root with this command:<br>
`sudo rm -rf <path to file>`<br>
__It's a powerful command, so use with caution.__

__Also note that filesystems that don't support metadata for linux users and groups (such as NTFS), will not work with this. Make sure that where you store the blockchain files, are on a properly formatted drive.__

**Build variables**<br>
By default, there are premade values for the:<br>
root password `<wizardhorse>`<br>
username `<burst>`<br>
user password `<yannicorn>`

But a build can be automated with your own values if you download the repository and using `docker build` setting your own arguments.

The variables for the arguments are:<br>
`$docker_root_pass`<br>
`$docker_unprivileged_user`<br>
`$docker_unprivileged_pass`<br>

For example if you wanted to change the image to have a default root password of blockchain, a default username of wallet, and a default user password of password, you would enter (substituting in the dockerfile path):<br>
`docker build -t coreyhanson/burstcoin \`<br>
`--build-arg docker_root_pass=blockchain \`<br>
`--build-arg docker_unprivileged_user=wallet \`<br>
`--build-arg docker_unprivileged_pass_arg=password \`<br>
`<path to the dockerfile>`

Then all values will be updated the resulting image.
