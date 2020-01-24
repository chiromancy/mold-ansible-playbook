LOCALTEST_CONTAINER_NAME = ansible-test


.PHONY: test
test:
	docker build -f ./docker/Dockerfile.test -t ansibletest ./docker
	docker run -ti --privileged --name $(LOCALTEST_CONTAINER_NAME) -d -p 5000:22 ansibletest

	- ansible-playbook -i inventories/local_docker site.yml -vvv

	docker stop $(LOCALTEST_CONTAINER_NAME)
	docker rm $(LOCALTEST_CONTAINER_NAME)
