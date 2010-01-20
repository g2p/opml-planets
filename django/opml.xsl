<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:x="http://www.w3.org/1999/xhtml"
 >
 <xsl:output omit-xml-declaration="no" indent="yes" encoding="utf-8"/>
 <!--
 Creates an OPML outline for all feeds the Django community aggregator
 subscribes to.
 All feeds are tagged with Django and djangoproject.com-community .
 -->
 <xsl:template match="/">
  <opml version="1.1">
   <head>
    <title>Feeds of the Django community aggregator</title>
   </head>
   <body>
    <!-- GReader will use the title or text as a tag -->
    <outline text="Django">
     <outline text="djangoproject.com-community">
      <xsl:apply-templates/>
     </outline>
    </outline>
   </body>
  </opml>
 </xsl:template>
 <xsl:template match="//x:li">
  <xsl:if test="x:a[@class='rss']">
   <xsl:element name="outline">
    <xsl:attribute name="text">
     <xsl:value-of select="x:a[1]/text()"/>
    </xsl:attribute>
    <xsl:attribute name="type">rss</xsl:attribute>
    <xsl:attribute name="xmlUrl">
     <xsl:value-of select="x:a[2]/@href"/>
    </xsl:attribute>
    <xsl:attribute name="htmlUrl">
     <xsl:value-of select="x:a[1]/@href"/>
    </xsl:attribute>
   </xsl:element>
   <xsl:value-of select="'&#10;'"/>
  </xsl:if>
 </xsl:template>
 <xsl:template match="text()"/>
</xsl:stylesheet>
