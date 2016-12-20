#!/bin/bash

HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
GO=$HOME/golang/bin/go

#The first compilation run it, can speed up compilation

#GOPATH=$HOME/syncthing CGO_ENABLED=1 GOARCH=arm64 \
# 	$GO install -v \
# 	github.com/syncthing/syncthing/cmd/syncthing

GOPATH=$HOME/syncthing CGO_ENABLED=1 GOARCH=arm64 \
	$GO build -v -buildmode=c-archive \
	-o syncthing-ios/syncthing.a \
	github.com/syncthing/syncthing/cmd/syncthing
