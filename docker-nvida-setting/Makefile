

docker_container_remove:
	-sudo docker stop $$(sudo docker ps -a -q -f name=jeiger-tensorflow-gpu)
	-sudo docker rm $$(sudo docker ps -a -q -f name=jeiger-tensorflow-gpu)

docker_image_remove: docker_container_remove
	-sudo docker rmi $$(sudo docker images -q -f reference=jeiger/ubuntu:18.04-tensorflow-gpu)

docker_run:
	sudo docker build -t jeiger/ubuntu:18.04-tensorflow-gpu -f docker/Dockerfile .
	sudo docker run --gpus all -d -ti --name jeiger-tensorflow-gpu jeiger/ubuntu:18.04-tensorflow-gpu

docker_exec:
	sudo docker exec -ti jeiger-tensorflow-gpu /bin/bash --login


