.PHONY: build-linux build docker clean

EXE = $(GOPATH)/bin/dms

build-linux:
	CGO_ENABLED=0 GOOS=linux go build -a -ldflags '-extldflags "-s -w -static"' -o $(EXE) .

build:
	CGO_ENABLED=0 go build -a -ldflags '-extldflags "-s -w -static"' -o $(EXE) .

docker:
	docker buildx build --platform linux/amd64,linux/arm64 -o type=registry -t thiagoalmeidasa/pingcap-dead-mans-switch -f build/Dockerfile .

clean:
	rm -f $(EXE)
