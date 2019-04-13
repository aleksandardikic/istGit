<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
  <xsl:output method="html" indent="yes"/>
  <xsl:template match="Adresar">
    <html>
      <body>

        <h3>Osobe sa vise od dva mejla</h3>
        <table border="1px">
          <tr>
            <th>Ime</th>
            <th>Prezime</th>
            <th>Broj telefona</th>
            <th>Datum rodj.</th>
            <th>Adresa</th>
            <th>Email</th>
          </tr>
          <xsl:apply-templates select="Osoba" mode="podaci"/>
        </table>
         
        <h3>Kompanije sa vise od dva mejla</h3>
        <table border="1px">
          <tr>
            <th>Naziv</th>
            <th>Adresa</th>
            <th>Broj telefona</th>
            <th>Email</th>
          </tr>
          <xsl:apply-templates select="Kompanija" mode="podaciK"/>
        </table>
     
      </body>
    </html>
  </xsl:template>


  <xsl:template match="Osoba" mode="podaci">
    <xsl:if test="count(eMail) &gt;2">
      <tr>
        <td>
          <xsl:value-of select="punoIme/ime"/>
        </td>
        <td>
          <xsl:value-of select="punoIme/prezime"/>
        </td>
        <td>
          <xsl:value-of select="brojTelefona"/>
        </td>
        <td>
          <xsl:value-of select="datumRodjenja"/>
        </td>
        <td>
          <xsl:value-of select="adresa"/>
        </td> 
        
        <xsl:for-each select="eMail">
          <td>
            <xsl:value-of select="."/>
         </td>
         </xsl:for-each>     
      </tr>     
    </xsl:if>  
  </xsl:template>

  <xsl:template match="Kompanija" mode="podaciK">
    <xsl:if test="count(eMail) &gt;2">
      <tr>
        <td>
          <xsl:value-of select="naziv"/>
        </td>      
        <td>
          <xsl:value-of select="brojTelefona"/>
        </td>
        <td>
          <xsl:value-of select="adresa"/>
        </td>
      <xsl:for-each select="eMail">
          <td>
            <xsl:value-of select="."/>
         </td>
         </xsl:for-each>   
      </tr>     
    </xsl:if>  
  </xsl:template>

</xsl:stylesheet>
