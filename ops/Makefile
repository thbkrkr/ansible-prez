NAME = ansible-prez-ops
REPO = krkr/$(NAME)

integ: build
	docker run --rm -ti \
		-v $$(pwd):/ops \
		-e MACHINE_STORAGE_PATH=/ops/machines/integ \
		-e OS_API_CREDS_PATH=/ops/creds/.openrc-creds.sh \
		$(REPO) zsh

prod: build
	docker run --rm -ti \
		-v $$(pwd):/ops \
		-e MACHINE_STORAGE_PATH=/ops/machines/prod \
		-e OS_API_CREDS_PATH=/ops/creds/.openrc-creds.sh \
		$(REPO) zsh

prez: build
	docker run --rm -ti \
		-v $$(pwd):/ops \
		-e MACHINE_STORAGE_PATH=/ops/machines/prez \
		-e OS_API_CREDS_PATH=/ops/creds/.openrc-creds.sh \
		$(REPO) zsh

build: chown
	docker build --rm -t $(REPO) .

chown:
	sudo chown -R ${USER}:${USER} machines
