# So we can find netlify
PATH := node_modules/.bin:$(PATH)

serve:
	mkdocs serve

build:
	mkdocs build --clean

commit: build
	git add html
	git commit -m 'Clean, Build and Deploy'

deploy: commit
	netlify deploy

deploy-only:
	netlify deploy

.PHONY: serve build
