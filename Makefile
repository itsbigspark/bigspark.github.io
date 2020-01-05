NPM := npm
VENDOR_DIR := assets/vendor/
SCSS_DIR := _sass/
JEKYLL := jekyll

install:
	$(NPM) install

include-npm-deps:
	mkdir -p $(VENDOR_DIR) _sass/bootstrap
	cp node_modules/jquery/dist/jquery.min.js $(VENDOR_DIR)
	cp node_modules/popper.js/dist/umd/popper.min.js $(VENDOR_DIR)
	cp node_modules/bootstrap/dist/js/bootstrap.min.js $(VENDOR_DIR)
	cp -r node_modules/bootstrap/scss/* _sass/bootstrap

build: install include-npm-deps
	$(JEKYLL) build

serve: install include-npm-deps
	JEKYLL_ENV=production $(JEKYLL) serve

generate-githubpages:
	rm -fr docs && JEKYLL_ENV=production $(JEKYLL) build
# 	rm -fr docs && JEKYLL_ENV=production $(JEKYLL) build --baseurl https://marcanuy.github.io/jekyll-bootstrap4/ -d docs/ && touch docs/.nojekyll
