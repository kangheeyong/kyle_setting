

docker_container_remove:
	-sudo docker stop $$(sudo docker ps -a -q -f name=jeiger-gpu)
	-sudo docker rm $$(sudo docker ps -a -q -f name=jeiger-gpu)

docker_image_remove: docker_container_remove
	-sudo docker rmi $$(sudo docker images -q -f dangling=true)

docker_run:
	sudo docker build -t jeiger/cuda:10.0-base -f docker/Dockerfile .
	 
	sudo docker run --gpus all -d -ti -p 8090:8090 --name jeiger-gpu jeiger/cuda:10.0-base

docker_exec:
	sudo docker exec -ti jeiger-gpu /bin/bash --login


