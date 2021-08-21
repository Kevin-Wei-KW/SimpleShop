<%--
  Created by IntelliJ IDEA.
  User: kevin
  Date: 2021-08-16
  Time: 5:59 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../header.jsp" %>
<html>
<head>
    <title>Login</title>
</head>
<body>

<div style="text-align: center">
    <h1 style="padding-bottom:30px">Please Login</h1>
    <form class="" action = "/user/login" method="post">
        <div class="form-group">
            <input type="text" id="user.email" name="email" placeholder="Email">
        </div>
        <div class="form-group">
            <input type="text" id="user.password" name="password" placeholder="Password">
        </div>

        <a type = "button" href="<%=request.getContextPath()%>/user/register"class="btn btn-light">Register</a>
        <div style="padding-top: 12px">
            <button type="submit" class="btn btn-primary">Login</button>
        </div>

    </form>
</div>

</body>
</html>

<%@include file="../footer.jsp" %>