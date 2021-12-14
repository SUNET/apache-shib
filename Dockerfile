FROM ubuntu

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    apache2 \
    libapache2-mod-shib
RUN a2enmod \
    proxy \
    proxy_http \
    ssl \
    shib \
    headers

COPY start.sh .

CMD ./start.sh
