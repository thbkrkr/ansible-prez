FROM krkr/dops

RUN apk --update add tmux

COPY . /ops

ENV MACHINE_STORAGE_PATH=/ops/machines/integ \
		OS_API_CREDS_PATH=/ops/creds/.openrc-creds.sh \
		ANSIBLE_HOST_KEY_CHECKING=False

WORKDIR /ops/ansible