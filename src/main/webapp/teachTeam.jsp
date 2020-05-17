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
    <title>教学团队</title>
    <!-- Bootstrap -->
<%--    <link href="css/bootstrap.min.css" rel="stylesheet">--%>

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>

    <![endif]-->

    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->

    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="js/bootstrap.min.js"></script>

    <link rel="canonical" href="https://v4.bootcss.com/docs/examples/dashboard/">

    <!-- Bootstrap core CSS -->
    <link href="bs4/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <!-- Favicons -->
    <meta name="msapplication-config" content="/docs/assets/img/favicons/browserconfig.xml">
    <meta name="theme-color" content="#563d7c">


    <style type="text/css">
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>
    <!-- Custom styles for this template -->
    <link href="bs4/css/dashboard.css" rel="stylesheet">

</head>
<body>
<nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
    <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="index">智能习题推荐</a>

    <a href="index" class="form-control form-control-dark w-100">首页</a>

    <a href="http://www.takenedu.net/news.php"  class="form-control form-control-dark w-100" target="_blank">学习快讯</a>

    <a href="${pageContext.request.contextPath}/playMedia"  class="form-control form-control-dark w-100">教学视频</a>

    <a href="${pageContext.request.contextPath}/news1"  class="form-control form-control-dark w-100">课程介绍</a>

    <a href="${pageContext.request.contextPath}/news2"  class="form-control form-control-dark w-100">课程内容</a>

    <a href="${pageContext.request.contextPath}/news3"  class="form-control form-control-dark w-100">课程实践</a>

    <a href="${pageContext.request.contextPath}/news4"  class="form-control form-control-dark w-100">教学团队</a>

    <a href="${pageContext.request.contextPath}/intelligentAnalysis"  class="form-control form-control-dark w-100">智能分析</a>
    <a href="${pageContext.request.contextPath}/yhc.jsp"  class="form-control form-control-dark w-100">智能预测</a>
    <a href="${pageContext.request.contextPath}/peculiarityRecommend"
       class="form-control form-control-dark w-100">个性推荐</a>
    <a href="${pageContext.request.contextPath}/intelligentAnalysis"  class="form-control form-control-dark w-100">课程图谱</a>

    <a href="${pageContext.request.contextPath}/contactUs.jsp"  class="form-control form-control-dark w-100">联系我们</a>

    <c:if test="${not empty hasLogin && userType=='2'}">
        <a href="study.jsp" class="form-control form-control-dark w-100">我的(学生)</a>
    </c:if>
    <c:if test="${not empty hasLogin && userType=='1'}">
        <a href="teacher.jsp" class="form-control form-control-dark w-100">我的(老师)</a>
    </c:if>

    <c:if test="${not empty hasLogin}">
        <ul class="navbar-nav px-3">
            <li class="nav-item text-nowrap">
                <a class="nav-link" href="quit" id="quit">退出</a>
                <script src="js/jquery.min.js"></script>
                <script src="js/bootstrap.min.js"></script>
                <script src="js/index_.js"></script>
            </li>
        </ul>
    </c:if>


</nav>
<br/><br/>

<div class="container-fluid">
    <div class="row">
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2">教学团队</h1>
            </div>
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
                            <img src="${baseUri}/upload/${row.img}" style="width: 500px;height:280px;" class="img-circle" alt="sss"/>
                            <br/>
                        </div>
                    </div><!-- /.blog-sidebar -->
                </div><!-- /.row -->
            </c:forEach>
            <canvas class="my-4 w-100" id="myChart" width="900" height="380"></canvas>
        </main>

    </div>
</div>

<%--<div class="container">

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
</div>--%><!-- /.container -->
</body>
</html>
