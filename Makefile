.DEFAULT_GOAL := help

.PHONY: clean
clean: ## delete all non-version controlled files
	git clean -fdx .

.PHONY: debug
debug: ## build TinyRenderer in debug mode
	mkdir debugBuild
	mkdir debugBuildInstall
	cd build && \
		cmake -DCMAKE_INSTALL_PREFIX=../debugBuildInstall -DCMAKE_BUILD_TYPE=Debug ../ && \
		cmake --build  . --target all && \
		cmake --build  . --target install

.PHONY: xcodedebug
xcodedebug: ## build TinyRenderer in debug mode using XCode
	mkdir debugXCodeBuild
	mkdir debugXCodeBuildInstall
	cd debugXCodeBuild && \
		cmake -DCMAKE_INSTALL_PREFIX=../debugXCodeBuildInstall -DCMAKE_BUILD_TYPE=Debug -GXcode ../ && \
		cmake --build  .  && \
		cmake --build  . --target install && \
		open tinyrenderer.xcodeproj

.PHONY: help
help:
	@grep --extended-regexp '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
