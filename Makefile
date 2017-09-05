# So we can find netlify
PATH := node_modules/.bin:$(PATH)

serve:
	mkdocs serve

build:
	mkdocs build --clean

release: build
	git add html
	git commit -m 'Build'

deploy: release
	netlify deploy

deploy-only:
	netlify deploy

.PHONY: serve build
