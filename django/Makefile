
all: cache/feeds.opml

cache/feeds.opml: cache/feeds.xhtml
	xmlstarlet tr opml.xsl $< > $@
	xmlstarlet val $@

cache/feeds.xhtml: cache/index.html
	tidy -utf8 -o $@ $< ||true
	xmlstarlet val $@

# Mark this to always rebuild?
# NB: don't use -O, it interferes with --timestamping
cache/index.html:
	wget --continue --timestamping --directory-prefix cache "$(shell cat ORIGIN)"

.PHONY: all

# Don't delete downloaded files just because they are intermediary.
.SECONDARY: cache/feeds.html cache/feeds.xhtml

# Delete partial downloads and products of failed transforms.
.DELETE_ON_ERROR:

