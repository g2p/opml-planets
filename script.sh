#!/bin/bash
wget 'http://planet.postgresql.org/feeds.html' -O feeds.html
xmlstarlet sel -N x="http://www.w3.org/1999/xhtml" -t -m "//x:li/x:a" -i 'x:img' -v '@href' -n feeds.html |tee feeds.links 

# That service doesn't add tags. GReader's convention for tags:
# Just an untyped outline containing the rss-typed outlines for the feeds.
#gnome-open http://unold.dk/code/opmlgen/

# First xsl iteration
xmlstarlet el -a feeds.html 
xmlstarlet sel -C -N x="http://www.w3.org/1999/xhtml" -t -m "//x:li" -i 'x:a/x:img' -e outline -a xmlUrl -v 'x:a[1]/@href' -b -a htmlUrl -v 'x:a[2]/@href' -b -b -v 'x:a[2]/text()' -n feeds.html  

xmlstarlet tr opml.xsl feeds.html |tee feeds.opml


