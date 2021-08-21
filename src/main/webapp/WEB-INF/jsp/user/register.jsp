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
    <title>Register</title>
</head>
<body>

<div style="text-align: center">
    <h1 style="padding-bottom:30px">Account Register</h1>
    <form class="" action = "/user/register" method="post">
        <div class="form-group">
            <input type="text" id="user.email" name="email" placeholder="Email">
        </div>
        <div class="form-group">
            <input type="text" id="user.password" name="password" placeholder="Password">
        </div>
        <div class="form-group">
            <input type="text" id="user.repassword" name="repassword" placeholder="Confirm Password">
        </div>
        <div class="form-group">
            <input type="text" id="user.displayName" name="displayName" placeholder="Nickname">
        </div>

        <div style="padding-top: 12px">
            <button type="submit" class="btn btn-primary">Submit</button>
        </div>

    </form>
</div>

</body>
</html>

<%@include file="../footer.jsp" %>
