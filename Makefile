.PHONY: build up down shell reset-db set-permissions shell postgres-shell

# HOME := /opt/src/

reset-db: down set-permissions
	rm -rfv db-data

build: reset-db
	docker-compose down
	docker-compose build --no-cache

set-permissions:
	mkdir -p db-data
	chmod -R 777 db-data

up: set-permissions
	docker-compose up -d

down:
	docker-compose down

shell:
	docker-compose exec core bash -c "cd /opt/src; exec bash"

postgres-shell:
	docker-compose exec postgres bash