

docker_container_remove:
	-sudo docker stop $$(sudo docker ps -a -q -f name=jeiger-tensorflow-gpu)
	-sudo docker rm $$(sudo docker ps -a -q -f name=jeiger-tensorflow-gpu)

docker_image_remove: docker_container_remove
	-sudo docker rmi $$(sudo docker images -q -f dangling=true)

docker_run:
	sudo docker build -t jeiger/cuda:10.1-tensorflow-gpu -f docker/Dockerfile .
	 
	sudo docker run --gpus all -d -ti -p 8090:8090 --name jeiger-tensorflow-gpu jeiger/cuda:10.1-tensorflow-gpu

docker_exec:
	sudo docker exec -ti jeiger-tensorflow-gpu /bin/bash --login


