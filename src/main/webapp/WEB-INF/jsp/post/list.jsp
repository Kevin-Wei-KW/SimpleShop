<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../header.jsp" %>
<link href="../../../assets/style.css" rel="stylesheet">
<div class="page-container">
  <div class="row">
    <div class="col-md-3 col-sm-1">
      <ul class="list-group">
        <a href="<%=request.getContextPath()%>/post/list">
          <li class="list-group-item ${category==null||category==''?"active":""}">All</li>
        </a>
        <a href="<%=request.getContextPath()%>/post/list/UNIFORMS">
          <li class="list-group-item ${category=='UNIFORMS'?"active":""}">Uniforms</li>
        </a>
        <a href="<%=request.getContextPath()%>/post/list/BOOKS">
          <li class="list-group-item ${category=='BOOKS'?"active":""}">Books</li>
        </a>
        <a href="<%=request.getContextPath()%>/post/list/ELECTRONICS">
          <li class="list-group-item ${category=='ELECTRONICS'?"active":""}">Electronics</li>
        </a>
        <a href="<%=request.getContextPath()%>/post/list/SPORTS">
          <li class="list-group-item ${category=='SPORTS'?"active":""}">Sports</li>
        </a>
        <a href="<%=request.getContextPath()%>/post/list/INSTRUMENTS">
          <li class="list-group-item ${category=='INSTRUMENTS'?"active":""}">Instruments</li>
        </a>
        <a href="<%=request.getContextPath()%>/post/list/OTHERS">
          <li class="list-group-item ${category=='OTHERS'?"active":""}">Others</li>
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
                   href="<%=request.getContextPath()%>/post/list/${category}?keyword=${keyword}&page=${pageList.previousOrFirstPageable().pageNumber}"
                   tabindex="-1" aria-disabled="true">Previous</a>
              </li>
              <c:if test="${pageList.number>0}">
                <li class="page-item">
                  <a class="page-link"
                     href="<%=request.getContextPath()%>/post/list/${category}?keyword=${keyword}&page=${pageList.previousOrFirstPageable().pageNumber}">
                      ${pageList.number}
                  </a>
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
                  </a>
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
          <c:forEach items="${pageList.content}" var="post" varStatus="state">
            <div class="col-md-3  col-sm-1" style="padding: 8px">
              <a href="/post/detail/${post.id}">
                <div class="card" style="color: #333333">
                  <c:if test="${post.picURL0.length()>0}">
                    <img src="${post.picURL0}"
                         class="card-img-top"
                         alt="...">
                  </c:if>
                  <div class="card-body" style="padding: 4px;">
                    <div>${post.title}</div>
                    <div style="display: flex;justify-content: space-between;align-items: center">
                      <span style="color: #CC0927;font-weight: 700">$${post.price}</span>
                      <span style="color: #666666;font-size: 80%">${post.createdDateText}</span>
                    </div>
                  </div>
                </div>
              </a>
            </div>
          </c:forEach>
        </div>
      </div>
    </div>
  </div>
</div>
<%@include file="../footer.jsp" %>