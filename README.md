# Docker devbox dla PHP
Ten projekt dostarcza podstawowe środowisko developerskie dla developerów PHP
łącznie z narzędziami wspomagającymi pracę i jej jakość jak PHPUnit i xDebug.
Główny kontener jest dostosowany do projektów Symfony ze wsparciem SASS, Composer i Gulp.

## UWAGA
Testowany i używany tylko na Linuxie - Ubuntu 16. Prawdopodobnie można użyć także dla Windowsa i Maca.

## Setup
### Wymagania
[TODO] - sprawdzić minialne wersje. Poniżej konfiguracja, na której działa :)
- Docker >= 17.05
- Docker-compose >= 1.11
- dnsmasq dla Linuxa (opcjonalnie, zalecane):
<code>sudo apt-get install dnsmasq</code>

### Instalacja

1. Dodawnie wpisu do **dnsmasq**. - przekierowanie wszystkich subdomen __*.dev-local__
na kontener z zainstalowanym PHP i Apache.
<code>
address=/mail.dev-local/172.20.100.103
address=/dev-local/172.20.100.101
</code>
i restart usługi <code>sudo NetworkManager restart</code>

2. Utworzenie zmiennych potrzebnych podczas budowania obrazu
<code>sh ./createEnv.sh</code>

3. <code>docker-compose build</code>

4. <code>docker-compose up -d</code>

## Jak użyć
Pliki projektów znajdują się w katalogu **projects**. Kontener obsługuje dynamiczne subdomeny - 
każdy folder w katalogu **projects** będzie dostępny pod adresem **http://[nazwa_katalogu].dev-local**
Patrz przykład: **http://example.dev-local**

### Subdomeny specjalne
Ze względu na konfigurację vHostów pod frameworki pewne domeny są zarezerwowane:
- projects/symfony (symfony.dev-local) - pod projekty Symfony 3
- projects/m2 (m2.dev-local) - pod projekty Magento2

### Nowy projekt PHP
1. Utwórz nowy katalog w katalogu **./projects**.
2. Umieść pliki projektu w utworzonym katalogu.
3. Projekt będzie dostępny pod adresem **http://[nazwa_katalogu].dev-local**

### Nowy projekt Symfony ###
1. Utwórz nowy katalog w katalogu **./projects/symfony**.
2. Umieść pliki projektu w utworzonym katalogu.
3. Projekt będzie dostępny pod adresem **http://[nazwa_katalogu].symfony.dev-local**
4. Konfiguracja obsługuje kolejny poziom domen, zatem projekt będzie dostępny również pod
adresem np. **http://admin.[nazwa_katalogu].symfony.dev-local**
