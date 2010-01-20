<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 >
 <xsl:output omit-xml-declaration="no" indent="yes" encoding="utf-8"/>
 <!--
 Creates an OPML outline for all feeds planet.intertwingly.net subscribes to.
 All feeds are tagged with the planet's hostname.
 -->
 <xsl:template match="//body">
  <!-- GReader will use the title or text as a tag -->
   <xsl:copy>
    <outline text="{$planetHostname}">
     <xsl:apply-templates/>
    </outline>
   </xsl:copy>
 </xsl:template>
 <!-- Tag twitter feeds so I can remove them.
      Planet KDE is the major offender. -->
 <xsl:template match="//outline[starts-with(@xmlUrl, 'http://twitter.com/statuses/user_timeline/')]">
  <outline text="twitter">
   <xsl:copy>
    <xsl:apply-templates select="@*|node()"/>
   </xsl:copy>
  </outline>
 </xsl:template>
 <xsl:template match="//outline[starts-with(@xmlUrl, 'http://identi.ca/')]">
  <outline text="identi.ca">
   <xsl:copy>
    <xsl:apply-templates select="@*|node()"/>
   </xsl:copy>
  </outline>
 </xsl:template>
 <!-- The identity rule -->
 <xsl:template match="node()|@*">
  <xsl:copy>
   <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
 </xsl:template>
</xsl:stylesheet>
