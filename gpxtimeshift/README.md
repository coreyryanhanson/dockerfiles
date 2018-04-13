# gpxtimeshift-dockerfile
Installs a portable docker instance of [gpxtimeshift](https://github.com/kssfilo/gpxtimeshift) with a script to make the process more user friendly.

Very useful to correct problems if you are running the Strava app and your phone's GPS doesn't provide the correct start time.

Either build yourself or download from the automated builds on DockerHub.

Copy and paste this code, but be sure to replace `<gpxdirectorypath>` with the path where your GPX file is located.

`docker run -ti --rm \`<br>
`-v <gpxdirectorypath>:/home/strava/gpxdir\`<br>
`--name gpxtimeshift \`<br>
`coreyhanson/gpxtimeshift`

By default, there are premade values for the:<br>
root password `<flytouchthesun>`<br>
username `<strava>`<br>
user password `<icarus>`

But a build can be automated with your own values if you download the repository and using `docker build` setting your own arguments.

The variables for the arguments are:<br>
`$docker_root_pass`<br>
`$docker_unprivileged_user`<br>
`$docker_unprivileged_pass`<br>

For example if you wanted to change the image to have a default root password of doublesecret, a default username of person, and a default user password of password, you would enter (substituting in the dockerfile path):<br>
`docker build -t coreyhanson/strava \`<br>
`--build-arg docker_root_pass=doublesecret \`<br>
`--build-arg docker_unprivileged_user=person \`<br>
`--build-arg docker_unprivileged_pass=password \`<br>
`<path to the dockerfile>`

Then all values will be updated the resulting image. Note that changing the username means that the `/home/strava/` argument used to start to begin the container will have to be updated accordingly.
