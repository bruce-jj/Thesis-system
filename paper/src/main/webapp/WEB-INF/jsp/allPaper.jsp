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
    <title>用户查看</title>
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
                    <small>论文列表 —— 显示所有论文</small>
                    <a class="btn btn-primary" href="${path}/user/logout?level=${level}">注销</a>
                </h1>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 column">
            <%--<a class="btn btn-primary" href="${path}/paper/toAddPaper">新增</a>--%>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <ul style="position: relative; left: 30px;" class="pagination  pagination-lg">
                <li><a href="<%=appPath%>/paper/allPaper/?pageNum=${pageNum eq 1? 1:pageNum-1}">&laquo;</a></li>
                <li><a href="<%=appPath%>/paper/allPaper/?pageNum=1">1</a></li>
                <li><a href="<%=appPath%>/paper/allPaper/?pageNum=2">2</a></li>
                <li><a href="<%=appPath%>/paper/allPaper/?pageNum=3">3</a></li>
                <li><a href="<%=appPath%>/paper/allPaper/?pageNum=4">4</a></li>
                <li><a href="<%=appPath%>/paper/allPaper/?pageNum=5">5</a></li>
                <li><a href="<%=appPath%>/paper/allPaper/?pageNum=${listSize eq 0?pageNum:pageNum+1}">&raquo;</a></li>
            </ul>
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>论文编号</th>
                    <th>论文名字</th>
                    <th>论文详情</th>
                    <th>论文导师ID</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="paper" items="${requestScope.get('list')}" varStatus="status">
                    <tr>
                        <td>${paper.paperId}</td>
                        <td>${paper.paperName}</td>
                        <td>${paper.paperDetail}</td>
                        <td>${paper.teacherId}</td>
                        <td>
                            <%--<a href="${path}/paper/toUpdatePaper?id=${paper.paperId}">更改</a> --%>
                            <%--<a href="<%=appPath%>/paper/del/${paper.paperId}">删除</a>--%>
                            <a href="<%=appPath%>/teacher/all/?t_id=${paper.teacherId}&level=${level}">查看教师</a>
                        </td>
                    </tr>
                </c:forEach>

                <td colspan="5">${pageInfor}</td>
                </tbody>
            </table>

        </div>
    </div>
</div>
