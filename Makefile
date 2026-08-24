.PHONY: build test lint check bench docker

build:
	CGO_ENABLED=0 go build -trimpath -o bin/ ./cmd/...

test:
	go test ./...

lint:
	golangci-lint run
	go fix -diff ./...

check:
	go vet ./...
	govulncheck ./...

bench:
	go test -bench=. -benchmem -run=^# ./...

docker:
	docker build -t kamal-proxy .
