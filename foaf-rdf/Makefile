
hostnames = $(shell cat planets.hosts.list)
opml = $(foreach hostname,$(hostnames),cache/$(hostname)/opml.xml)
foaf = $(foreach hostname,$(hostnames),cache/$(hostname)/bloggers.rdf)

all: $(opml)

cache/%/opml.xml: cache/%/bloggers.rdf
	xmlstarlet val $<
	xmlstarlet tr opml.xsl -s planetHostname="$*" $< > $@
	xmlstarlet val $@

# Mark this to always rebuild?
cache/%/opml.xml:
	wget --continue --timestamping --force-directories \
	    --directory-prefix cache http://"$*"/bloggers.rdf

.PHONY: all

# Don't delete downloaded files just because they are intermediary.
.SECONDARY: $(foaf)

# Delete partial downloads and products of failed transforms.
.DELETE_ON_ERROR:

