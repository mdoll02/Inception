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

all: up

up:
	@if [ ! -f ./srcs/.env ]; then \
		echo $(RED) $(BOLD) $(ITALIC) "\".env\" file is not existing, please add a .env file in ./srcs/" $(END); \
	else \
	  	echo $(GREEN) "Starting containers..." $(END); \
		docker-compose -f ./srcs/docker-compose.yml up -d --build; \
	fi


clean: stop

stop:
	@echo $(YELLOW) "Stopping containers..." $(END)
	docker-compose -f ./srcs/docker-compose.yml down -v

fclean: clean
	@echo $(YELLOW) "Removing caches ..." $(END)
	docker builder prune -f

cclean: clean
	@echo $(YELLOW) "Removing all unused containers, networks, images and volumes ..." $(END)
	docker system prune -f

re: fclean all

.PHONY: all up clean stop fclean cclean re