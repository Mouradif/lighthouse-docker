include .env

CONTAINER=
DC=docker-compose

.PHONY: up down stop ps re logs

up:
	$(DC) up -d

down:
	$(DC) down

stop:
	$(DC) stop

ps:
	$(DC) ps

geth:
	$(eval CONTAINER := geth)

beacon:
	$(eval CONTAINER := beacon_node)

validator:
	$(eval CONTAINER := validator_client)

logs:
	$(DC) logs --tail 100 -f --timestamps $(CONTAINER)

bash:
	$(DC) exec $(CONTAINER) sh

restart:
	$(DC) stop $(CONTAINER)
	$(DC) up -d

clean: down
	sudo rm -rf geth-data/ geth-ancient-data/ jwttoken/ lighthouse-data/

console:
	$(DC) exec geth sh -c 'geth attach'

re: down up
