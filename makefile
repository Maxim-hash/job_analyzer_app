GO := go
GOLDFLAGS := -ldflags="-s -w"

build: 
	$(GO) build $(GOLDFLAGS) -o bin/app cmd/app/main.go

run:
	./bin/app

test:
	go test ./...

lint:
	golintci-lint run

clean:
	rm -r bin