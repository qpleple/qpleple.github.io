.PHONY: serve build

# Local development server with live reload, at http://localhost:4000
serve:
	bundle exec jekyll serve

# Build the site into _site/ (same command as the CI workflow)
build:
	bundle exec jekyll build
