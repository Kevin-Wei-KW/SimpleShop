<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: kevin
  Date: 2021-02-27
  Time: 9:22 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../header.jsp"%>

<div>
    <h1>Home</h1>
    <div class="row">
        <c:forEach items="${list}" var="postModel" varStatus="state">
            <div class="col-md-4" style="padding: 5px">
                <a href="/post/detail/${postModel.id}">
                    <div class="card" style="color: #333333; padding: 5px">
                        <img src="data:image/jpeg;base64,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"
                             class="card-img-top" alt="...">
                        <div class="card-body" style="padding: 5px">
                            <div>${postModel.title}</div>
                            <div>$${postModel.price}</div>
                        </div>
                    </div>
                </a>
            </div>
        </c:forEach>
    </div>
</div>
<%@include file="../footer.jsp"%>
