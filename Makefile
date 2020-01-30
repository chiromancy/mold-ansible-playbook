LOCALTEST_CONTAINER_NAME = ansible-test
PWD = $(shell pwd)

.PHONY: test
test:
	docker build -f ./docker/Dockerfile.test -t ansibletest ./docker
	docker run -ti --privileged --name $(LOCALTEST_CONTAINER_NAME) \
	-v $(PWD)/test:/test -d -p 5000:22 ansibletest

	- ansible-playbook -i inventories/local_docker site.yml -vvv
	- docker exec -it --workdir /test $(LOCALTEST_CONTAINER_NAME) py.test -v /test/playbook_test.py
	docker stop $(LOCALTEST_CONTAINER_NAME)
	docker rm $(LOCALTEST_CONTAINER_NAME)
