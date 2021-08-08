help: ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

env:  ## Create local .env
	@if [ ! -f ./.env ]; then \
		cp .env.example .env; \
	fi

build:  ## Build docker image
	@docker-compose build

up:  ## Up the local config
	@docker-compose up -d --remove-orphans


down:  ## Stop containers
	@docker-compose -f down

run: env build up  ## Run system
	@docker-compose exec -T app php artisan key:generate

