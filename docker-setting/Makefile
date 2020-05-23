

docker_container_remove:
	-sudo docker stop $$(sudo docker ps -a -q -f name=jeiger-tensorflow)
	-sudo docker rm $$(sudo docker ps -a -q -f name=jeiger-tensorflow)

docker_image_remove: docker_container_remove
	-sudo docker rmi $$(sudo docker images -q -f dangling=true)

docker_run:
	sudo docker build -t jeiger/ubuntu:18.04-tensorflow -f docker/Dockerfile .
	sudo docker run  -d -ti  --name jeiger-tensorflow jeiger/ubuntu:18.04-tensorflow

docker_exec:
	sudo docker exec -ti jeiger-tensorflow /bin/bash --login


