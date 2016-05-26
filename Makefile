APP = $(shell basename `pwd` | cut -d "-" -f2-)
VERSION = $(shell cat VERSION)
NAME = capkopper/$(APP)

build:
	docker build -t $(NAME):$(VERSION) .

login:
	docker run -it --rm --env-file=$(APP).env --entrypoint=bash $(NAME):$(VERSION)

run:
	docker run -it --rm -v $(shell pwd)/test/data:/tmp/test/ --env-file=$(APP).env $(NAME):$(VERSION) capkopper 1000

size:
	docker images | grep "$(NAME).*$(VERSION)"

history:
	docker history $(NAME):$(VERSION)

push:
	docker push $(NAME):$(VERSION)