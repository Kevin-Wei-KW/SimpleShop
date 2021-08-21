<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: kevin
  Date: 2021-02-27
  Time: 9:22 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../header.jsp" %>

<div class="row">
    <div id="sideNav" class="col-md-3">
        <ul class="list-group">
            <a href="<%=request.getContextPath()%>/post/list">
                <li class="list-group-item ${category==null?"active":""}">ALL</li>
            </a>
            <a href="<%=request.getContextPath()%>/post/list/BOOKS">
                <li class="list-group-item ${category=="BOOKS"?"active":""}">BOOKS</li>
            </a>
            <a href="<%=request.getContextPath()%>/post/list/ELECTRONICS">
                <li class="list-group-item ${category=="ELECTRONICS"?"active":""}">ELECTRONICS</li>
            </a>
            <a href="<%=request.getContextPath()%>/post/list/CLOTHES">
                <li class="list-group-item ${category=="CLOTHES"?"active":""}">CLOTHES</li>
            </a>
        </ul>
    </div>
    <div class="col-md-9">
        <div class="row">
            <c:forEach items="${list}" var="postModel" varStatus="state">

                <div class="col-md-4" style="padding: 5px">
                    <a href="/post/detail/${postModel.id}">
                        <div class="card" style="color: #333333; padding: 5px">
                            <img src="${postModel.picURL0}"
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
</div>

<%@include file="../footer.jsp" %>
