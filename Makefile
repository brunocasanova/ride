
ROOT_PATH=OpenShift/brunocasanova/ride

APP_PATH=$(ROOT_PATH)/app
APP_CHD=cd ~/$(APP_PATH)

BUILDER_PATH=$(ROOT_PATH)/builder
BUILDER_CHD=cd ~/$(BUILDER_PATH)

BUNDLE=app.tar.gz

AUTO_COMMIT = "AUTO-COMMIT `date +'%d/%m/%y at %H:%M:%S'`"

run:
	@echo "\x1b[31m[RIDE][RUN]\x1b[0m"; \
	meteor

debug:
	@echo "\x1b[31m[RIDE][EDEBUG]\x1b[0m"; \
	meteor --debug

deploy: meteor-build prepare-bundle bundleify push-origin push-production

meteor-build:
	@echo "\x1b[31m[METEOR][BUILD]\x1b[0m"; \
	meteor build bundler

prepare-bundle:
	@echo "\x1b[31m[BUNDLE][PREPARE]\x1b[0m"; \
	cp bundler/$(BUNDLE) ~/$(BUILDER_PATH); \
	rm -r bundler; \

bundleify:
	@echo "\x1b[31m[BUNDLEIFY]\x1b[0m"; \
	$(BUILDER_CHD); \
	tar -xvf $(BUNDLE) -s '/^bundle//'; \
	rm $(BUNDLE); \

push-production:
	@echo "\x1b[31m[PUSH][PRODUCTION]\x1b[0m"; \
	$(BUILDER_CHD); \
	git add . && git add -u && git commit -m $(AUTO_COMMIT) && git push upstream master -f

push-origin:
	@echo "\x1b[31m[PUSH][ORIGIN]\x1b[0m"; \
	$(APP_CHD); \
	git add . && git add -u && git commit -m $(AUTO_COMMIT) && git push origin master -f

