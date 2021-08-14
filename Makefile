up:
	docker-compose up --remove-orphans

build:
	mkdir -p web/db
	docker-compose build

	
superuser:
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

ipdb:
	docker-compose run --service-ports web