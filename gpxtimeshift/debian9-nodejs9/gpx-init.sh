#! /bin/bash

if [ -d /home/$docker_unprivileged_user/gpxdir/ ] ; then
  cd /home/$docker_unprivileged_user/gpxdir
  read -p "
  Enter the GPX filename that you would like to modify.

  (Will only work for filenames that don't contain spaces or certain special characters)
  " -e sourcefile
  if [ ! -f /home/$docker_unprivileged_user/gpxdir/$sourcefile ] ; then
    echo "

    Error: file does not exist
    "
    exec bash /user/local/bin/sh/gpx-init.sh
  fi
  read -p "

  Enter the amount of time that you would like to offset. Format is important!

  For example enter, \"+1h\" if the activity is an hour early, or \"-20m\" if it is 20 minutes too late.
" -e timeoffset
  read -p "
  Enter what you would like to call the new GPX file.

  (Will only work for filenames that don't contain spaces or certain special characters).

" -e destinationfile
  gpxtimeshift $timeoffset < $sourcefile > $destinationfile

else
  echo "

Error; you need to specify a directory to mount to /home/$docker_unprivileged_user/gpxdir while starting the docker image.

Add \"-v [yourdirectorypath]:/home/$docker_unprivileged_user/gpxdir\" when launching the image."
fi
