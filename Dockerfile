FROM centos:7
MAINTAINER Marco Palladino, marco@mashape.com

ENV KONG_VERSION 0.9.2

RUN yum install -y wget https://www.dropbox.com/s/19hdk4ixuzwkd7i/kong-0.9.2featuredns2.el7.noarch.rpm && \
    yum clean all

RUN wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.1.3/dumb-init_1.1.3_amd64 && \
    chmod +x /usr/local/bin/dumb-init
    
COPY config.docker/kong.yml /etc/kong/

ADD setup.sh setup.sh
ADD docker-entrypoint.sh docker-entrypoint.sh

RUN chmod +x setup.sh \
    chmod +x docker-entrypoint.sh

EXPOSE 8000 8443 8001 7946

CMD ./setup.sh && ./docker-entrypoint.sh  && kong start

