RED = \033[0;31m
END = \033[0m

all: up

up:
	@if [ ! -f ./srcs/.env ]; then \
		echo $(RED) "\".env\" file is not existing, please add a .env file" $(END); \
	else \
		docker-compose -f ./srcs/docker-compose.yml up -d --build; \
	fi


clean:
	docker-compose -f ./srcs/docker-compose.yml down -v
