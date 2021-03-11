<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%pageContext.setAttribute("path", request.getContextPath());
    request.setCharacterEncoding("UTF-8");%>
<html>
<head>
    <title>登录注册</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../../css/login.css">
</head>
<body>

<div class="grad" ><div class="container">
        <div class="row"  >
            <%--对不同设备的处理--%>
            <div class="col-sm-8 col-xs-7 col-lg-8  col-md-8">
                <div class="login">
                    ${login_infor}
                    ${email_infor}
                    <form id="log" class="bs-example bs-example-form" role="form" action="/user/login" method="post">
                        <%--提示用户谨慎选择单选框--%>
                        <span class="radio_infor"></span>
                        <div class="input-group input-group-lg">
                            <span class="input-group-addon"> <span class="glyphicon glyphicon-user"></span></span>
                            <input type="text" class="form-control user" autocomplete="off"  name="username" placeholder="请输入用户名">
                        </div>
                        <br>
                        <div class="input-group input-group-lg">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                            <input type="password" class="form-control"  name="password" placeholder="请输入密码">
                        </div>
                        <br>
                        <div>
                            <div style="text-align: center;">${message}</div>
                            <div style="text-align: center;">
                                <input type="radio" checked="checked" name="level" value="user">用户
                                <input type="radio" name="level" value="admin">管理员
                                <input type="radio" name="level" value="teacher">教师<br>
                            </div>
                        </div>
                        <div class="input-group input-group-lg" style="margin: 0 auto;width:100%;">
                            <button type="submit" class="buttonlarg btn btn-primary btn-lg" style="width:100%;">登陆</button>
                        </div>
                    </form>

                    <button id="reg_fun" class="buttonlarg btn btn-primary btn-lg" style="width:100%;margin-top: 10px;margin-bottom: 20px;">注册功能</button>
                        <div id="reg" style="margin: 50px;display: none">
                            <form action="user/add" method="post">
                                <%--提示用户谨慎选择单选框--%>
                                <span class="radio_infor"></span>
                                <div class="input-group input-group-lg" style="margin: 10px auto;width:100%;">
                                    <div class="input-group input-group-lg">
                                        <span class="input-group-addon"> <span class="glyphicon glyphicon-user"></span></span>
                                        <input type="text" autocomplete="off"  class="form-control user" name="reg_username" placeholder="请输入用户名">
                                    </div>
                                    <br>
                                    <div class="input-group input-group-lg">
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                                        <input type="password" class="form-control" name="reg_password" placeholder="请输入密码">
                                    </div>
                                    <br>
                                    <div id="mail" class="input-group input-group-lg">
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                                        <input type="text" class="form-control"  name="reg_email" placeholder="请输入邮箱">
                                    </div>
                                    <br>
                                    <div id="teacherId" style="display: none;margin-top: -20px;" class="input-group input-group-lg">
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-info-sign
"></span></span>
                                        <input type="password" class="form-control" name="reg_id" placeholder="请输入注册教师的id">
                                    </div>
                                </div>
                                <div>
                                <div style="text-align: center;">
                                    <input id="user_fun" type="radio" checked="checked" name="reg_level" value="user">用户
                                    <input id="admin_fun" type="radio" name="reg_level" value="admin">管理员
                                    <input id="teacher_fun" type="radio" name="reg_level" value="teacher">教师<br>
                                    <div id="title" style="display: none">
                                        <input checked="checked" type="radio" name="reg_title" value="研究生">研究生
                                        <input  type="radio" name="reg_title" value="博士生">博士生
                                        <input  type="radio" name="reg_title" value="博士后">博士后
                                    </div>
                                </div>
                            </div>
                                <button type="submit" class="buttonlarg btn btn-primary btn-lg" style="width:100%;">注册</button>
                            </form>

                        </div>

                        <form action="/user/tofind">
                            <button id="find" type="submit" class="buttonlarg btn btn-primary btn-lg" style="width:100%;">找回密码</button>
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
    $('#reg_fun').click(function () {
        $('#reg').fadeToggle();
        $('#log').fadeToggle();
        $('#find').fadeToggle();

    });

    $('#teacher_fun').click(function () {
        $('#teacherId').fadeIn();
        $('#title').fadeIn();
        $('#mail').fadeOut();
    });

    $('#user_fun').click(function () {
        $('#teacherId').fadeOut();
        $('#title').fadeOut();
        $('#mail').fadeIn();
    });
    $('#admin_fun').click(function () {
        $('#teacherId').fadeOut();
        $('#title').fadeOut();
        $('#mail').fadeOut();

    });
    $('.user').click(function () {
        $('.radio_infor').html('请记得选择您的权限！');
    });
</script>
</body>
</html>
