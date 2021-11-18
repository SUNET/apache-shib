FROM httpd:2.4

RUN apt-get update && apt-get install -y \
    libapache2-mod-shib
RUN a2enmod \
    proxy \
    proxy_http \
    ssl \
    shib

CMD service shibd start && httpd-foreground
