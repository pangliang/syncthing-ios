#!/bin/bash

HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
GO=$HOME/golang/bin/go

if [ ! -d "$HOME/cgo-obj" ]; then
	mkdir $HOME/cgo-obj
fi

if [ ! -d "$HOME/go-obj" ]; then
	mkdir $HOME/go-obj
fi

CGO_ENABLED=1 GOARCH=arm64 GOARM=7 $GO tool cgo -objdir $HOME/cgo-obj \
	$HOME/syncthing/src/github.com/syncthing/syncthing/cmd/syncthing/main.go

GOPATH=$HOME/syncthing CGO_ENABLED=1 GOARCH=arm64 \
	$GO build -v -o syncthing-exc \
	-ldflags "-tmpdir $HOME/go-obj -linkmode external" \
	 \
	github.com/syncthing/syncthing/cmd/syncthing

ar rcs syncthing.a $HOME/go-obj/*.o
