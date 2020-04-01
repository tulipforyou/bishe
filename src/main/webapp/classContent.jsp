<%--
  Created by IntelliJ IDEA.
  User: 25243
  Date: 2020/3/21
  Time: 16:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="baseUri" value="${pageContext.request.contextPath }" scope="request"/>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>课程内容</title>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>

    <![endif]-->

    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->

    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="js/bootstrap.min.js"></script>
</head>
<body style="background-color: #d0e9c6">
<div class="container">

    <c:forEach var="row" items="${data}">
        <div class="blog-header">
            <h1 class="blog-title">${row.head}</h1>
            <p class="lead blog-description">${row.summary}</p>
        </div>
        <div class="row">
            <div class="col-sm-8 blog-main">
                <div class="blog-post">
                    <p class="blog-post-meta">${row.date}</p>
                    <p></p>
                    <hr>
                    <p>${row.body}</p>
                </div><!-- /.blog-post -->
            </div><!-- /.blog-main -->
            <div class="col-sm-4 col-sm-offset-1 blog-sidebar">
                <div class="sidebar-module sidebar-module-inset">
                    <h2>图片</h2>
                    <p class="lead blog-description">${row.head}</p>
                    <img src="${baseUri}/upload/${row.img}" style="width: 600px;height:330px;" class="img-circle" alt="sss"/>
                    <br/>
                </div>
            </div><!-- /.blog-sidebar -->
        </div><!-- /.row -->
    </c:forEach>
</div><!-- /.container -->
</body>
</html>
