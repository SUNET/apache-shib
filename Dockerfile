FROM debian:bookworm

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    apache2 \
    libapache2-mod-shib
RUN a2enmod \
    authz_groupfile \
    headers \
    proxy \
    proxy_http \
    shib \
    ssl

COPY start.sh .

CMD ["./start.sh"]
