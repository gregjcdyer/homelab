#!/usr/bin/env bash
set -e

read -r -p "Service name (e.g. myapp): " name
host="${name}.local.gregdyer.ca"
read -r -p "Backend IP: " ip
read -r -p "Backend port: " port

file="docker/traefik/data/configs/${name}.yml"

if [ -f "$file" ]; then
  echo "Error: $file already exists." >&2
  exit 1
fi

cat > "$file" <<EOF
http:
  routers:
    ${name}:
      entryPoints:
        - 'https'
      rule: 'Host(\`${host}\`)'
      middlewares:
        - default-headers
      tls: {}
      service: ${name}
  services:
    ${name}:
      loadBalancer:
        servers:
          - url: 'http://${ip}:${port}'
        passHostHeader: true
EOF

echo "Created $file"
