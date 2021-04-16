<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Maxim Bootstrap Template - Index</title>
    <meta content="" name="description">
    <meta content="" name="keywords">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
          integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link href="/assets/style.css/jsp/post/style.css/style.css" rel="stylesheet">
</head>

<body>
<header id="header">
    <nav class="navbar fixed-top  navbar-expand-lg" style="background-color: black">
        <div class="container">
            <a class="navbar-brand" href="/post/list">A Simple Shop</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse"
                    data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                    aria-label="Toggle navigation"
                    style="color: white">
                <i class="bi bi-three-dots"></i>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <%--        <li class="nav-item active">--%>
                    <%--          <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>--%>
                    <%--        </li>--%>
                    <%--        <li class="nav-item">--%>
                    <%--          <a class="nav-link" href="#">Link</a>--%>
                    <%--        </li>--%>
                    <%--        <li class="nav-item dropdown">--%>
                    <%--          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">--%>
                    <%--            Dropdown--%>
                    <%--          </a>--%>
                    <%--          <div class="dropdown-menu" aria-labelledby="navbarDropdown">--%>
                    <%--            <a class="dropdown-item" href="#">Action</a>--%>
                    <%--            <a class="dropdown-item" href="#">Another action</a>--%>
                    <%--            <div class="dropdown-divider"></div>--%>
                    <%--            <a class="dropdown-item" href="#">Something else here</a>--%>
                    <%--          </div>--%>
                    <%--        </li>--%>
                    <%--        <li class="nav-item">--%>
                    <%--          <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>--%>
                    <%--        </li>--%>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <a class="btn btn-outline-success my-2 my-sm-0" type="submit" style="margin-right: 8px"
                            href="/post/edit/">New Post
                    </a>
                    <input class="form-control" type="search" placeholder="Search" aria-label="Search"
                           style="width: auto;">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit" style="margin-left: 8px">Search
                    </button>
                </form>
                <a class="nav-link" href="#">Login / Register</a>
            </div>
        </div>
    </nav>
</header>
<div class="container">
    <main id="main" style="padding-top: 88px;padding-bottom: 16px">
        <c:if test="${message!=null}">
        <div class="container">
            <div class="alert alert-primary" role="alert">
                    ${message}
            </div>
        </div>
        </c:if>

