<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 >
 <xsl:output omit-xml-declaration="no" indent="yes" encoding="utf-8"/>
 <!--
 Creates an OPML outline for planet debian upstream feeds.
 All feeds are tagged with the updo.debian.net .
 -->
 <xsl:template match="/feedlist">
  <opml version="1.1">
   <head>
    <title>Feeds from planet debian upstream</title>
   </head>
   <body>
    <!-- GReader will use the title or text as a tag -->
    <outline text="updo.debian.net">
     <xsl:apply-templates/>
    </outline>
   </body>
  </opml>
 </xsl:template>
 <xsl:template match="//aggregate">
  <xsl:element name="outline">
   <xsl:attribute name="text">
    <xsl:value-of select="@name"/>
   </xsl:attribute>
   <xsl:attribute name="type">rss</xsl:attribute>
   <xsl:attribute name="xmlUrl">
    <xsl:value-of select="@feedurl"/>
   </xsl:attribute>
   <xsl:attribute name="htmlUrl">
    <xsl:value-of select="@url"/>
   </xsl:attribute>
  </xsl:element>
 </xsl:template>
</xsl:stylesheet>
