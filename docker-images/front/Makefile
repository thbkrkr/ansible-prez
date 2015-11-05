NAME = demo-front
REPO = krkr/$(NAME)

all: build push

build:
	docker build --rm -t $(REPO) .

push:
	docker push $(REPO)

run:
	docker run -d \
		-p 80:80 \
		-e API_URL=//localhost:82 \
		$(REPO)

dev:
	docker run -ti \
		-v $$(pwd)/www:/www \
		-p 80:80 \
		-e API_URL=//localhost:82 \
		$(REPO)