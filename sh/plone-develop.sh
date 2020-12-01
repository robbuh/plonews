#!/bin/bash
set -e

docker run --rm \
       --name plone-test --net=backend -p 8080:8080 \
       -e PLONE_ADDONS="collective.easyform" \
       -e PLONE_DEVELOP="src/collective.easyform" \
       -v $PWD/data/:/data/ \
       -v $PWD/src/:/plone/instance/src/ \
       plonews:5.2.2-python37 fg
