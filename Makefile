
help: ## display this help
	@echo "ebook-friends-fr-transcriptions"
	@echo
	@echo "This is the list of available make targets:"
	@echo " $(shell cat Makefile | sed -E '/^[a-zA-Z-]+:.*##.*/!d;s/## *//;s/$$/\\n/')"


build: ## build the dist/markdown/* and dist/epub/* files
	./scripts/build.sh


