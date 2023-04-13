.PHONY: all clean fclean re rebuild 

DATA_DIR ?= $(HOME)/data

all: $(DATA_DIR)
	sudo docker-compose -f ./srcs/docker-compose.yml up -d

$(DATA_DIR):
	if [ ! -d $@ ]; then mkdir -p $@/site-files; mkdir -p $@/db; fi

rebuild: $(DATA_DIR)
	sudo docker-compose -f ./srcs/docker-compose.yml up -d --build 

clean:
	sudo docker-compose -f ./srcs/docker-compose.yml down

fclean:
	sudo docker-compose -f ./srcs/docker-compose.yml down --rmi all -v
	sudo rm -rf $(DATA_DIR)/site-files
	sudo rm -rf $(DATA_DIR)/db
	sudo rm -rf $(DATA_DIR)

re: fclean rebuild
