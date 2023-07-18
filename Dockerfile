FROM php:7.4

RUN apt update \
    && apt install -y git-core

EXPOSE 80
