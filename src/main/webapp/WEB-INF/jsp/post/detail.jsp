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
            <div id="carouselSlides" class="carousel slide" data-ride="carousel">

                <ol class="carousel-indicators">
                    <li data-target="#carouselSlides" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselSlides" data-slide-to="1"></li>
                    <li data-target="#carouselSlides" data-slide-to="2"></li>
                </ol>

                <div class = "carousel-inner">
                    <div class="item active">
                        <img src= ${postModel.getPicURL0()}>
                    </div>
                    <div class="item">
                        <img src= ${postModel.getPicURL1()}>
                    </div>
                    <div class="item">
                        <img src= ${postModel.getPicURL2()}>
                    </div>
                    <div class="item">
                        <img src= ${postModel.getPicURL3()}>
                    </div>
                    <div class="item">
                        <img src= ${postModel.getPicURL4()}>
                    </div>
                </div>

                <a class="left carousel-control" href="#carouselSlides" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#carouselSlides" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                    <span class="sr-only">Next</span>
                </a>
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
                    <c:if test="${canEdit == true}">
                        <form action="/post/edit/${postModel.getId()}">
                            <button type="submit">Edit</button>
                        </form>
                    </c:if>
                </div>
            </div>



        </div>

    </div>

</div>

<%@include file="../footer.jsp"%>
