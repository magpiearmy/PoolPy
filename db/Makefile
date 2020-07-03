migrate:
	docker run --rm \
		--network=host \
		-v /Users/adam.tallentire/projects/personal/PoolPy/db/flyway.conf:/flyway/conf/flyway.conf \
		-v /Users/adam.tallentire/projects/personal/PoolPy/db/schema:/flyway/sql \
		flyway/flyway:6.5 \
		migrate \
		-baselineOnMigrate=true

clean:
	docker run --rm \
		--network=host \
		-v /Users/adam.tallentire/projects/personal/PoolPy/db/flyway.conf:/flyway/conf/flyway.conf \
		-v /Users/adam.tallentire/projects/personal/PoolPy/db/schema:/flyway/sql \
		flyway/flyway:6.5 \
		clean