
all: cache/feeds.opml

cache/feeds.opml: cache/feeds.html
	xmlstarlet val $<
	xmlstarlet tr opml.xsl $< > $@
	xmlstarlet val $@

# Mark this to always rebuild?
# NB: don't use -O, it interferes with --timestamping
cache/feeds.html:
	wget --continue --timestamping --directory-prefix cache "$(shell cat ORIGIN)"

.PHONY: all

# Don't delete downloaded files just because they are intermediary.
.SECONDARY: cache/feeds.html

# Delete partial downloads and products of failed transforms.
.DELETE_ON_ERROR:

