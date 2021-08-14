up:
	docker-compose up --remove-orphans

build:
	mkdir -p web/db
	docker-compose build

stop:
	docker-compose down
	docker-compose stop

clean: stop
	docker-compose rm

rebuild: clean build up

shell:
	docker-compose run web bash

static:
	python manage.py collectstatic
migrate:
	python manage.py migrate

migrations:
	python manage.py makemigrations

dump:
	python manage.py dumpdata

pre:
	pre-commit run --all-files

demo:
	python manage.py loaddata demo.json

initial:
	python manage.py loaddata initial.json

clean-b:
	git branch | grep -v "main" | xargs git branch -D


pg:
	open http://localhost:8080/browser/



ipdb:
	docker-compose run --service-ports web

run:
	python manage.py runserver

superuser:
	python manage.py createsuperuser

deploy:
	git push heroku main

dropalltables:
	python manage.py drop_all_tables

cache_product:
	python manage.py cache_product_names

clean_cache_product:
	python manage.py clean_cache_product_names

h-local:
	heroku local web

h-open:
	heroku open

h-logs:
	heroku logs --tail

h-shell:
	heroku run python manage.py shell

h-bash:
	heroku run bash

h-migrate:
	heroku run python manage.py migrate

h-pg:
	heroku pg:psql

h-superuser:
	heroku run python manage.py createsuperuser

h-plogs:
	heroku addons:open papertrail

h-demo:
	heroku run python manage.py loaddata demo.json

h-redis-policy:
	heroku redis:maxmemory --policy=allkeys-lfu --app=guorkflow

h-roles:
	heroku run python manage.py create_roles

h-prod-roles:
	heroku run python manage.py create_roles -a guorkflow-prod

h-prod-initial:
	heroku run python manage.py loaddata initial.json -a guorkflow-prod

h-prod-logs:
	heroku logs -a guorkflow-prod --tail

h-prod-migrate:
	heroku run python manage.py migrate -a guorkflow-prod

h-prod-cache:
	heroku run python manage.py cache_product_names -a guorkflow-prod