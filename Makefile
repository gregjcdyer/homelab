SERVER := serveradmin@192.168.0.64
TRAEFIK_REMOTE_DIR := /home/serveradmin/traefik/data/configs

.PHONY: traefik-add traefik-push update-pihole

traefik-add:
	@bash scripts/traefik-add.sh

traefik-push:
	@bash scripts/traefik-push.sh "$(SERVER)" "$(TRAEFIK_REMOTE_DIR)"