#!/bin/bash

if [ -f $2 ]; then
  rm -rf $2
fi

ln -sf $1 $2
