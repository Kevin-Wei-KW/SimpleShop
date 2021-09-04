<%--
  Created by IntelliJ IDEA.
  User: kevin
  Date: 2021-08-28
  Time: 4:08 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../header.jsp" %>
<html>
<head>
    <title>Profile</title>
</head>
<body>
<div style="text-align: center">
    <h1 style="padding-bottom:30px">My Profile</h1>

    <form class="" action="/user/profile" method="post">

        <div class="form-group" style="padding: 30px">
            <input type="text" id="user.oldPassword" name="oldPassword" placeholder="old password (required) ">
        </div>
        <div class="form-group">
            <input type="text" id="user.newEmail" name="email" value="${userModel.getEmail()}">
        </div>
        <div class="form-group">
            <input type="text" id="user.newPassword" name="newPassword" placeholder="new password">
        </div>
        <div class="form-group">
            <input type="text" id="user.newDisplayName" name="displayName" value="${userModel.getDisplayName()}">
        </div>

        <div style="padding-top: 12px">
            <button type="submit" class="btn btn-primary">Submit</button>
        </div>

    </form>


</div>



</body>
</html>
<%@include file="../footer.jsp" %>