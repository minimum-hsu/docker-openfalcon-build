#!/bin/bash

#######################################
# Download Source Code
#######################################
rm -fR $GOPATH/src
mkdir -p $GOPATH/src/github.com
cd $GOPATH/src/github.com
git clone --quiet -b cepave-dev https://github.com/minimum-hsu/open-falcon.git open-falcon
cd open-falcon
git submodule --quiet update --init --recursive
git submodule --quiet foreach --recursive git checkout -f origin/develop

#######################################
# Parse Arguments
#######################################
for arg in "$@" ; do
  case $arg in
  "agent")
    BUILD_AGENT=true
    ;;
  "graph")
    BUILD_GRAPH=true
    ;;
  "query")
    BUILD_QUERY=true
    ;;
  "dashboard")
    BUILD_DASHBOARD=true
    ;;
  "sender")
    BUILD_SENDER=true
    ;;
  "link")
    BUILD_LINKS=true
    ;;
  "links")
    BUILD_LINKS=true
    ;;
  "portal")
    BUILD_PORTAL=true
    ;;
  "hbs")
    BUILD_HBS=true
    ;;
  "alarm")
    BUILD_ALARM=true
    ;;
  "fe")
    BUILD_FE=true
    ;;
  "judge")
    BUILD_JUDGE=true
    ;;
  "transfer")
    BUILD_TRANSFER=true
    ;;
  "task")
    BUILD_TASK=true
    ;;
  "nodata")
    BUILD_NODATA=true
    ;;
  "aggregator")
    BUILD_AGGREGATOR=true
    ;;
  "all")
    BUILD_AGENT=true
    BUILD_GRAPH=true
    BUILD_QUERY=true
    BUILD_DASHBOARD=true
    BUILD_SENDER=true
    BUILD_LINKS=true
    BUILD_PORTAL=true
    BUILD_HBS=true
    BUILD_ALARM=true
    BUILD_FE=true
    BUILD_JUDGE=true
    BUILD_TRANSFER=true
    BUILD_TASK=true
    BUILD_NODATA=true
    BUILD_AGGREGATOR=true
    ;;
  *)
    echo -e "Specify one component to build:\nagent\ngraph\nquery\ndashboard\nsender\nlinks\nportal\nhbs\nalarm\nfe\njudge\ntransfer\ntask\nnodata\naggregator"
    exit 1
    ;;
  esac
done


#######################################
# Build, Package, Rename and Collect
#######################################
PACKDIR=/package
LOGFILE=$PACKDIR/filelist.txt
rm -fR $PACKDIR
mkdir -p $PACKDIR

# Agent
if [ ! -z $BUILD_AGENT ] && $BUILD_AGENT ; then
  cd $GOPATH/src/github.com/open-falcon/agent
  go get ./...
  ./control build
  ./control pack
  PACKFILE=$(find -name "*agent*.gz")
  NEWFILE="$(echo ${PACKFILE##*/} | sed -e 's/-[.0-9]*\.tar.gz/.tar.gz/')"
  mv $PACKFILE $PACKDIR/$NEWFILE && \
    echo "Success... $NEWFILE" && \
    echo $PACKFILE >> $LOGFILE
fi

# Graph
if [ ! -z $BUILD_GRAPH ] && $BUILD_GRAPH ; then
  cd $GOPATH/src/github.com/open-falcon/graph
  go get ./...
  ./control build
  ./control pack
  PACKFILE=$(find -name "*graph*.gz")
  NEWFILE="$(echo ${PACKFILE##*/} | sed -e 's/-[.0-9]*\.tar.gz/.tar.gz/')"
  mv $PACKFILE $PACKDIR/$NEWFILE && \
    echo "Success... $NEWFILE" && \
    echo $PACKFILE >> $LOGFILE
fi

# Query
if [ ! -z $BUILD_QUERY ] && $BUILD_QUERY ; then
  cd $GOPATH/src/github.com/open-falcon/query
  go get ./...
  ./control build
  ./control pack
  PACKFILE=$(find -name "*query*.gz")
  NEWFILE="$(echo ${PACKFILE##*/} | sed -e 's/-[.0-9]*\.tar.gz/.tar.gz/')"
  mv $PACKFILE $PACKDIR/$NEWFILE && \
    echo "Success... $NEWFILE" && \
    echo $PACKFILE >> $LOGFILE
fi

# Dashboard
if [ ! -z $BUILD_DASHBOARD ] && $BUILD_DASHBOARD ; then
  cd $GOPATH/src/github.com/open-falcon/dashboard
  ./control pack
  PACKFILE=$(find -name "*dashboard*.gz")
  NEWFILE="$(echo ${PACKFILE##*/} | sed -e 's/-[[:alnum:]]*\.tar\.gz/.tar.gz/')"
  mv $PACKFILE $PACKDIR/$NEWFILE && \
    echo "Success... $NEWFILE" && \
    echo $PACKFILE >> $LOGFILE
fi

# Sender
if [ ! -z $BUILD_SENDER ] && $BUILD_SENDER ; then
  cd $GOPATH/src/github.com/open-falcon/sender
  go get ./...
  ./control build
  ./control pack
  PACKFILE=$(find -name "*sender*.gz")
  NEWFILE="$(echo ${PACKFILE##*/} | sed -e 's/-[.0-9]*\.tar.gz/.tar.gz/')"
  mv $PACKFILE $PACKDIR/$NEWFILE && \
    echo "Success... $NEWFILE" && \
    echo $PACKFILE >> $LOGFILE
fi

# Links
if [ ! -z $BUILD_LINKS ] && $BUILD_LINKS ; then
  cd $GOPATH/src/github.com/open-falcon/links
  ./control pack
  PACKFILE=$(find -name "*link*.gz")
  NEWFILE="$(echo ${PACKFILE##*/} | sed -e 's/-[[:alnum:]]*\.tar\.gz/.tar.gz/')"
  mv $PACKFILE $PACKDIR/$NEWFILE && \
    echo "Success... $NEWFILE" && \
    echo $PACKFILE >> $LOGFILE
fi

# Portal
if [ ! -z $BUILD_PORTAL ] && $BUILD_PORTAL ; then
  cd $GOPATH/src/github.com/open-falcon/portal
  ./control pack
  PACKFILE=$(find -name "*portal*.gz")
  NEWFILE="$(echo ${PACKFILE##*/} | sed -e 's/-[[:alnum:]]*\.tar\.gz/.tar.gz/')"
  mv $PACKFILE $PACKDIR/$NEWFILE && \
    echo "Success... $NEWFILE" && \
    echo $PACKFILE >> $LOGFILE
fi

# Heartbeat Server (HBS)
if [ ! -z $BUILD_HBS ] && $BUILD_HBS ; then
  cd $GOPATH/src/github.com/open-falcon/hbs
  go get ./...
  ./control build
  ./control pack
  PACKFILE=$(find -name "*hbs*.gz")
  NEWFILE="$(echo ${PACKFILE##*/} | sed -e 's/-[.0-9]*\.tar.gz/.tar.gz/')"
  mv $PACKFILE $PACKDIR/$NEWFILE && \
    echo "Success... $NEWFILE" && \
    echo $PACKFILE >> $LOGFILE
fi

# Alarm
if [ ! -z $BUILD_ALARM ] && $BUILD_ALARM ; then
  cd $GOPATH/src/github.com/open-falcon/alarm
  go get ./...
  ./control build
  ./control pack
  PACKFILE=$(find -name "*alarm*.gz")
  NEWFILE="$(echo ${PACKFILE##*/} | sed -e 's/-[.0-9]*\.tar.gz/.tar.gz/')"
  mv $PACKFILE $PACKDIR/$NEWFILE && \
    echo "Success... $NEWFILE" && \
    echo $PACKFILE >> $LOGFILE
fi

# FE
if [ ! -z $BUILD_FE ] && $BUILD_FE ; then
  cd $GOPATH/src/github.com/open-falcon/fe
  go get ./...
  ./control build
  ./control pack
  PACKFILE=$(find -name "*fe*.gz")
  NEWFILE="$(echo ${PACKFILE##*/} | sed -e 's/-[.0-9]*\.tar.gz/.tar.gz/')"
  mv $PACKFILE $PACKDIR/$NEWFILE && \
    echo "Success... $NEWFILE" && \
    echo $PACKFILE >> $LOGFILE
fi

# Judge
if [ ! -z $BUILD_JUDGE ] && $BUILD_JUDGE ; then
  cd $GOPATH/src/github.com/open-falcon/judge
  go get ./...
  ./control build
  ./control pack
  PACKFILE=$(find -name "*judge*.gz")
  NEWFILE="$(echo ${PACKFILE##*/} | sed -e 's/-[.0-9]*\.tar.gz/.tar.gz/')"
  mv $PACKFILE $PACKDIR/$NEWFILE && \
    echo "Success... $NEWFILE" && \
    echo $PACKFILE >> $LOGFILE
fi

# Transfer
if [ ! -z $BUILD_TRANSFER ] && $BUILD_TRANSFER ; then
  cd $GOPATH/src/github.com/open-falcon/transfer
  go get ./...
  ./control build
  ./control pack
  PACKFILE=$(find -name "*transfer*.gz")
  NEWFILE="$(echo ${PACKFILE##*/} | sed -e 's/-[.0-9]*\.tar.gz/.tar.gz/')"
  mv $PACKFILE $PACKDIR/$NEWFILE && \
    echo "Success... $NEWFILE" && \
    echo $PACKFILE >> $LOGFILE
fi

# Task
if [ ! -z $BUILD_TASK ] && $BUILD_TASK ; then
  cd $GOPATH/src/github.com/open-falcon/task
  go get ./...
  ./control build
  ./control pack
  PACKFILE=$(find -name "*task*.gz")
  NEWFILE="$(echo ${PACKFILE##*/} | sed -e 's/-[.0-9]*\.tar.gz/.tar.gz/')"
  mv $PACKFILE $PACKDIR/$NEWFILE && \
    echo "Success... $NEWFILE" && \
    echo $PACKFILE >> $LOGFILE
fi

# Nodata
if [ ! -z $BUILD_NODATA ] && $BUILD_NODATA ; then
  cd $GOPATH/src/github.com/open-falcon/nodata
  go get ./...
  ./control build
  ./control pack
  PACKFILE=$(find -name "*nodata*.gz")
  NEWFILE="$(echo ${PACKFILE##*/} | sed -e 's/-[.0-9]*\.tar.gz/.tar.gz/')"
  mv $PACKFILE $PACKDIR/$NEWFILE && \
    echo "Success... $NEWFILE" && \
    echo $PACKFILE >> $LOGFILE
fi

# Aggregator
if [ ! -z $BUILD_AGGREGATOR ] && $BUILD_AGGREGATOR ; then
  cd $GOPATH/src/github.com/open-falcon/aggregator
  go get ./...
  ./control build
  ./control pack
  PACKFILE=$(find -name "*aggregator*.gz")
  NEWFILE="$(echo ${PACKFILE##*/} | sed -e 's/-[.0-9]*\.tar.gz/.tar.gz/')"
  mv $PACKFILE $PACKDIR/$NEWFILE && \
    echo "Success... $NEWFILE" && \
    echo $PACKFILE >> $LOGFILE
fi
