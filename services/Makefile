help: ## show this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

##@ Managing application

run: ## run container
	docker compose up -d
	@$(MAKE) -s logs
start: run
stop: ## stop container
	docker compose down
restart: ## restart container
	docker compose restart
	@$(MAKE) -s logs

update: ## pull image and recreate containers
	docker compose pull
	docker compose up -d
	@docker image prune -f >/dev/null
	@$(MAKE) -s logs

##@ Utilities

ps: ## list containers
	docker compose ps

.PHONY: logs
logs: ## print last 100 logs and follow new ones
	docker compose logs \
		--follow \
		--timestamps \
		--no-log-prefix \
		--tail 100 \

shell: ## open container shell
	docker compose exec app sh -c "(bash || sh)"

version: ## get container VERSION file content
	@docker compose exec app cat VERSION
