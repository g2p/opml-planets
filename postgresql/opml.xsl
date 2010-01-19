<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:x="http://www.w3.org/1999/xhtml"
 >
 <xsl:output omit-xml-declaration="no" indent="yes"/>
 <!--
 Creates an OPML outline for all feeds planet.postgresql.org subscribes to.
 All feeds are tagged with PostgreSQL and planet.postgresql.org .
 Additionally, feeds from employees of a particular company are tagged with
 the company name.
 -->
 <xsl:template match="/">
  <opml version="1.1">
   <head>
    <title>Feeds of planet.postgresql.org</title>
   </head>
   <body>
    <!-- GReader will use the title or text as a tag -->
    <outline title="PostgreSQL" text="PostgreSQL">
     <outline title="planet.postgresql.org" text="planet.postgresql.org">
      <xsl:apply-templates/>
     </outline>
    </outline>
   </body>
  </opml>
 </xsl:template>
 <xsl:template match="//x:li">
  <xsl:if test="x:a/x:img">
   <xsl:element name="outline">
    <xsl:attribute name="text">
     <xsl:value-of select="x:a[2]/text()"/>
    </xsl:attribute>
    <xsl:attribute name="type">rss</xsl:attribute>
    <xsl:attribute name="xmlUrl">
     <xsl:value-of select="x:a[1]/@href"/>
    </xsl:attribute>
    <xsl:attribute name="htmlUrl">
     <xsl:value-of select="x:a[2]/@href"/>
    </xsl:attribute>
   </xsl:element>
   <xsl:value-of select="'&#10;'"/>
  </xsl:if>
  <xsl:if test="x:ul">
   <xsl:element name="outline">
    <xsl:attribute name="text">
     <xsl:value-of select="x:a/text()"/>
    </xsl:attribute>
    <xsl:attribute name="htmlUrl">
     <xsl:value-of select="x:a/@href"/>
    </xsl:attribute>
    <xsl:apply-templates/>
   </xsl:element>
   <xsl:value-of select="'&#10;'"/>
  </xsl:if>
 </xsl:template>
 <xsl:template match="text()"/>
</xsl:stylesheet>
