#!/bin/bash

if [ ! -z $1 ]; then
  IMG_VERSION=":$1"
  shift
fi



docker build -t precognox/ubuntu-solr4$IMG_VERSION $* .
