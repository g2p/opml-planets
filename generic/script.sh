#!/bin/bash
for H in $(< planets.hosts.list.broken); do
    wget --continue --timestamping --force-directories --directory-prefix cache http://"$H"/opml.xml
    xmlstarlet tr opml.xsl -s planetHostname="$H" cache/"$H"/opml.xml > cache/"$H"/opml+tags.xml
done
