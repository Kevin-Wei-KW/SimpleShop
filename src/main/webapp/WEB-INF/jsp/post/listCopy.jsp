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
    <div class="col-md-9 col-sm-1">
        <div class="container">
            <c:if test="${pageTitle!=null}">
                <div class="row text-center">
                    <h1>${pageTitle}</h1>
                </div>
            </c:if>
            <div class="row text-center">
                <nav aria-label="...">
                    <ul class="pagination">
                        <li class="page-item ${!pageList.hasPrevious()?"disabled":""}">
                            <a class="page-link"
                               href=" >/post/list/${category}?keyword=${keyword}&page=${pageList.previousOrFirstPageable().pageNumber}"
                               tabindex="-1" aria-disabled="true">Previous</a>
                        </li>
                        <c:if test="${pageList.number>0}">
                            <li class="page-item">
                                <a class="page-link"
                                   href="<%=request.getContextPath()%>/post/list/${category}?keyword=${keyword}&page=${pageList.previousOrFirstPageable().pageNumber}">
                                        ${pageList.number}
                                </ a>
                            </li>
                        </c:if>
                        <li class="page-item active" aria-current="page">
                            <a class="page-link" href="#">${pageList.number+1}</a>
                        </li>
                        <c:if test="${(pageList.totalPages-pageList.number)>1}">
                            <li class="page-item">
                                <a class="page-link"
                                   href="<%=request.getContextPath()%>/post/list/${category}?keyword=${keyword}&page=${pageList.nextOrLastPageable().pageNumber}">
                                        ${pageList.nextOrLastPageable().pageNumber+1}
                                </ a>
                            </li>
                        </c:if>
                        <li class="page-item ${!pageList.hasNext()?"disabled":""}">
                            <a class="page-link"
                               href="<%=request.getContextPath()%>/post/list/${category}?keyword=${keyword}&page=${pageList.nextOrLastPageable().pageNumber}">Next</a>
                        </li>
                        <div style="align-self: center;padding-left: 32px">Page ${pageList.number+1} of ${pageList.totalPages}.
                        </div>
                        <div style="align-self: center;padding-left: 32px">Total: ${pageList.totalElements}</div>
                    </ul>

                </nav>
            </div>
            <div class="row">
                <c:forEach items="${pageList.content}" var="postModel" varStatus="state">
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
</div>

<%@include file="../footer.jsp" %>
