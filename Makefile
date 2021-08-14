up: build
	docker-compose up

start:
	docker-compose up

build:
	mkdir -p web/db
	docker-compose build
	
setup: build up
	docker-compose exec web ./manage.py createsuperuser

stop:
	docker-compose down
	docker-compose stop

clean: stop
	docker-compose rm

rebuild: clean build up

shell:
	docker-compose run web bash

migrations:
	docker-compose exec web ./manage.py makemigrations

migrate:
	docker-compose exec web ./manage.py migrate
