#!/bin/bash
set -e

COMMANDS="adduser debug fg foreground help kill logreopen logtail reopen_transcript run show status stop wait"
START="console start restart"

buildDeps="
  build-essential
  curl
  git
  libc6-dev
  libexpat1-dev
  libjpeg-dev
  libldap2-dev
  libmemcached-dev
  libpq-dev
  libreadline-dev
  libsasl2-dev
  libssl-dev
  libxml2-dev
  libxslt-dev
  libxslt1-dev
  libyaml-dev
  libz-dev
  zlib1g-dev
"

echo "========================================================================="
echo "Installing $buildDeps"
echo "========================================================================="

apt-get update
apt-get install -y --no-install-recommends $buildDeps


echo "========================================================================="
echo "Running buildout -c buildout.cfg"
echo "========================================================================="

buildout -c buildout.cfg

# Fix permissions
find /data  -not -user plone -exec chown plone:plone {} \+
find /plone -not -user plone -exec chown plone:plone {} \+
