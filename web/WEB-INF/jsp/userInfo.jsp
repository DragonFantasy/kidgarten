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
        <div class="container-fluid">
            <h1>${message}</h1><br>
            <table class="table table-bordered table-striped table-hover" id="user_table">
                <thead><tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Recommand</th>
                </tr></thead>
                
            </table>
        </div>
            
            
        <script>
            $.ajax({
                data:{},
                type:"POST",
                dataType:"json",
                ContentType:"application/json; charset=utf-8",
                url:"./user/getUser.do",
                success:function(data){
                    for(var i = 0; i < data.length; i++)
                    {
                        var body_data = document.createElement("tbody");
                        var tr_data = document.createElement("tr");
                        var uid_cell = document.createElement("td");
                        uid_cell.innerHTML = data[i].uid;
                        var name_cell = document.createElement("td");
                        name_cell.innerHTML = data[i].name;
                        var recommand_cell = document.createElement("td");
                        recommand_cell.innerHTML = data[i].recommand;
                        tr_data.appendChild(uid_cell);
                        tr_data.appendChild(name_cell);
                        tr_data.appendChild(recommand_cell);
                        body_data.appendChild(tr_data);
                        user_table.appendChild(body_data);
                    }
                },
                error:function(data){
                    console.log(data);
                    var body_data = document.createElement("tbody");
                    var tr_data = document.createElement("tr");
                    var uid_cell = document.createElement("td");
                    var name_cell = document.createElement("td");
                    var recommand_cell = document.createElement("td");
                    tr_data.appendChild(uid_cell);
                    tr_data.appendChild(name_cell);
                    tr_data.appendChild(recommand_cell);
                    body_data.appendChild(tr_data);
                    user_table.appendChild(body_data);
                }
            });
        </script>
    </body>
</html>
