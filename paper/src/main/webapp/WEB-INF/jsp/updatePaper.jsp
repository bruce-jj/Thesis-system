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
    <title>修改论文</title>
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
                    <small>修改论文</small>
                </h1>
            </div>
        </div>
    </div>
        <form action="<%=basePath%>paper/updatePaper" method="post">
            <h4>请注意，论文ID不可更改</h4>
            论文ID：  <input type="text" name="paperId" value="${id_infor}"/>  <br>
            论文名称：<input type="text" name="paperName" value="${paper.paperName}"/> <br>
            论文详情：<input type="text" name="paperDetail" value="${paper.paperDetail}"/> <br>
            论文导师：<input type="text" name="teacherId" value="${paper.teacherId}"/>
            <input type="submit" value="提交">
        </form>


</div>
</body>
</html>