#!/bin/bash
set -e

if [ "$1" = 'trytond' ]; then
	# Listen on all interfaces
	sed -i "/^#listen = \[::\]:8000/s/^#//" "$TRYTOND_CONFIG"

	# Run setup scripts for the server
	if [ -d /docker-entrypoint-init.d ]; then
		for f in /docker-entrypoint-init.d/*.sh; do
			[ -f "$f" ] && . "$f"
		done
	fi

	# Reset permissions to the data directory
	#chown -R tryton:tryton "$TRYTOND_DATA"

	exec gosu tryton /usr/local/bin/trytond -c $TRYTOND_CONFIG -v
fi

exec "$@"