#!/bin/bash

export REMOTE=origin
export BRANCH=new_layout
export REPO=github.com/Cepave/open-falcon
export WORKPATH=${GOPATH}/src/${REPO}
export COMPONENT=${1:-all}
export SUBMODULE_BRANCH=develop

function set_git_modules() {
  modulelist=$(git config -f .gitmodules --get-regexp submodule.modules/[[:alnum:]]+?.path | awk -F " " -F "." '{ print $1 "." $2 }')
  for module in ${modulelist}
  do
    git config -f .gitmodules ${module}.branch ${SUBMODULE_BRANCH}
  done
  git config -f .gitmodules submodule.scripts/mysql.branch develop
}

#######################################
# Download Source Code
#######################################
rm -fR ${GOPATH}/* ~/.trash-cache
mkdir -p ${WORKPATH}
git clone --quiet -b new_layout https://${REPO}.git ${WORKPATH}
cd ${WORKPATH}
set_git_modules
git submodule --quiet update --init --recursive
git submodule --quiet foreach --recursive git fetch --all
git submodule --quiet foreach --recursive git reset --hard
go get github.com/rancher/trash
${GOPATH}/bin/trash --keep
go get ./...

#######################################
# Compile
#######################################
make ${COMPONENT}
make pack
mv open-falcon-v*.tar.gz /package/

