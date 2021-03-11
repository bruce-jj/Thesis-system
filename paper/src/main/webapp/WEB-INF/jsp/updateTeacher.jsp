<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head>
    <title>修改教师信息</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    基于SSM框架的管理系统：实现增、删、改、查。
                </h1>
            </div>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>修改教师的个人信息</small>
                </h1>
            </div>
        </div>
    </div>
        <form action="${path}/teacher/update" method="post">
            <h4>请注意，论文ID不可更改</h4>
            教师ID：  <input type="text" readonly="readonly" name="teacherId" value="${teacher.teacherId}"/>  <br>
            教师名字：<input type="text" name="teacherName" value="${teacher.teacherName}"/> <br>
            教师职称：<input type="text" name="teacherTitle" value="${teacher.teacherTitle}"/> <br>
            教师账号：<input type="text" name="teacherUserName" value="${teacher.teacherUserName}"/>(登录时的用户名) <br>
            教师密码：<input type="text" name="teacherPassword" value="${teacher.teacherPassword}"/>(登录时的密码) <br>
            <input type="submit" value="提交">
        </form>
</div>
</body>
</html>