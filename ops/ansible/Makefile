ENV 			= $(shell basename ${MACHINE_STORAGE_PATH})
INVENTORY = inventory/$(ENV)
MACHINES = /ops/machines/$(ENV)

prez:
	ansible-playbook -i $(INVENTORY) playbooks/prez.yml -t docker-run

all:
	ansible-playbook -i $(INVENTORY) playbooks/all.yml

all-redeploy:
	ansible-playbook -i $(INVENTORY) playbooks/all.yml --skip-tags common

help:
	@echo "ansible-playbook -i $(INVENTORY) playbooks/all.yml"

all-t-%:
	ansible-playbook -i $(INVENTORY) playbooks/all.yml -t $*


all-docker-run: all-t-docker-run

ha-api-servers:
	ansible-playbook -i $(INVENTORY) playbooks/ha-api-servers.yml

api-servers:
	ansible-playbook -i $(INVENTORY) playbooks/api-servers.yml

api-docker:
	ansible-playbook -i $(INVENTORY) playbooks/all.yml -l api-servers,ha-api-servers -t docker-run,haproxy-configure

install-docker-machine:
	ansible-playbook -i $(INVENTORY) playbooks/install-docker-machine.yml

## tf

tf-plan:
	source ${OS_API_CREDS_PATH} && cd $(MACHINES) && \
		terraform plan

tf-apply:
	source ${OS_API_CREDS_PATH} && cd $(MACHINES) && \
		terraform apply

## Commands example

exec-%:
	ansible all -i $(INVENTORY) -m command -a "$*"

uptime: exec-uptime

docker-ps:
	ansible api-servers -i $(INVENTORY) -m command -a "docker ps"
	ansible front-servers -i $(INVENTORY) -m command -a "docker ps"

ha-status:
	ansible ha-api-servers -i $(INVENTORY) -m command -s -a "service haproxy status"

test:
	./test.sh