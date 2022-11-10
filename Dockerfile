FROM php:7.2-apache

RUN apt update \
    && apt install -y git-core

EXPOSE 80