HOST=rpi4
NAME=themeator

info: menu select

menu:
	echo "1 make reset              - flutter clean && flutter pub get"
	echo "2 make analyze            - flutter analyze"
	echo "3 make format             - dart format ."
	echo "4 make test               - flutter test"
	echo "5 make update-goldens     - flutter test --update-goldens"
	echo "6 make run                - flutter run --debug"
	echo "7 make update_phony       - update .PHONY in Makefile"
	echo "8 make deploy             - make build && make deploy"

select:
	read -p ">>> " P ; make menu | grep "^$$P " | cut -d ' ' -f2-3 ; make menu | grep "^$$P " | cut -d ' ' -f2-3 | bash

.SILENT:

.PHONY: info menu select reset format analyze test update-goldens run update_phony build deploy 

reset:
	flutter clean && flutter pub get

format:
	dart format lib/ test/

analyze:
	flutter analyze

test:
	flutter test

update-goldens:
	flutter test --update-goldens

run:
	flutter run --debug

update_phony:
	echo "##### Updating .PHONY targets #####"
	targets=$$(grep -E '^[a-zA-Z_][a-zA-Z0-9_-]*:' Makefile | grep -v '=' | cut -d: -f1 | tr '\n' ' '); \
	sed -i.bak "s/^\.PHONY:.*/.PHONY: $$targets/" Makefile && \
	echo "Updated .PHONY: $$targets" && \
	rm -f Makefile.bak

build:
	echo "##### Clean build #####"
	flutter clean
	rm -fvr build
	echo "##### Build for web #####"
	flutter build web --base-href /$(NAME)/

deploy: build
	figlet -f smslant "Zip assets and upload"
	( cd build ; chmod -R a+r web ; mv web $(NAME) ; zip -r $(NAME).zip $(NAME) ; scp $(NAME).zip $(HOST): )
	figlet -f smslant "Server move"
	ssh $(HOST) ./deploy.sh $(NAME)
