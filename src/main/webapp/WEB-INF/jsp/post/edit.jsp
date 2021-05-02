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
    <c:if test="${postModel.id!=null}">
        <h1>Edadfasdfasdfasdfit Post</h1>
    </c:if>
    <c:if test="${postModel.id==null}">
        <h1>New Post</h1>
    </c:if>
</div>
<div class="editSection">
    <form action="/post/save" method="post">
            <div>
                <input type="hidden" name="id" value="${postModel.id}">
            </div>
            <div>
                <label>Title:</label>
                <br>
                <input type = "text" id="post.title" name="title" value="${postModel.title}">
            </div>
            <div>
                <label>Price:</label>
                <br>
                <input type = "number" id="post.price" name="price" value="${postModel.price}">
            </div>
            <div>
                <label>Description:</label>
                <br>
                <textarea rows="3" cols="50" name="description" placeholder="${postModel.description}">${postModel.description}</textarea>
            </div>
            <div class="form-group" style="padding-top: 10px; padding-left:80px;padding-right:80px">
                <label for="Category">Category:</label>
                <div id="Category" class="row">
                    <div class="form-check ml-3">
                        <input type="radio" class="form-check-input" name="category" id="books" value="BOOKS" ${postModel.category=="BOOKS"?"checked":""}>
                        <label class="form-check-label" for="books">Books</label>
                    </div>

                    <div class="form-check ml-3">
                        <input type="radio" class="form-check-input" name="category" id="electronics" value="ELECTRONICS" ${postModel.category=="ELECTRONICS"?"checked":""}>
                        <label class="form-check-label" for="electronics">Electronics</label>
                    </div>

                    <div class="form-check ml-3">
                        <input type="radio" class="form-check-input" name="category" id="clothes" value="CLOTHES" ${postModel.category=="CLOTHES"?"checked":""}>
                        <label class="form-check-label" for="clothes">Clothes</label>
                    </div>
                </div>
            </div>
            <div style="padding-top: 12px">
                <c:if test="${postModel.id!=null}">
                    <button type="submit" class="btn btn-primary" >SAVE</button>
                </c:if>
                <c:if test="${postModel.id==null}">
                    <button type="submit" class="btn btn-primary" >POST</button>
                </c:if>

            </div>

            <br>
            ${saveMessage}

    </form>
</div>



</body>
</html>
<%@include file="../footer.jsp"%>
