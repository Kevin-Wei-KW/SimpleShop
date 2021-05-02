<%--
  Created by IntelliJ IDEA.
  User: kevin
  Date: 2021-03-19
  Time: 1:25 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../header.jsp"%>
<div class="container">
    <div class="row">
        <h1>${postModel.getTitle()}</h1>
    </div>
    <div class="row">
        <div class="col-sm-8 col-xs-12">
            <div class="gallery">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTG3Qn0_PmQ2sLrlp_tGYMvVrXXMNjyyoLtZA&usqp=CAU">
            </div>
        </div>
        <div class="col-sm-4 col-xs-12">
            <div class="container">
                <div class="row">
                    <div class="info">
                        <h1>Price: $${postModel.getPrice()}</h1>
                    </div>
                </div>
                <div class="row">
                    <div class="info">
                        <pre>${postModel.getDescription()}</pre>
                        <h1>Category: ${postModel.getCategory()}</h1>
                    </div>
                </div>
                <div class="row">
                    <form action="/post/edit/${postModel.getId()}">
                        <button type="submit">Edit</button>
                    </form>
                </div>
            </div>



        </div>

    </div>

</div>

<%@include file="../footer.jsp"%>
