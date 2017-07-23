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
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        
        <script>
            function resizeIframe(frame)
            {
                frame.style.height = frame.contentWindow.document.body.scrollHeight + "px";
                frame.style.paddingTop = "51px";
            }
        </script>
        
        <title>调度系统</title>
    </head>

    <body>
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">切换标签</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">调度系统</a>
            </div>
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav">
                    <li class="active" id="li0">
                        <a href="#"><span class="fa fa-fw fa-table"></span>数据表</a>
                    </li>
                    <li id="li1">
                        <a href="#"><span class="fa fa-fw fa-bar-chart"></span>统计图</a>
                    </li>
                    <li id="li2">
                        <a href="#"><span class="fa fa-fw fa-cog"></span>设置</a>
                    </li>
                </ul>
            </div>
        </nav>
        <iframe id="subframe" src="./userInfo.jsp" width="100%" onload="resizeIframe(this)" scrolling="no"/>
    </body>
</html>
