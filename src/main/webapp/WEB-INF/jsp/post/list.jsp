<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: kevin
  Date: 2021-02-27
  Time: 9:22 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1> List Page</h1>
<c:forEach items="${list}" var="postModel" varStatus="state">
    <div class="row">
        <div>${postModel.id}</div>
        <div>${postModel.name}</div>
        <div>${postModel.description}</div>
    </div>
</c:forEach>
</body>
</html>
