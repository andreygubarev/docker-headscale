#!/bin/sh

cat << EOF > /etc/headscale/config.yaml
server_url: ${HEADSCALE_ADVERTISE_PROTO}://${HEADSCALE_ADVERTISE_ADDR}:${HEADSCALE_ADVERTISE_PORT}
listen_addr: ${HEADSCALE_BIND_ADDR}:${HEADSCALE_BIND_PORT}

db_type: ${HEADSCALE_DATABASE_TYPE}
db_path: ${HEADSCALE_DATABASE_PATH}

ip_prefixes:
  - 100.64.0.0/10

dns_config:
  magic_dns: ${HEADSCALE_MAGICDNS_ENABLED}
  override_local_dns: true
  nameservers:
    - 1.1.1.1
  base_domain: ${HEADSCALE_MAGICDNS_DOMAIN}

derp:
  urls:
    - https://controlplane.tailscale.com/derpmap/default
  auto_update_enabled: true
  update_frequency: 24h

private_key_path: /var/lib/headscale/private.key
noise:
  private_key_path: /var/lib/headscale/noise_private.key

disable_check_updates: true
EOF

headscale "$@"
