
all:
	sudo docker-compose -f ./srcs/docker-compose.yml up -d

rebuild:
	sudo docker-compose -f ./srcs/docker-compose.yml up -d --build 

clean:
	sudo docker-compose -f ./srcs/docker-compose.yml down

fclean:
	sudo docker-compose -f ./srcs/docker-compose.yml down --rmi all -v

re: clean rebuild