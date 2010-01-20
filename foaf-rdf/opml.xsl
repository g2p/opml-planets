<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
 xmlns:foaf="http://xmlns.com/foaf/0.1/"
 xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
 xmlns:rss="http://purl.org/rss/1.0/"
 xmlns:dc="http://purl.org/dc/elements/1.1/"
 >

 <xsl:output omit-xml-declaration="no" indent="yes" encoding="utf-8"/>
 <!--
 Creates an OPML outline for RDF-based planets.
 The import is dumb and doesn't use the RDF semantic model, just the foaf xml.
 (I don't even know how to use this as RDF). But it works.
 -->
 <xsl:template match="/">
  <opml version="1.1">
   <head>
    <title>Feeds of <xsl:value-of select="$planetHostname"/></title>
   </head>
   <body>
    <!-- GReader will use the title or text as a tag -->
    <outline text="{$planetHostname}">
     <xsl:apply-templates/>
    </outline>
   </body>
  </opml>
 </xsl:template>
 <xsl:template match="//foaf:Agent">
  <xsl:element name="outline">
   <xsl:attribute name="text">
    <!--xsl:value-of select="foaf:name/text()"/-->
    <xsl:value-of select=".//dc:title/text()"/>
   </xsl:attribute>
   <xsl:attribute name="type">rss</xsl:attribute>
   <xsl:attribute name="xmlUrl">
    <xsl:value-of select=".//rss:channel/@rdf:about"/>
   </xsl:attribute>
   <xsl:attribute name="htmlUrl">
    <xsl:value-of select=".//foaf:Document/@rdf:about"/>
   </xsl:attribute>
  </xsl:element>
  <xsl:value-of select="'&#10;'"/>
 </xsl:template>
 <xsl:template match="text()"/>
</xsl:stylesheet>
