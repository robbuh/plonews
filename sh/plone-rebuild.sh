#!/bin/bash

# Add new product in site.cfg
docker exec plone-test gosu plone buildout -c site.cfg

# Restart Plone to make new added products available
docker restart plone-test
