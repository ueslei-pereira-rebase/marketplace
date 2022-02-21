start: ## run app
	@docker-compose run --rm --service-ports app bash -c "bin/setup \
		&& bundle exec rails server --binding 0.0.0.0"
	docker-compose stop