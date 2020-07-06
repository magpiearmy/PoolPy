build-and-push-app:
	docker buildx build --push -t magpiearmy/pool-app --platform linux/amd64,linux/arm64,linux/arm/v7 app

build-and-push-db:
	docker buildx build --push -t magpiearmy/pool-app --platform linux/amd64,linux/arm64,linux/arm/v7 db