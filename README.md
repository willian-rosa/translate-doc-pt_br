# translate-doc-pt_br

Comando necessários para rodar compilar o site da documentação do PHP em Docker.


**Essa documentação não está completa.**


### Criando imagem docker
Essa imagem tem o PHP, apache e git-core.
```shell
docker build -t translate_doc_php_pt_br .
```



### 1. Gerando revcheck

```shell
docker run -it --name phpdoc --rm -v ${PWD}:/app -p 80:80 --workdir /app/  translate_doc_php_pt_br bash
php doc-base/configure.php --with-lang=pt_BR && php phd/render.php --docbook doc-base/.manual.xml --package PHP --format php --lang pt_BR && php doc-base/scripts/revcheck.php pt_BR > revcheck.html

# fora do container 
xdg-open revcheck.html
```

### 2. Testando

Comando compactado para compilar e subir sevidor:
```shell
docker run -it --name phpdoc --rm -v ${PWD}:/app -p 80:80 --workdir /app/  translate_doc_php_pt_br bash
php doc-base/configure.php --with-lang=pt_BR && php phd/render.php --docbook doc-base/.manual.xml --package PHP --format php --lang pt_BR && php -S 0.0.0.0:80 -t web-php/  web-php/.router.php
```

Exemplo de link de teste: [http://localhost/manual/pt_BR/function.json-encode.php](http://localhost/manual/pt_BR/function.json-encode.php)