#!/bin/bash

HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $HOME/golang/src
GOROOT_BOOTSTRAP=/server/go GOARM=7 CGO_ENABLED=1 GOARCH=arm \
	 CC_FOR_TARGET=`pwd`/../misc/ios/clangwrap.sh \
	 CXX_FOR_TARGET=`pwd`/../misc/ios/clangwrap.sh ./make.bash
