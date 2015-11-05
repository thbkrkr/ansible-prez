NAME = ansible-prez
REPO = krkr/$(NAME)

all: build push

build:
	docker build --rm -t $(REPO) .

push:
	docker push $(REPO)

run:
	docker run -d \
		-p 80:80 \
		$(REPO)

dev:
	docker run -ti -p 80:80 \
		-v $$(pwd)/www:/www \
		$(REPO)