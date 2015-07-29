#!/bin/bash

#######################################
# Download Source Code
#######################################
rm -fR $GOPATH/src
mkdir -p $GOPATH/src/github.com
cd $GOPATH/src/github.com
git clone --recursive https://github.com/XiaoMi/open-falcon.git

#######################################
# Build, Package, Rename and Collect
#######################################
PACKDIR=/package
LOGFILE=$PACKDIR/filelist.txt
rm -fR $PACKDIR
mkdir -p $PACKDIR

# Agent
cd $GOPATH/src/github.com/open-falcon/agent
go get ./...
./control build
./control pack
PACKFILE=$(find -name "*agent*.gz")
NEWFILE="$(echo ${PACKFILE##*/} | sed -e 's/-[.0-9]*\.tar.gz/.tar.gz/')"
mv $PACKFILE $PACKDIR/$NEWFILE && \
  echo "Success... $NEWFILE" && \
  echo $PACKFILE >> $LOGFILE

# Graph
cd $GOPATH/src/github.com/open-falcon/graph
go get ./...
./control build
./control pack
PACKFILE=$(find -name "*graph*.gz")
NEWFILE="$(echo ${PACKFILE##*/} | sed -e 's/-[.0-9]*\.tar.gz/.tar.gz/')"
mv $PACKFILE $PACKDIR/$NEWFILE && \
  echo "Success... $NEWFILE" && \
  echo $PACKFILE >> $LOGFILE

# Query
cd $GOPATH/src/github.com/open-falcon/query
go get ./...
./control build
./control pack
PACKFILE=$(find -name "*query*.gz")
NEWFILE="$(echo ${PACKFILE##*/} | sed -e 's/-[.0-9]*\.tar.gz/.tar.gz/')"
mv $PACKFILE $PACKDIR/$NEWFILE && \
  echo "Success... $NEWFILE" && \
  echo $PACKFILE >> $LOGFILE

# Dashboard
cd $GOPATH/src/github.com/open-falcon/dashboard
./control pack
PACKFILE=$(find -name "*dashboard*.gz")
NEWFILE="$(echo ${PACKFILE##*/} | sed -e 's/-[[:alnum:]]*\.tar\.gz/.tar.gz/')"
mv $PACKFILE $PACKDIR/$NEWFILE && \
  echo "Success... $NEWFILE" && \
  echo $PACKFILE >> $LOGFILE

# Sender
cd $GOPATH/src/github.com/open-falcon/sender
go get ./...
./control build
./control pack
PACKFILE=$(find -name "*sender*.gz")
NEWFILE="$(echo ${PACKFILE##*/} | sed -e 's/-[.0-9]*\.tar.gz/.tar.gz/')"
mv $PACKFILE $PACKDIR/$NEWFILE && \
  echo "Success... $NEWFILE" && \
  echo $PACKFILE >> $LOGFILE

# Link
cd $GOPATH/src/github.com/open-falcon/links
./control pack
PACKFILE=$(find -name "*link*.gz")
NEWFILE="$(echo ${PACKFILE##*/} | sed -e 's/-[[:alnum:]]*\.tar\.gz/.tar.gz/')"
mv $PACKFILE $PACKDIR/$NEWFILE && \
  echo "Success... $NEWFILE" && \
  echo $PACKFILE >> $LOGFILE

# Portal
cd $GOPATH/src/github.com/open-falcon/portal
./control pack
PACKFILE=$(find -name "*portal*.gz")
NEWFILE="$(echo ${PACKFILE##*/} | sed -e 's/-[[:alnum:]]*\.tar\.gz/.tar.gz/')"
mv $PACKFILE $PACKDIR/$NEWFILE && \
  echo "Success... $NEWFILE" && \
  echo $PACKFILE >> $LOGFILE

# Heartbeat Server (HBS)
cd $GOPATH/src/github.com/open-falcon/hbs
go get ./...
./control build
./control pack
PACKFILE=$(find -name "*hbs*.gz")
NEWFILE="$(echo ${PACKFILE##*/} | sed -e 's/-[.0-9]*\.tar.gz/.tar.gz/')"
mv $PACKFILE $PACKDIR/$NEWFILE && \
  echo "Success... $NEWFILE" && \
  echo $PACKFILE >> $LOGFILE

# Alarm
cd $GOPATH/src/github.com/open-falcon/alarm
go get ./...
./control build
./control pack
PACKFILE=$(find -name "*alarm*.gz")
NEWFILE="$(echo ${PACKFILE##*/} | sed -e 's/-[.0-9]*\.tar.gz/.tar.gz/')"
mv $PACKFILE $PACKDIR/$NEWFILE && \
  echo "Success... $NEWFILE" && \
  echo $PACKFILE >> $LOGFILE

# FE
cd $GOPATH/src/github.com/open-falcon/fe
go get ./...
./control build
./control pack
PACKFILE=$(find -name "*fe*.gz")
NEWFILE="$(echo ${PACKFILE##*/} | sed -e 's/-[.0-9]*\.tar.gz/.tar.gz/')"
mv $PACKFILE $PACKDIR/$NEWFILE && \
  echo "Success... $NEWFILE" && \
  echo $PACKFILE >> $LOGFILE

# Judge
cd $GOPATH/src/github.com/open-falcon/judge
go get ./...
./control build
./control pack
PACKFILE=$(find -name "*judge*.gz")
NEWFILE="$(echo ${PACKFILE##*/} | sed -e 's/-[.0-9]*\.tar.gz/.tar.gz/')"
mv $PACKFILE $PACKDIR/$NEWFILE && \
  echo "Success... $NEWFILE" && \
  echo $PACKFILE >> $LOGFILE

# Transfer
cd $GOPATH/src/github.com/open-falcon/transfer
go get ./...
./control build
./control pack
PACKFILE=$(find -name "*transfer*.gz")
NEWFILE="$(echo ${PACKFILE##*/} | sed -e 's/-[.0-9]*\.tar.gz/.tar.gz/')"
mv $PACKFILE $PACKDIR/$NEWFILE && \
  echo "Success... $NEWFILE" && \
  echo $PACKFILE >> $LOGFILE

# Task
cd $GOPATH/src/github.com/open-falcon/task
go get ./...
./control build
./control pack
PACKFILE=$(find -name "*task*.gz")
NEWFILE="$(echo ${PACKFILE##*/} | sed -e 's/-[.0-9]*\.tar.gz/.tar.gz/')"
mv $PACKFILE $PACKDIR/$NEWFILE && \
  echo "Success... $NEWFILE" && \
  echo $PACKFILE >> $LOGFILE
