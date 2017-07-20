<%-- 
    Document   : userinfo
    Created on : 2017-7-17, 14:39:15
    Author     : liu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="js/font-awesome/css/font-awesome.min.css" type="text/css">
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <title>db test</title>
    </head>
    <body>
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
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
                <ul class="nav navbar-nav side-nav">
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

        <h1>${message}</h1><br>
        <table class="table table-bordered table-striped table-hover">
            <thead><tr>
                <th>ID</th>
                <th>Name</th>
                <th>Recommand</th>
            </tr></thead>
            <c:forEach items="${users}" var="user">
            <tbody><tr>
                <td><c:out value="${user.id}"/></td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.recommand}"/></td>
            </tr></tbody>
            </c:forEach>
        </table>
    </body>
</html>
