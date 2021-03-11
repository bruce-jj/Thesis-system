<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/4/6
  Time: 16:57
  To change this template use File | Settings | File Templates.
--%>

<%--增加标签库 展示所有从数据库传来的数据--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String appPath = request.getContextPath(); %>
<html>
<head>
    <title>管理员查看</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    基于SSM框架的论文管理系统
                </h1>
            </div>
        </div>
    </div>

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>教师列表</small>
                    <a class="btn btn-primary" href="${path}/user/logout?level=${level}">注销</a>
                </h1>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 column">
            <a class="btn btn-primary" href="${path}/paper/toAddPaper">新增</a>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">


            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>教师Id</th>
                    <th>教师Name</th>
                    <th>教师职称</th>
                    <th>教师用户名</th>
                    <th>教师密码</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="teacher" items="${requestScope.get('teacherList')}" varStatus="status">
                    <tr>
                        <td>${teacher.teacherId}</td>
                        <td>${teacher.teacherName}</td>
                        <td>${teacher.teacherTitle}</td>
                        <td>${teacher.teacherUserName}</td>
                        <td>${teacher.teacherPassword}</td>
                        <td>
                            <a href="<%=appPath%>/teacher/delTeacher?teacherId=${teacher.teacherId}">删除</a>
                        </td>
                        <td><a href="${path}/teacher/toUpdateTeacher?id=${teacher.teacherId}">更改教师信息</a></td>
                    </tr>
                </c:forEach>
                <td colspan="5">${pageInfor}</td>
                </tbody>
            </table>
        </div>
    </div>
</div>
