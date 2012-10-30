<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <head>
    <title>Состояние системы</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="refresh" content="11"/>
    <style><![CDATA[
      body{
        background:#fff;
        font-family:Tahoma, Arial;
//        width:1850px;
        margin:0;
        padding-left:10px;
      }

      .graph{
        width:450px;
        height:265px;
        margin-right: 0px;
        position:relative;
        background-position: -44px -33px;
        background-repeat:no-repeat;
      opacity: 1;}

      .flip-h {
        -moz-transform: scaleY(-1);
        -webkit-transform: scaleY(-1);
        -o-transform: scaleY(-1);
        transform: scaleY(-1);
      }

      .stages {
          opacity: 1;
      }
 
      .absolute .graph{
          width: 420px;
          margin-left: 30px;
          background-position: -75px -32px;
        opacity: 1;}
      .row{
//        width:2300px;
        overflow:hidden;
//        float: left;
        display:inline-block;
      }
      .place{
        width:450px;
        margin-right:10px;
        float:left;
      }
      .axis{
        font-size:0.7em;
        font-weight:normal;
      }
 .name{
        font-size:1.2em;
        font-weight:normal;
        margin:1em 0 .3em;
        padding-left:37px;
      }
        .name__type{
          color:#999;
        }
      .legend{
//        width:2300px;
        margin-top:2px;
        padding-left:20px;
        clear: both;
      }
      .legend a {
        padding:10px;
      }
        .legend__item{
          font-size:0.85em;
          margin-right:30px;
          padding:2px;
          font-weight: bold;
          text-shadow: 1px 1px 1px #000;
        }
        
      .scroller{
        position:absolute;
        left:41px;
        top:8px;
        overflow:hidden;
        width:402px;
        height:260px;
        background:white;
        z-index:1;
      }
        .scroller__list{
          white-space:nowrap;
        }
        .scroller__graph{
          width:399px;
          height:260px;
          background-position:-57px -39px;
          display:inline-block;
        }
        .absolute .scroller{
          left:7px;
        }
      .absolute{
        margin-top:-313px;
        position:absolute;
      }
        .absolute .scroller{
          background:none;
        }
       .graph__scale{
        position:absolute;
        right: 0px;
        height:265px;
        width:20px;
        background-position: -45px -32px;
      } 
]]>
    </style>
  </head>
  <body>
    <div class="legend">
          <a href="/">4 часа</a>
          <a href="/?rra_id=1">один день</a>
          <a href="/?rra_id=2">неделя</a>
          <a href="/?rra_id=3">месяц</a>
    </div>
   <xsl:apply-templates select="/doc/page"/>
  <form id="login" style="display:none;" action="http://cacti.hh.ru/graph.php" method="post" target="login">
      <input type="hidden" name="action" value="login"/>
      <input type="hidden" name="login_username" value="guest"/>
      <input type="hidden" name="login_password" value="guest"/>
    </form>
    <iframe name="login" style="display:none;">&#160;</iframe>
  </body>
</html>
</xsl:template>

<xsl:template match="page">
  <div class="row">
   <xsl:apply-templates/>

<!--
            <span class="legend__item" style="color:#FFFFFF">latency</span>
            <span class="legend__item" style="color:#A88CFF">render</span>
            <span class="legend__item" style="color:#DAAEFF">load</span>

            <span class="legend__item">&#160;&#160;&#160;&#160;&#160;&#160;&#160;</span>
            <span class="legend__item">&#160;&#160;&#160;&#160;&#160;&#160;&#160;</span>
            <span class="legend__item">&#160;&#160;&#160;&#160;&#160;&#160;&#160;</span>
            <span class="legend__item">&#160;&#160;&#160;&#160;&#160;&#160;&#160;</span>
            <span class="legend__item">&#160;&#160;&#160;&#160;&#160;&#160;&#160;</span>
            <span class="legend__item">&#160;&#160;&#160;&#160;&#160;&#160;&#160;</span>
            <span class="legend__item">&#160;&#160;&#160;&#160;&#160;&#160;&#160;</span>
            <span class="legend__item">&#160;&#160;&#160;&#160;&#160;&#160;&#160;</span>
            <span class="legend__item">&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</span>

            <span class="legend__item" style="color:#FFa082">70</span>
            <span class="legend__item" style="color:#FFa082">90</span>
            <span class="legend__item" style="color:#FF7a50">95</span>
            <span class="legend__item" style="color:#FFa082">99</span>
            <span class="legend__item" style="color:#FFc6b4">999</span>
-->

</div>
</xsl:template>

<xsl:template match="graph">
      <div class="place">
        <h1 class="name"><span class="name__type"><xsl:value-of select="@name"/></span>&#160;<xsl:value-of select="../@name"/></h1>
        <div class="axis" style="overflow:hidden">Запросов в секунду</div>
<!--
        <div class="graph" data="10" style="background-image:url('http://cacti.hh.ru/graph_image.php?local_graph_id={@id}&amp;rra_id=5')">
-->
        <div class="graph" data="10" style="background-image:url('http://cacti.hh.ru/graph_image.php?local_graph_id={@id}&amp;{@query}')">
          <div class="graph__line">&#160;</div>
        </div>
        <xsl:apply-templates select="." mode="legend"/>
      </div>
</xsl:template>

<xsl:template match="graph[starts-with(@name,'Frontik')]" mode="legend">
    <div class="legend">
            <span class="legend__item" style="color:#002C80">hh-session</span>
            <span class="legend__item" style="color:#CCCCCC">sofea</span>
            <span class="legend__item" style="color:#FFEC2F">XSL</span>
            <span class="legend__item" style="color:#D60458">fuchakubutsu</span>
    </div>
</xsl:template>


<xsl:template match="graph[@name='Светофор']" mode="legend">
    <div class="legend">
          <span class="legend__item" style="color:#D70000">больше 1 сек</span>
          <span class="legend__item" style="color:#FFF200">больше 0.3 сек</span>
          <span class="legend__item" style="color:#00BD27">все хорошо</span>
    </div>
    <div class="legend">
          <span class="legend__item">линии:</span>
          <span class="legend__item" style="color:#157419">2xx</span>
          <span class="legend__item" style="color:#FFEF49">3xx</span>
          <span class="legend__item" style="color:#0000ff">4xx</span>
          <span class="legend__item" style="color:#d70000">5xx</span>
          <span class="legend__item" style="color:#000000">сумма</span>
    </div>
</xsl:template>


</xsl:stylesheet>


