
hostnames = $(shell cat planets.hosts.list)
tagged = $(foreach hostname,$(hostnames),cache/$(hostname)/opml+tags.xml)
untagged = $(foreach hostname,$(hostnames),cache/$(hostname)/opml.xml)

all: $(tagged)

cache/%/opml+tags.xml: cache/%/opml.xml
	xmlstarlet val $<
	xmlstarlet tr opml.xsl -s planetHostname="$*" $< > $@
	xmlstarlet val $@

# Mark this to always rebuild?
cache/%/opml.xml:
	wget --continue --timestamping --force-directories \
	    --directory-prefix cache http://"$*"/opml.xml

.PHONY: all build

.SECONDARY: $(untagged)

.DELETE_ON_ERROR: $(tagged) $(untagged)

