default: build

.PHONY: build test dist install

build:
	go build
test: build
	./test.sh
dist: test
	./dist.sh
install: dist
docker:
	docker build -t oauth2_proxy:latest .
