.PHONY: dev

all: vendor web/bootflat

composer.phar:
	curl -s https://getcomposer.org/installer | php
	touch composer.phar

vendor: composer.phar
	./composer.phar install
	touch vendor

dev: all
	app/console server:run

web/assets/vendor:
	bower install

web/bootflat: web/assets/vendor
	ln -s assets/vendor/bootflat/bootflat/ web/bootflat

.PHONY: update
update: web/bootflat
	bower update

