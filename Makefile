up:
	docker-compose up -d

down:
	docker-compose down

build:
	docker-compose build

build-clean:
	docker-compose build --no-cache --force-rm --compress

make init:
	docker exec -it laravel-app composer install
	docker exec -it laravel-app php artisan key:generate
	docker exec -it laravel-app php artisan migrate
	docker exec -it laravel-node npm cache clean --force
	docker exec -it laravel-node npm install
	docker exec -it laravel-node npx tailwindcss init -p
	docker exec -it laravel-node npm i

migrate:
	docker exec -it laravel-app php artisan migrate
run:
	docker exec -it laravel-app php artisan $(command)

composer-install:
	docker exec -it laravel-app composer install

npm-install:
	docker exec -it laravel-node npm install $(lib)

composer-update:
	docker exec -it laravel-app composer update

composer-require:
	docker exec -it laravel-app composer require $(lib)

clean-cache:
	docker exec -it laravel-app php artisan cache:clear
	docker exec -it laravel-app php artisan config:clear
	docker exec -it laravel-app composer dump-autoload -o
