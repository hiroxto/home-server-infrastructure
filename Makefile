.PHONY: help
help: ## show commands ## make
	@printf "\033[36m%-30s\033[0m %-50s %s\n" "[Sub command]" "[Description]" "[Example]"
	@grep -E '^[/a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | perl -pe 's%^([/a-zA-Z_-]+):.*?(##)%$$1 $$2%' | awk -F " *?## *?" '{printf "\033[36m%-30s\033[0m %-50s %s\n", $$1, $$2, $$3}'

.PHONY: build
build:
	docker compose build

.PHONY: ps
ps:
	docker compose ps

.PHONY: up
up:
	docker compose up -d

.PHONY: down
down:
	docker compose down

.PHONY: restart
restart:
	docker compose restart

.PHONY: restart-nginx
restart-nginx:
	docker compose restart nginx

.PHONY: logs
logs:
	docker compose logs
