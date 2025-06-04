include .env
MIGRATIONS_PATH = ./cmd/migrate/migrations
DB_ADDR=postgres://admin:adminpassword@localhost/social?sslmode=disable

- PHONY: migrate-create 
migration:
	@migrate create -seq -ext sql -dir $(MIGRATIONS_PATH) $(filter-out $@,$(MAKECMDGOALS) )

• PHONY: migrate-up
migrate-up:
	@migrate -path=$(MIGRATIONS_PATH) -database=$(DB_ADDR) up

• PHONY: migrate-down
migrate-down:
	@migrate -path=$(MIGRATIONS_PATH) -database=$(DB_ADDR) down $(filter-out $@,$(MAKEMDGOALS) )