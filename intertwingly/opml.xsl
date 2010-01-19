<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 >
 <xsl:output omit-xml-declaration="no" indent="yes"/>
 <!--
 Creates an OPML outline for all feeds planet.intertwingly.net subscribes to.
 All feeds are tagged planet.intertwingly.net .
 -->
 <xsl:template match="//body">
  <!-- GReader will use the title or text as a tag -->
   <xsl:copy>
    <outline text="planet.intertwingly.net">
     <xsl:apply-templates/>
    </outline>
   </xsl:copy>
 </xsl:template>
 <!-- The identity rule -->
 <xsl:template match="node()|@*">
  <xsl:copy>
   <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
 </xsl:template>
</xsl:stylesheet>
