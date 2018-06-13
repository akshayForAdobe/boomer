FROM golang:1.9.4

ADD . /go/src/github.com/abhisheknsit/boomer
WORKDIR /go/src/github.com/abhisheknsit/boomer

RUN curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh
# Recompile everything and create a static binary
ENV CGO_ENABLED=0
RUN go build -v -a --installsuffix cgo -ldflags '-s' -o a.out
RUN chmod 755 ./entrypoint.sh
# Start Locust using LOCUS_OPTS environment variable
ENTRYPOINT ["./entrypoint.sh"]
