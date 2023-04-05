
all:
	sudo docker-compose -f ./srcs/docker-compose.yml up -d

rebuild:
	sudo docker-compose -f ./srcs/docker-compose.yml up -d --build 

clean:
	sudo docker-compose -f ./srcs/docker-compose.yml down
	sudo rm -rf ./srcs/requirements/wordpress/data
	mkdir -p ./srcs/requirements/wordpress/data
	sudo rm -rf ./srcs/requirements/mariadb/db
	mkdir -p ./srcs/requirements/mariadb/db


fclean:
	sudo docker-compose -f ./srcs/docker-compose.yml down --rmi all -v

re: clean rebuild