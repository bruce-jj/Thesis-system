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
    <title>教师查看</title>
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
                    <small>导师信息及论文集</small>
                    <a class="btn btn-primary" href="${path}/user/logout?level=${level}">注销</a>
                    <a onclick="f()"class="btn btn-primary">刷新</a>
                    <script>function f() {location.reload(true)}</script>
                </h1>
            </div>
        </div>
    </div>

    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>导师ID</th>
                    <th>导师名字</th>
                    <th>导师职称</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="teacher" items="${requestScope.get('teacherList')}" varStatus="status">
                    <tr>
                        <td>${teacher.teacherId}</td>
                        <td>${teacher.teacherName}</td>
                        <td>${teacher.teacherTitle}</td>
                        <td><a href="${path}/teacher/toUpdateTeacher?id=${teacher.teacherId}">更改个人信息</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>论文名</th>
                    <th>论文详情</th>
                </tr>
                </thead>
                <a class="btn btn-primary" href="${path}/paper/toAddPaper?teacherid=${teacher.teacherId}">新增</a>
                <tbody>
                <c:forEach var="teacher" items="${requestScope.get('teacherList')}" varStatus="status">
                    <tr>
                    <c:forEach var="papers" items="${teacher.papers}" varStatus="s">
                        <tr>
                            <td>论文${s.index+1}:${papers.paperName}</td>
                            <td>${papers.paperDetail}</td>
                        </tr>
                    </c:forEach>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>