<%--
  Created by IntelliJ IDEA.
  User: vincent
  Date: 2019/10/15
  Time: 17:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%  response.setHeader("refresh", "2;url=/");%>
<%pageContext.setAttribute("path", request.getContextPath());%>
<!DOCTYPE html>
<html>
<head>
    <title>登录注册</title>
    <%--<meta name="viewport" content="width=device-width,initial-scale=1, maximum-scale=1,minimum-scale-1,user-scalable=no" >--%>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/css/login.css">
</head>
<body>

<div class="grad" >
    <div class="container">
        <div class="row">
            <%--对不同设备的处理--%>
            <div class="col-sm-6 col-xs-7 col-lg-6  col-md-6">
                <div class="logindiv" >

                    <div style="text-align: center">
                        <h4 style="margin-top: 50%;margin-left: 50%"></h4>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<script>
    var num = 2;
    document.getElementsByTagName("h4")[0].innerHTML = num + "秒后开始跳转";
    var tim = setInterval(function () {
        num--;  //此时秒数减1
        document.getElementsByTagName("h4")[0].innerHTML = num + "秒后开始跳转";
        if(num == 1){
            clearInterval(tim);
        }
    },1000); //每一秒执行一次
</script>
</body>
</html>