<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="js/font-awesome/css/font-awesome.min.css" type="text/css">
        <script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="./js/bootstrap.min.js"></script>
        
        <title>调度系统</title>
    </head>

    <body class="no-skin" onhashchange="miniSPA.changeUrl();">
        <%@include file="./header.html" %>
        
        <div id="spa_body" style="width:1920px;height:1000px;">
	</div>
        
        <%@include file="./footer.html" %>
        
        <script type="text/javascript" src="./js/spaPage.js"></script>
        <script type="text/javascript" src="./js/spa.js"></script>
        <script type="text/javascript">
            miniSPA.changeUrl();
        </script>
    </body>
</html>
