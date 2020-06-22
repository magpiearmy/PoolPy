migrate:
	docker run --rm \
		--network=poolpy_default \
		-v /Users/adam.tallentire/projects/personal/PoolPy/db/flyway/flyway.conf:/flyway/conf/flyway.conf \
		-v /Users/adam.tallentire/projects/personal/PoolPy/db/flyway/schema:/flyway/sql \
		flyway/flyway \
		migrate

clean:
	docker run --rm \
		--network=poolpy_default \
		-v /Users/adam.tallentire/projects/personal/PoolPy/db/flyway/flyway.conf:/flyway/conf/flyway.conf \
		-v /Users/adam.tallentire/projects/personal/PoolPy/db/flyway/schema:/flyway/sql \
		flyway/flyway \
		clean