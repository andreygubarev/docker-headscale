# Docker image for Headscale

# Environment variables

`HEADSCALE_BIND_ADDR` - the address Headscale will be listening on. Defaults to `127.0.0.1`.
`HEADSCALE_BIND_PORT` - the port Headscale will be listening on. Defaults to `8514`.

`HEADSCALE_ADVERTISE_PROTO` - the protocol Headscale will advertise to clients. Defaults to `http`.
`HEADSCALE_ADVERTISE_ADDR` - the address Headscale will advertise to clients. Defaults to `127.0.0.1`.
`HEADSCALE_ADVERTISE_PORT` - the port Headscale will advertise to clients. Defaults to `8514`.

`HEADSCALE_MAGICDNS_ENABLED` - whether to enable MagicDNS. Defaults to `true`.
`HEADSCALE_MAGICDNS_DOMAIN` - the domain Headscale will be using for serve MagicDNS and the admin interface. Defaults to `headscale.local`.

`HEADSCALE_DATABASE_TYPE` - the type of database Headscale will use. Defaults to `sqlite3`.
`HEADSCALE_DATABASE_PATH` - the path to the database Headscale will use. Defaults to `/var/lib/headscale/db.sqlite`.

# Reference:

- [Headscale](https://github.com/juanfont/headscale)
- [Tailscale MagicDNS](https://tailscale.com/kb/1081/magicdns/)
