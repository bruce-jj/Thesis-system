<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%pageContext.setAttribute("path", request.getContextPath());
    request.setCharacterEncoding("UTF-8");%>
<html>
<head>
    <title>更改密码</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../../css/login.css">
</head>
<body>

<div class="grad" >
    <div class="container">
        <div class="row"  >
            <%--对不同设备的处理--%>
            <div class="col-sm-8 col-xs-7 col-lg-8  col-md-8">
                <div class="login">
                    <form id="log" class="bs-example bs-example-form" role="form" action="/user/update" method="post">
                        <%--提示用户谨慎选择单选框--%>
                        <span class="radio_infor"></span>
                        <div class="input-group input-group-lg">
                            <span class="input-group-addon"> <span class="glyphicon glyphicon-user"></span></span>
                            <input type="text" class="form-control user" autocomplete="off"  name="username" placeholder="输入您的用户名">
                        </div>
                        <br>
                            <div class="input-group input-group-lg">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                                 <input type="password" class="form-control"  name="updatePwd1" placeholder="输入您的新密码">
                            </div>

                            <div style="margin-top: 20px" class="input-group input-group-lg">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                                <input type="password" class="form-control"  name="updatePwd2" placeholder="再次确认您的新密码">
                            </div>

                            <br>
                        <div>
                            <div style="text-align: center;">
                                <input type="radio" checked="checked" name="level" value="user">用户
                            </div>
                        </div>

                        <div class="input-group input-group-lg" style="margin: 0 auto;width:100%;">
                            <button type="submit" class="buttonlarg btn btn-primary btn-lg" style="width:100%;">更改密码</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $("[name='username'] ,[name='password']").focus(function() {
        $("#hint").empty();
    })
</script>
</body>
</html>
