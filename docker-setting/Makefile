

docker_container_remove:
	-sudo docker stop $$(sudo docker ps -a -q -f name=jeiger-tensorflow-cpu)
	-sudo docker rm $$(sudo docker ps -a -q -f name=jeiger-tensorflow-cpu)

docker_image_remove: docker_container_remove
	-sudo docker rmi $$(sudo docker images -q -f reference=jeiger/ubuntu:18.04-tensorflow-cpu)

docker_run:
	sudo docker build -t jeiger/ubuntu:18.04-tensorflow-cpu -f docker/Dockerfile .
	sudo docker run  -d -ti  --name jeiger-tensorflow-cpu jeiger/ubuntu:18.04-tensorflow-cpu

docker_exec:
	sudo docker exec -ti jeiger-tensorflow-cpu /bin/bash --login


