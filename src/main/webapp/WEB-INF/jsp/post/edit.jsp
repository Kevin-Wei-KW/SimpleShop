<%--
  Created by IntelliJ IDEA.
  User: kevin
  Date: 2021-03-13
  Time: 8:21 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Page</title>
</head>
<body>
<div>
    <h1>Edit Post</h1>
</div>
<div>
    <form action="/post/save" method="post">
        <form>
            <div>
                <label>Title:</label>
                <input type = "text" id="testMode.title" name="title" value="${postModel.title}">
            </div>
            <div>
                <label>Price:</label>
                <input type = "text" id="testMode.price" name="price" value="${postModel.price}">

            </div>
            <div>
                <label>Description:</label>
                <input type = "text" id="testMode.description" name="description" value="${postModel.description}">
            </div>
            <button type="submit" class="btn btn-primary">SAVE</button>
        </form>
    </form>
</div>



</body>
</html>
