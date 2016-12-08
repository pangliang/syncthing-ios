#!/bin/bash

HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
GO=$HOME/golang/bin/go

if [ -d "./cgo-obj" ]; then
	rm -rf ./cgo-obj
fi

if [ -d "./go-obj" ]; then
	rm -rf ./go-obj
fi

mkdir ./cgo-obj
mkdir ./go-obj

CGO_ENABLED=1 GOARCH=arm64 GOARM=7 $GO tool cgo -objdir ./cgo-obj \
	$HOME/syncthing/src/github.com/syncthing/syncthing/cmd/syncthing/main.go

GOPATH=$HOME/syncthing CGO_ENABLED=1 GOARCH=arm \
	$GO build -o syncthing-exc \
	-ldflags '-tmpdir ./go-obj -linkmode external' \
	 \
	github.com/syncthing/syncthing/cmd/syncthing

ar rcs libsyncthing.a go-obj/*.o
