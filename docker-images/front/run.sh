#!/bin/sh -eu

API_URL=${API_URL:-localhost}

# apiUrl replacement
sed -i \
	"s|http://localhost:81|$API_URL|" \
	/www/index.html

exec nginx