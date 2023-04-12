
all:
	sudo docker-compose -f ./srcs/docker-compose.yml up  

rebuild:
	sudo docker-compose -f ./srcs/docker-compose.yml up    --build 

clean:
	sudo docker-compose -f ./srcs/docker-compose.yml down 


fclean:
	sudo docker-compose -f ./srcs/docker-compose.yml down --rmi all -v
	sudo rm -rf /home/ubuntu/data/site-files
	sudo rm -rf /home/ubuntu/data/db
	mkdir -p /home/ubuntu/data/site-files
	mkdir -p /home/ubuntu/data/db

re: fclean rebuild