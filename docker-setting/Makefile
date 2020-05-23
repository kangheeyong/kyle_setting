

docker_container_remove:
	-sudo docker stop $$(sudo docker ps -a -q -f name=jeiger)
	-sudo docker rm $$(sudo docker ps -a -q -f name=jeiger)

docker_image_remove: docker_container_remove
	-sudo docker rmi $$(sudo docker images -q -f dangling=true)

docker_run:
	sudo docker build -t jeiger/ubuntu:18.04 -f docker/Dockerfile .
	sudo docker run  -d -ti  --name jeiger jeiger/ubuntu:18.04

docker_exec:
	sudo docker exec -ti jeiger /bin/bash --login


