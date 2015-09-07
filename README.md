# docker-openfalcon-build

## Build

Enter the following command in the repo directory.

```
$sudo docker build --force-rm=true -t openfalcon-build .
```

## Run

```
$mkdir /tmp/pack
$sudo docker run -d --rm=true -v /tmp/pack:/package openfalcon-build
```

You can specify one or more components to build, like

```
$sudo docker run -d --rm=true -v /tmp/pack:/package openfalcon-build agent fe portal
```

Components:  
agent  
graph  
query  
dashboard  
sender  
links  
portal  
hbs  
alarm  
fe  
judge  
transfer  
task 
