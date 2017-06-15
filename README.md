# golang-dockerfile [![Build Status](https://travis-ci.org/goption/golang-dockerfile.svg?branch=develop)](https://travis-ci.org/goption/golang-dockerfile)
Create a ready-to-use Golang environment with a few helpful environment variables

## The Process
- `yum update` and `yum install wget git`
- Verify the SHA of the downloaded file
- Unzip and remove the tarball
- **Install Govendor** because we use Govendor to manage dependencies

## The Environment Vars
- `GOVERSION=1.8.3`
- `GOSHA=1862..`
- `GOROOT=/usr/local/go`
- `GOPATH=/go`
- `PATH=$PATH:$GOROOT/bin:$GOPATH/bin`

Note the `GOPATH` is in `/` so it can be chmodded or chowned and used
by non-root users without opening up /root.
