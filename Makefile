#!/usr/bin/make 
#Вверху вызываеться оболочка для работы c makefile

include .env #Подключаем переменные 

docker_bin= $(shell command -v docker 2> /dev/null) #В эту переменную вкладываеться вызов docker с выводом ошибок в черную лыру
docker_compose_bin= $(shell command -v docker-compose 2> /dev/null) #В эту переменную вкладываеться вызов docker-compose с выводом ошибок в черную лыру


up: ## Start all containers (in background)
	$(docker_compose_bin) -f docker-compose.yml up --no-recreate -d 
	#Запуск компоса с задечей создать контейнеры и не дать им стать

down: ## Stop all started for development containers
	$(docker_compose_bin) -f docker-compose.yml down 
	#Остановить и удалить котнейнеры образы и вольюмы