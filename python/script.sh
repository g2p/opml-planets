#!/bin/bash
wget http://planet.python.org/opml.xml -O opml.xml
xmlstarlet tr opml.xsl opml.xml |tee opml+tags.xml

