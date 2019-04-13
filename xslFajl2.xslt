<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
  <xsl:template match="Adresar">
    <html>
      <head>
        <title>Stavka 2</title>
      </head>
      <body>
        <h3>Adresa stalna i datum rođenja u opsegu od 1990-2005 godine: </h3>
        <h4>Osobe: </h4>

        <table border="1px">
          <tr>
            <th>Ime</th>
            <th>Prezime</th>
            <th>Broj telefona</th>
            <th>Datum rodj.</th>
            <th>Adresa</th>
            <th>Email</th>
          </tr>
          <xsl:apply-templates select="Osoba" mode="adresaDatumOsobe"/>
        </table>

        <h4>Kompanije: </h4>
        <table border="1px">
          <tr>
            <th>Naziv</th>
            <th>Adresa</th>
            <th>Broj telefona</th>
            <th>Email</th>
          </tr>
          <xsl:apply-templates select="Kompanija" mode="adresaDatumKompanije"/>
        </table>

        <h3>Osobe cije prezime pocinje sa M</h3>
        <table border="1px">
          <tr>
            <th>Ime</th>
            <th>Prezime</th>
            <th>Broj telefona</th>
            <th>Datum rodj.</th>
            <th>Adresa</th>
            <th>Email</th>
          </tr>
          <xsl:apply-templates select="Osoba" mode="prezimeNaM"/>
        </table>

        <h3>Kompanije sa nazivom duzim od 6</h3>
        <table border="1px">
          <tr>
            <th>Naziv</th>
            <th>Adresa</th>
            <th>Broj telefona</th>
            <th>Email</th>
          </tr>
          <xsl:apply-templates select="Kompanija" mode="nazivOd"/>
        </table>
          
        
      </body>
    </html>      
  </xsl:template>

  

  <xsl:template match="Osoba" mode="adresaDatumOsobe">
    <xsl:if test=" adresa/@tipAdrese = 'stalna' and datumRodjenja/godina &gt; 1990 and datumRodjenja/godina &lt; 2005">
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

  <xsl:template match="Kompanija" mode="adresaDatumKompanije">
    <xsl:if test=" adresa/@tipAdrese = 'stalna' ">
      <tr>
        <td>
          <xsl:value-of select="naziv"/>
        </td>
        <td>
          <xsl:value-of select="adresa"/>
        </td>
        <td>
          <xsl:value-of select="brojTelefona"/>
        </td>
        <xsl:for-each select="eMail">
          <td>
            <xsl:value-of select="."/>
          </td>
        </xsl:for-each>
      </tr>
    </xsl:if>
  </xsl:template>

  <xsl:template match="Osoba" mode="prezimeNaM">  
    <xsl:if test="starts-with(punoIme/prezime,'M') ">
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

  <xsl:template match="Kompanija" mode="nazivOd">
    <xsl:if test=" string-length(naziv) &gt; 6 ">
      <tr>
        <td>
          <xsl:value-of select="naziv"/>
        </td>
        <td>
          <xsl:value-of select="adresa"/>
        </td>
        <td>
          <xsl:value-of select="brojTelefona"/>
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


