<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="refresh" content="1"/>
    <style><![CDATA[
      body{
        background:red;
        font-family:Tahoma, Arial;
        font-size:64px;
//        width:1850px;
        margin:0;
        padding-left:10px;
      }
]]>
    </style>

  </head>
  <body>
   <xsl:apply-templates/>
  </body>
</html>
</xsl:template>


<xsl:template match="msg">
<h1>
  <xsl:value-of select="text()"/>
</h1>
</xsl:template>


</xsl:stylesheet>


