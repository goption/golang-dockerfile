FROM centos:7

ENV GOVERSION=1.8.3 \
    GOSHA=1862f4c3d3907e59b04a757cfda0ea7aa9ef39274af99a784f5be843c80c6772 \
    GOROOT=/usr/local/go \
    GOPATH=/go
# Can't reference $GOROOT and $GOPATH without
# adding another ENV command :(
ENV PATH=$PATH:$GOROOT/bin:$GOPATH/bin

RUN yum -y update && yum -y -q install wget git && \
    wget https://storage.googleapis.com/golang/go$GOVERSION.linux-amd64.tar.gz && \
    test $(sha256sum go$GOVERSION.linux-amd64.tar.gz | awk '{print $1}') = $GOSHA && \
    tar -C $(dirname $GOROOT) -zxf go$GOVERSION.linux-amd64.tar.gz && \
    rm go$GOVERSION.linux-amd64.tar.gz && \
    go get -u github.com/kardianos/govendor
