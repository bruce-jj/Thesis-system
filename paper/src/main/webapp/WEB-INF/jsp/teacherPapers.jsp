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
    <title>Paper列表</title>
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
                    基于SSM框架的管理系统：实现增、删、改、查。
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
                </tr>
                </thead>
                <tbody>
                <c:forEach var="teacher" items="${requestScope.get('teacher_list')}" varStatus="status">
                    <tr>
                        <td>${teacher.teacherId}</td>
                        <td>${teacher.teacherName}</td>
                        <td>${teacher.teacherTitle}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>论文集</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="teacher" items="${requestScope.get('teacher_list')}" varStatus="status">
                    <tr>
                        <c:forEach var="papers" items="${teacher.papers}" varStatus="s">
                            <tr><td>论文${s.index+1}:${papers.paperName}</td></tr>
                        </c:forEach>
                    </tr>
                </c:forEach>
                </tbody>
            </table>


        </div>
    </div>
</div>
