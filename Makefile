
all:
	sudo docker-compose -f ./srcs/docker-compose.yml up 

rebuild:
	sudo docker-compose -f ./srcs/docker-compose.yml up   --build 

clean:
	sudo docker-compose -f ./srcs/docker-compose.yml down
	sudo rm -rf ./srcs/requirements/wordpress/data
	mkdir -p ./srcs/requirements/wordpress/data
	sudo rm -rf ./srcs/requirements/mariadb/db
	mkdir -p ./srcs/requirements/mariadb/db


fclean: clean
	sudo docker-compose -f ./srcs/docker-compose.yml down --rmi all -v

re: clean rebuild