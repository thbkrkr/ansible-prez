#!/bin/bash -eux

curl -s $(docker-machine ip integ-ha-api-1):80/api/hostname| jq .