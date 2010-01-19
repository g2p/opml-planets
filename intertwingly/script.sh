#!/bin/bash
wget http://planet.intertwingly.net/opml.xml -O opml.xml
xmlstarlet tr opml.xsl opml.xml |tee opml+tags.xml

