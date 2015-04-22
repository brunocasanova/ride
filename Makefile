
ROOT_PATH=OpenShift/brunocasanova/ride

APP_PATH=$(ROOT_PATH)/app
APP_CHD=cd ~/$(APP_PATH)

BUILDER_PATH=$(ROOT_PATH)/builder
BUILDER_CHD=cd ~/$(BUILDER_PATH)

BUNDLE=app.tar.gz

AUTO_COMMIT = "AUTO-COMMIT `date +'%d/%m/%y at %H:%M:%S'`"

run:
	@echo "\x1b[32m[RIDE][RUN]\x1b[0m"; \
	meteor

debug:
	@echo "\x1b[32m[RIDE][DEBUG]\x1b[0m"; \
	meteor --debug

deploy: meteor-build prepare-bundle bundleify push-origin push-production

meteor-build:
	@echo "\x1b[32m[RIDE]\x1b[0m Building started..."; \
	meteor build bundler

prepare-bundle:
	@echo "\x1b[32m[RIDE]\x1b[0m Prepare bundle..."; \
	cp bundler/$(BUNDLE) ~/$(BUILDER_PATH); \
	rm -r bundler; \

bundleify:
	@echo "\x1b[32m[BUNDLEIFY]\x1b[0m bundleifying..."; \
	$(BUILDER_CHD); \
	echo "\x1b[32m[RIDE]\x1b[0m Extract bundle"; \
	tar -xvf $(BUNDLE) -s '/^bundle//'; \
	rm $(BUNDLE); \

push-origin:
	@echo "\x1b[32m[RIDE]\x1b[0m\x1b[35m[ORIGIN]\x1b[0m Pushing to origin..."; \
	$(APP_CHD); \
	echo "\x1b[32m[RIDE]\x1b[0m\x1b[35m[ORIGIN]\x1b[0m Add changes to stack..."; \
	git add && git add -u; \
	echo "\x1b[32m[RIDE]\x1b[0m\x1b[35m[ORIGIN]\x1b[0m Commiting changes..."; \
	git commit -m $(AUTO_COMMIT); \
	echo "\x1b[32m[RIDE]\x1b[0m\x1b[35m[ORIGIN]\x1b[0m Pushing stack..."; \
	git push origin master -f; \
	git log --graph --decorate --oneline

push-production:
	@echo "\x1b[32m[RIDE]\x1b[0m\x1b[31m[PRODUCTION]\x1b[0m Pushing to production..."; \
	$(BUILDER_CHD); \
	echo "\x1b[32m[RIDE]\x1b[0m\x1b[31m[PRODUCTION]\x1b[0m Removing index..."; \
	rm .git/index; \
	echo "\x1b[32m[RIDE]\x1b[0m\x1b[31m[PRODUCTION]\x1b[0m Add changes to stack..."; \
	git add . && git add -u; \
	echo "\x1b[32m[RIDE]\x1b[0m\x1b[31m[PRODUCTION]\x1b[0m Commiting changes..."; \
	git commit -m $(AUTO_COMMIT); \
	echo "\x1b[32m[RIDE]\x1b[0m\x1b[31m[PRODUCTION]\x1b[0m Pushing stack..."; \
	git push upstream master -f; \
	git log --graph --decorate --oneline


