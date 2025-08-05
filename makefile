include .env

GO := go
GOLDFLAGS := -ldflags="-s -w"
MIGRATIONS_PATH :=./migrations
DB_URL := "postgres://${DB_USER}:${DB_PASSWORD}@${DB_HOST}:${DB_PORT}/${DB_NAME}?sslmode=disable"

.PHONY: build run test lint clean create-migration migrate-up migrate-down migrate-force


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


create-migration:
	migration crete -ext sql -dir $(MIGRATIONS_PATH) -seq $(name)

migrate-up:
	migrate -path $(MIGRATIONS_PATH) -database "$(DB_URL)" up

migrate-down:
	migrate -path $(MIGRATIONS_PATH) -database "$(DB_URL)" down

migrate-force:
	migrate -path $(MIGRATIONS_PATH) -database "$(DB_URL)" force $(version)