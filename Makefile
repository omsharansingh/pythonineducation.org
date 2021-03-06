.PHONY: help build serve test deploy

help:
	@echo 'Makefile for pythonineducation.org'
	@echo ''
	@echo 'Usage:'
	@echo '   make sass     build the static CSS files from sass'
	@echo '   make build    build the site into the output directory'
	@echo '   make serve    build the site and serve on port 8000, watching for changes'
	@echo '   make test     test that site builds, has no broken links, and spells the conference name correctly'
	@echo '   make deploy   deploy site'
	@echo ''

sass:
	sassc media/scss/main.scss media/css/main.css
	sassc media/scss/bootstrap.scss media/css/bootstrap.css
	sassc media/scss/bootstrap-extended.scss media/css/bootstrap-extended.css

build: sass
	wok

serve: sass
	wok --serve

test:
	./pre-flight-checks.sh

deploy:
	./deploy.sh
