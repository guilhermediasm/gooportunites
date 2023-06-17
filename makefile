.PHONY: default run build test docs clean

APP_NAME=gopportunities

default: run

run:
	@go run main.go
run-with-docs:
	@swag init
	@go run main.go
build:
	@go build -o $(APP_NAME) main.go
test:
	@go test ./ ...
docs:
	@swag init
ifeq ($(OS),Windows_NT)  
clean:
	@if exist $(APP_NAME) del /F /S /Q $(APP_NAME)
	@if exist docs rmdir /Q /S  docs
else
clean:
	@rm -f $(APP_NAME)
	@rm -rf ./docs
endif