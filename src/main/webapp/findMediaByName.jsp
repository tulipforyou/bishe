<%--
  Created by IntelliJ IDEA.
  User: 25243
  Date: 2020/3/4
  Time: 23:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="baseUri" value="${pageContext.request.contextPath }" scope="request"/>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>找视频</title>
    <link rel="canonical" href="https://v4.bootcss.com/docs/examples/dashboard/">
    <script type="text/javascript" src="js/jquery.min.js"></script>

    <!-- Bootstrap core CSS -->
    <link href="bs4/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

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

    <a href="http://www.takenedu.net/news.php" class="form-control form-control-dark w-100" target="_blank">学习快讯</a>

    <a href="${pageContext.request.contextPath}/playMedia" class="form-control form-control-dark w-100">教学视频</a>

    <a href="${pageContext.request.contextPath}/news1" class="form-control form-control-dark w-100">课程介绍</a>

    <a href="${pageContext.request.contextPath}/news2" class="form-control form-control-dark w-100">课程内容</a>

    <a href="${pageContext.request.contextPath}/news3" class="form-control form-control-dark w-100">课程实践</a>

    <a href="${pageContext.request.contextPath}/news4" class="form-control form-control-dark w-100">教学团队</a>

    <a href="${pageContext.request.contextPath}/intelligentAnalysis"
       class="form-control form-control-dark w-100">智能分析</a>
    <a href="${pageContext.request.contextPath}/yhc.jsp"  class="form-control form-control-dark w-100">智能预测</a>
    <a href="${pageContext.request.contextPath}/peculiarityRecommend"
       class="form-control form-control-dark w-100">个性推荐</a>
    <a href="${pageContext.request.contextPath}/intelligentAnalysis"
       class="form-control form-control-dark w-100">课程图谱</a>

    <a href="${pageContext.request.contextPath}/contactUs.jsp" class="form-control form-control-dark w-100">联系我们</a>

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
        <div class="col-md-3">
        </div>
        <div class="col-md-6">
            <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2">查找视频</h1>
                </div>

                <form action="findMediaByName">
                    请输入视频名查找视频:<input type="text" name="mediaName" class="form-control"><br/>
                    <input type="submit" value="提交" class="btn btn-secondary btn-lg btn-block"/>
                </form>

                <canvas class="my-1 w-25" id="myChart" width="900" height="380"></canvas>
            </main>
        </div>
        <div class="col-md-3">
        </div>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col-md-2">
            <h4>所有视频：</h4>
        </div>
        <div class="col-md-10">
            <h5>视频名字&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                视频配图&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                视频介绍</h5><br/>
            <c:forEach var="data" items="${allTitles}">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-3">
                            <p><strong>${data.title}</strong></p>
                        </div>
                        <div class="col-md-6">
                            <img src="${baseUri}/upload/media/${data.picture}" style="height: 200px;width: 400px"/>
                        </div>
                        <div class="col-md-3">
                            <p>${data.descript}</p>
                        </div>
                    </div>
                </div>
                <br/>
            </c:forEach>
        </div>
    </div>
</div>


<%--  <div class="containt">
      <form action="findMediaByName">
          请输入视频名查找视频:<input type="text" name="mediaName">
          <input type="submit" value="提交"/>
      </form>

  </div>--%>
</body>
</html>
