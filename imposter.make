JS_FILES=src/app.js
DIST=dist
TODAY=$(shell date +%Y-%B-%d=%H:%M:%S)
TIMESTAMP="// Created at: $(TODAY) \n\n"

all: dist app.js

$(DIST):
	mkdir -p $@

app.js:
	@ echo $(TIMESTAMP) > $(DIST)/$@
	@ cat $(JS_FILES) >> $(DIST)/$@

clean:
	rm -rf $(DIST)

.PHONY: all clean

