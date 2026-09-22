.PHONY: help info run build test test-race vet fmt check

help: ## Показать описание доступных команд
	@awk 'BEGIN {FS = ":.*## "} /^[a-zA-Z0-9_-]+:.*## / {printf "%-12s %s\n", $$1, $$2}' $(MAKEFILE_LIST)

info: ## Показать описание проекта и сервисов
	@printf '%s\n' \
		'Проект: Runtracker — приложение на Go в архитектуре модульного монолита.' \
		'Сервисы:' \
		'  runtracker — основное приложение (cmd/web).'

run: ## Запустить приложение локально
	go run ./cmd/web

build: ## Собрать все пакеты и команды
	go build ./...

test: ## Запустить все тесты
	go test ./...

test-race: ## Запустить тесты с детектором гонок
	go test -race ./...

vet: ## Выполнить статическую проверку Go-кода
	go vet ./...

fmt: ## Отформатировать Go-код
	gofmt -w .

check: fmt vet test test-race build ## Выполнить полный набор проверок
