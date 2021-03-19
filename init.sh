#!/bin/sh
[ ! -f "go.mod" ] && go mod init main && go mod tidy