# Colors
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
BLUE="\033[0;34m"
MAGENTA="\033[0;35m"
CYAN="\033[0;36m"
END="\033[0m"

# Fonts
BOLD="\033[1m"
ITALIC="\033[3m"
UNDERLINE="\033[4m"

include ./srcs/.env

OS := $(shell uname)

ifeq ($(OS), Darwin)
	DOCKER_COMPOSE=docker-compose
else
	DOCKER_COMPOSE=docker compose
endif

all: up

up:
	@if [ ! -f ./srcs/.env ]; then \
		echo $(RED) $(BOLD) $(ITALIC) "\".env\" file is not existing, please add a .env file in ./srcs/" $(END); \
	else \
	  	echo $(GREEN) "Starting containers..." $(END); \
	  	$(DOCKER_COMPOSE) -f ./srcs/docker-compose.yml build; \
		$(DOCKER_COMPOSE) -f ./srcs/docker-compose.yml up -d; \
	fi

stop:
	@echo $(YELLOW) "Stopping containers..." $(END)
	$(DOCKER_COMPOSE) -f ./srcs/docker-compose.yml stop

start:
	@echo $(YELLOW) "Starting containers..." $(END)
	$(DOCKER_COMPOSE) -f ./srcs/docker-compose.yml start

down:
	@echo $(YELLOW) "Stopping containers..." $(END)
	$(DOCKER_COMPOSE) -f ./srcs/docker-compose.yml down -v

fclean: down
	@echo $(YELLOW) "Removing caches ..." $(END)
	docker builder prune -f

cclean: down
	@echo $(YELLOW) "Removing all unused containers, networks, images and volumes ..." $(END)
	docker system prune --all -f

re: down all

logs:
	@echo $(YELLOW) "Showing logs..." $(END)
	rm -f logs.log
	$(DOCKER_COMPOSE) -f ./srcs/docker-compose.yml logs -f > logs.log

.PHONY: all up stop start down fclean cclean re logs