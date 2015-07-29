# docker-openfalcon-build

## Build

Enter the following command in the repo directory.

```
$sudo docker build --force-rm=true -t openfalcon-build .
```

## Run

```
$mkdir /tmp/pack
$sudo docker run -ti --name builder -v /tmp/pack:/package openfalcon-build
```
