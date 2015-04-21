
ROOT_PATH=OpenShift/brunocasanova/ride

APP_PATH=$(ROOT_PATH)/app
APP_CHD=cd ~/$(APP_PATH)

BUILDER_PATH=$(ROOT_PATH)/builder
BUILDER_CHD=cd ~/$(BUILDER_PATH)

BUNDLE=app.tar.gz

AUTO_COMMIT = "AUTO-COMMIT `date +'%d/%m/%y at %H:%M:%S'`"

run:
	@meteor

debug:
	@meteor --debug

deploy: meteor-build prepare-bundle bundleify push-origin push-production

meteor-build:
	@meteor build bundler

prepare-bundle:
	cp bundler/$(BUNDLE) ~/$(BUILDER_PATH); \
	rm -r bundler; \

bundleify:
	$(BUILDER_CHD); \
	tar -xvf $(BUNDLE) -s '/^bundle//'; \
	rm $(BUNDLE); \

push-production:
	$(BUILDER_CHD); \
	git add . && git add -u && git commit -m $(AUTO_COMMIT) && git push upstream master -f

push-origin:
	$(APP_CHD); \
	git add . && git add -u && git commit -m $(AUTO_COMMIT) && git push origin master -f

