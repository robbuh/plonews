# plonews

Plone 5 (Python 3.7) websockets with built-in support for:

- HAProxy
- LDAP

## Prerequisites

Docker installed and running

## Usage

### Build Docker image

```console
$ docker build -t plonews:5.2.2-python37 .
```

### Start cluster

```console
$ docker-compose up -d
```

### Scale the number of ZEO clients

```console
$ docker-compose scale plone=4
```

### Development

A "plone-test" container will be created with --rm mode

**Start Plone In Debug Mode**

```console
$ ./sh/plone-fg.sh
```

**Install addons in src folder**

```console
$ mkdir src
$ cd src
$ git clone https://github.com/user/my.product
```

```console
$ ./sh/plone-develop.sh
```

**Add custom addons in src via buildout**

```console
$ ./sh/plone-create.sh
$ ./sh/plone-rebuild.sh
```
