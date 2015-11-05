#!/bin/bash

echo '{
  "date":'$(date +%s)',
  "hostname":"'$HOSTNAME'",
  "ip":"'$IP'",
  "random":"'$RANDOM'",
  "api_version":"'$API_VERSION'",
  "env":"'$ENV'",
  "deployment":"'$DEPLOYMENT'"
}'

