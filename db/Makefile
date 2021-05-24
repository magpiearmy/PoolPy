migrate:
	$(MAKE) run-flyway CMD=migrate

clean:
	$(MAKE) run-flyway CMD=clean

run-flyway:
	docker run --rm \
		--network=host \
		-v $(shell pwd)/flyway/flyway.conf:/flyway/conf/flyway.conf \
		-v $(shell pwd)/flyway/schema:/flyway/sql \
		flyway/flyway:6.5 \
		$(CMD)