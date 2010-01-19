<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:exslt="http://exslt.org/common"
 xmlns:math="http://exslt.org/math"
 xmlns:date="http://exslt.org/dates-and-times"
 xmlns:func="http://exslt.org/functions"
 xmlns:set="http://exslt.org/sets"
 xmlns:str="http://exslt.org/strings"
 xmlns:dyn="http://exslt.org/dynamic"
 xmlns:saxon="http://icl.com/saxon"
 xmlns:xalanredirect="org.apache.xalan.xslt.extensions.Redirect"
 xmlns:xt="http://www.jclark.com/xt"
 xmlns:libxslt="http://xmlsoft.org/XSLT/namespace"
 xmlns:test="http://xmlsoft.org/XSLT/"
 xmlns:x="http://www.w3.org/1999/xhtml"
 extension-element-prefixes="exslt math date func set str dyn saxon xalanredirect xt libxslt test"
 exclude-result-prefixes="math str">
<xsl:output omit-xml-declaration="no" indent="yes"/>
<xsl:param name="inputFile">-</xsl:param>
<xsl:template match="/">
<opml version="1.1">
 <head>
  <title>Feeds of planet.postgresql.org</title>
 </head>
 <body>
  <outline title="PostgreSQL" text="PostgreSQL">
   <!-- GReader will use the title or text as a tag -->
   <xsl:call-template name="t1"/>
  </outline>
 </body>
</opml>
</xsl:template>
<xsl:template name="t1">
  <xsl:for-each select="//x:li">
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
  </xsl:for-each>
</xsl:template>
</xsl:stylesheet>
