<%--
  Created by IntelliJ IDEA.
  User: kevin
  Date: 2021-03-13
  Time: 8:21 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../header.jsp"%>
<html>
<head>
    <title>Edit Page</title>
</head>
<style>
    /*.title{*/
    /*    color: darkblue;*/
    /*    text-align: center;*/
    /*}*/
    form{
        text-align: center;
        margin-top: 30px;
    }
</style>
<body>
<div id="title">
    <h1>Edit Post</h1>
</div>
<div class="editSection">
    <form action="/post/save" method="post">
        <form>
            <div>
                <label>Title:</label>
                <br>
                <input type = "text" id="testMode.title" name="title" value="${postModel.title}">
            </div>
            <div>
                <label>Price:</label>
                <br>
                <input type = "number" id="testMode.price" name="price" value="${postModel.price}">

            </div>
            <div>
                <label>Description:</label>
                <br>
                <textarea rows="3" cols="50" name="description" placeholder="${postModel.description}">${postMode.description}</textarea>

            </div>
            <br>
            <br>
            <button type="submit" class="btn btn-primary">SAVE</button>
            <br>
            ${saveMessage}
        </form>
    </form>
</div>



</body>
</html>
<%@include file="../footer.jsp"%>
