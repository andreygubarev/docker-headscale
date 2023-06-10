# syntax=docker/dockerfile:1
FROM headscale/headscale:0.22.3

LABEL org.opencontainers.image.source=https://github.com/andreygubarev/docker-headscale
LABEL org.opencontainers.image.description="Docker image for Headscale"
LABEL org.opencontainers.image.licenses=MIT

RUN apt-get update \
    && apt-get install -yq --no-install-recommends \
        ca-certificates \
        curl \
        locales \
    && echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
    && locale-gen en_US.UTF-8 \
    && update-locale LANG=en_US.UTF-8 \
    && rm -rf /var/lib/apt/lists/*

ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8

ENV HEADSCALE_DOMAIN=
ENV HEADSCALE_BIND_ADDR=127.0.0.1
ENV HEADSCALE_BIND_PORT=8514
ENV HEADSCALE_SERVER=http://${HEADSCALE_BIND_ADDR}:${HEADSCALE_BIND_PORT}
ENV HEADSCALE_DATABASE_TYPE=sqlite3
ENV HEADSCALE_DATABASE_PATH=/var/lib/headscale/db.sqlite
RUN mkdir -p /etc/headscale

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8514

HEALTHCHECK CMD ["curl", "-f", "http://localhost:8514/health"]
ENTRYPOINT ["/entrypoint.sh"]
CMD ["serve"]
