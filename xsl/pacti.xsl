<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
<head>
    <meta charset="utf-8"></meta>
    <title>sites list - OkMeter</title>

    <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le styles -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
    <style type="text/css">@import "/static/jquery.countdown.css";</style>
    <script type="text/javascript" src="/static/jquery.countdown.js"></script>
<script type="text/javascript">
$(function () {
	$('#u1').countdown({until: 21});
	$('#u2').countdown({until: 25});
});
</script>
    <link href="http://twitter.github.com/bootstrap/assets/css/bootstrap.css?v=1.4.0" rel="stylesheet"></link>
    <style type="text/css">
        /* Override some defaults */

        .container-fluid > .sidebar {
            width: 200px;
        }

        .container-fluid > .content {
            margin: 0 200px;
            /*padding: 20px;*/
        }

        /*html, body {*/
            /*background-color: #eee;*/
        /*}*/

        body {
            padding-top: 60px; /* 40px to make the container go all the way to the bottom of the topbar */
        }

        /*.container > footer p {*/
            /*text-align: center; *//* center align it with the container */
        /*}*/

        /*.container {*/
            /*width: 820px; *//* downsize our container to make the content feel a bit tighter and more cohesive. NOTE: this removes two full columns from the grid, meaning you only go to 14 columns and not 16. */
        /*}*/

            /* The white background content wrapper */
        /*.container-fluid > .content {*/
            /*background-color: #fff;*/
            /*padding: 20px;*/
            /*margin: 0 -20px; *//* negative indent the amount of the padding to maintain the grid system */
            /*-webkit-border-radius: 0 0 6px 6px;*/
            /*-moz-border-radius: 0 0 6px 6px;*/
            /*border-radius: 0 0 6px 6px;*/
            /*-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .15);*/
            /*-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .15);*/
            /*box-shadow: 0 1px 2px rgba(0, 0, 0, .15);*/
        /*}*/

            /* Page header tweaks */
        .page-header {
            background-color: #f5f5f5;
            padding: 20px 20px 10px;
            margin: -20px -20px 20px;
        }

            /* Styles you shouldn't keep as they are for displaying this base example only */
        /*.content .span10,*/
        /*.content .span4 {*/
            /*min-height: 500px;*/
        /*}*/

            /* Give a quick and non-cross-browser friendly divider */
        /*.content .span4 {*/
            /*margin-left: 0;*/
            /*padding-left: 19px;*/
            /*border-left: 1px solid #eee;*/
        /*}*/

        /*.topbar .btn {*/
            /*border: 0;*/
        /*}*/

    </style>
</head>

  <body>
<div class="navbar navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <a class="brand" href="#">Обратный отсчет</a>
        </div>
      </div>
    </div>

    <div class="container">

      <h1>Время</h1>

      <p>
        <span class="demoLabel">Имя:</span>
        <div id="u2"></div>
        <span id="u1"></span>
      </p>

    </div>

  </body>
</html>
</xsl:template>


</xsl:stylesheet>


