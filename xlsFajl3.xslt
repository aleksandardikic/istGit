<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

  <xsl:template match="adresa" >
    <xsl:element name="adresa">
      <xsl:attribute name="ulica">
        <xsl:value-of select="ulica"/>
      </xsl:attribute>
      <xsl:attribute name="broj">
        <xsl:value-of select="broj"/>
      </xsl:attribute>
      <xsl:attribute name="broj">
        <xsl:value-of select="broj"/>
      </xsl:attribute>
      <xsl:attribute name="grad">
        <xsl:value-of select="grad"/>
      </xsl:attribute>
    </xsl:element >
  </xsl:template>
</xsl:stylesheet>


<!-- Samo deo za adresar
<xsl:template match="Adresar">

        <xsl:apply-templates select="Osoba/adresa"/>
       
  </xsl:template>


  <xsl:template match="adresa" >
    <xsl:element name="adresa">
      <xsl:attribute name="ulica">
        <xsl:value-of select="ulica"/>
      </xsl:attribute>
      <xsl:attribute name="broj">
        <xsl:value-of select="broj"/>
      </xsl:attribute>
      <xsl:attribute name="broj">
        <xsl:value-of select="broj"/>
      </xsl:attribute>
      <xsl:attribute name="grad">
        <xsl:value-of select="grad"/>
      </xsl:attribute>  
    </xsl:element >
</xsl:template>

-->