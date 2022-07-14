.PHONY: up
up:
	make traefik.up
	make a.up
	make b.up

.PHONY: stop
stop:
	make a.stop
	make b.stop
	make traefik.stop

.PHONY: traefik.up
traefik.up:
	docker compose --file ./traefik/docker-compose.yml --env-file ./.env up -d

.PHONY: traefik.stop
traefik.stop:
	docker compose --file ./traefik/docker-compose.yml stop

.PHONY: a.up
a.up:
	docker compose --file ./nginx-a/docker-compose.yml --env-file ./.env up -d

.PHONY: a.stop
a.stop:
	docker compose --file ./nginx-a/docker-compose.yml stop

.PHONY: b.up
b.up:
	docker compose --file ./nginx-b/docker-compose.yml --env-file ./.env up -d

.PHONY: b.stop
b.stop:
	docker compose --file ./nginx-b/docker-compose.yml stop
