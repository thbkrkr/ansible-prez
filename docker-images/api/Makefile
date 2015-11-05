NAME = demo-api
REPO = krkr/$(NAME)

all: build push

build:
	docker build --rm -t $(REPO) .

push:
	docker push $(REPO)

run:
	docker run -d \
		-p 82:4242 \
		$(REPO)

dev:
	docker run -ti -p 82:4242 \
		-v $$(pwd)/api:/api \
		$(REPO)