#!/bin/bash
DS4_DRIVER_LOCAL_PATH="$1"

if [ "$DS4_DRIVER_LOCAL_PATH" != "" ]; then
   docker rm ds4_drv_container

    # before running this put the export the DS4_DRIVER_LOCAL_PATH variable in your current terminal or
    # place it in ~/.bashrc and source it
    docker run -it \
      -v "/dev:/dev" \
      -v "$DS4_DRIVER_LOCAL_PATH:/opt/underlay_ws/src" \
      --privileged \
      --name="ds4_drv_container" \
      --network=host \
      ds4_driver/foxy bash
else
    echo "Give the ds4_driver local source path as an argument to this script!"
fi

