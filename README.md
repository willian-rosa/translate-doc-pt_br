# translate-doc-pt_br

Comando necessários para rodar compilar o site da documentação do PHP em Docker.


**Essa documentação está completa.**


## Comandos

```shell
docker run -it --name phpdoc --rm -v ${PWD}:/app -p 80:80 --workdir /app/  php:7.2-apache bash


php doc-base/configure.php --with-lang=pt_BR
php phd/render.php --docbook doc-base/.manual.xml --package PHP --format php --lang pt_BR


cd web-php/manual
ln -s ../../output/php-web pt_BR

php -S 0.0.0.0:80 -t web-php/  web-php/.router.php


php doc-base/scripts/revcheck.php pt_BR > revcheck.html
xdg-open revcheck.html
```


## Comando compactado
```shell
php doc-base/configure.php --with-lang=pt_BR && php phd/render.php --docbook doc-base/.manual.xml --package PHP --format php --lang pt_BR && php -S 0.0.0.0:80 -t web-php/  web-php/.router.php
```