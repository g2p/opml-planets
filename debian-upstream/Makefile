
all: cache/feeds.opml

cache/feeds.opml: cache/feeds.xml
	xmlstarlet tr opml.xsl $< > $@
	xmlstarlet val $@

cache/feeds.xml: cache/feeds.txt
	grep aggregate $< | \
	sed -re 's#^\* \[\[!(aggregate .*)\]\]#<\1 />#' -e 's#expirecount=[0-1]+##' -e 's#tag="[^"]*"##g' -e '1i<feedlist>' -e '$$a</feedlist>' > $@
	xmlstarlet val $@

# Mark this to always rebuild?
# NB: don't use -O, it interferes with --timestamping
cache/feeds.txt:
	wget --continue --timestamping --directory-prefix cache \
		"$(shell cat ORIGIN)"
	cp -T -- "cache/index.html?p=updo.git;a=blob_plain;f=feeds.mdwn" $@

.PHONY: all

# Don't delete downloaded files just because they are intermediary.
.SECONDARY: cache/feeds.txt

# Delete partial downloads and products of failed transforms.
.DELETE_ON_ERROR:

