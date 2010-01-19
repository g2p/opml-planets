#!/bin/bash
wget $(< ORIGIN) -O feeds.html
tidy -utf8 -o feeds.xhtml feeds.html 
xmlstarlet tr opml.xsl feeds.xhtml |tee feeds.opml

