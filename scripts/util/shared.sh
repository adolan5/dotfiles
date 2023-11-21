#!/bin/bash

# Mounts or unmounts the shared folder with parameters defined in your .bashrc
# For use with VirtualBox + guest additions
# Author: Andy Dolan

# Variable checks
if [ -z ${SHARED_FOLDER_NAME+x} ]
then
  echo "Shared folder name is not set in your .bashrc"
  exit 1
fi

if [ -z ${SHARED_FOLDER_MOUNT_POINT+x} ]
then
  echo "Shared folder mount location is not set in your .bashrc"
  exit 1
fi

# Is the folder mounted?
MOUNTED=0

# Check if folder is already mounted
if grep -qs $SHARED_FOLDER_MOUNT_POINT /proc/mounts
then
  MOUNTED=1
fi

# If there's an argument, we're unmounting
if [ $# -gt 0 ]
then
  if [ $MOUNTED -eq 0 ]
  then
    echo "Folder already unmounted"
    exit 1
  fi
  echo "Unmounting shared folder"
  sudo umount $SHARED_FOLDER_NAME
  exit 0

# Else we're mounting
elif [ $MOUNTED -eq 1 ]
then
  echo "Folder already mounted"
  exit 1
fi

echo "Mounting shared folder"
sudo mount -t vboxsf $SHARED_FOLDER_NAME $SHARED_FOLDER_MOUNT_POINT
exit 0
