FROM debian:bookworm

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    apache2 \
    libapache2-mod-shib && \
    rm -rf /var/lib/apt/lists/*
RUN a2enmod \
    authz_groupfile \
    headers \
    proxy \
    proxy_http \
    shib \
    ssl && \
    sed -i 's/default_bits=3072/default_bits=4096/' /usr/sbin/shib-keygen

COPY start.sh .

CMD ["./start.sh"]
