#!/bin/bash
set -e

if [ "$(docker ps -q -f name=plone-test)" ]; then
  docker stop plone-test
fi

docker create --rm \
       --name plone-test --net=backend -p 8080:8080 \
       -v $PWD/data/:/data/ \
       -v $PWD/src/:/plone/instance/src/ \
       -v $PWD/site.cfg:/plone/instance/site.cfg \
       -v $PWD/develop.cfg:/plone/instance/develop.cfg \
       plonews:5.2.2-python37

docker start plone-test
