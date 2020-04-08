<%--
  Created by IntelliJ IDEA.
  User: sch
  Date: 2020/4/8
  Time: 下午3:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="baseUri" value="${pageContext.request.contextPath }" scope="request"/>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>相關習題推送</title>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>

    <![endif]-->

    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->

    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
</head>
<body>
<div class="header">
    <nav class="navbar navbar-expand-lg navbar-light bg-light ">
        <img src="images/logo.png" alt="logo" style="width: 200px ;height: 40px">
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav mr-auto" id="navbarSupportedContent">
                <style type="text/css">
                    .nav-a {
                        float: left;
                        text-align: center;
                        font: 26px/2.5 "microsoft yahei";
                        color: #545b62;
                        margin: 7px;
                    }
                </style>
                <li class="nav-item">
                    <a href="index" class="nav-a">首页</a>
                </li>
                <li class="nav-item">
                    <a href="http://www.takenedu.net/news.php" class="nav-a" target="_blank">学习快讯</a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/playMedia" class="nav-a">教学视频</a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/news1" class="nav-a">课程介绍</a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/news2" class="nav-a">课程内容</a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/news3" class="nav-a">课程实践</a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/news4" class="nav-a">教学团队</a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/intelligentAnalysis" class="nav-a">智能分析</a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/intelligentAnalysis" class="nav-a">课程图谱</a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/contactUs.jsp" class="nav-a">联系我们</a>
                </li>
                <c:if test="${not empty hasLogin && userType=='2'}">
                    <a href="study.jsp" class="nav-a">我的(学生)</a>
                </c:if>
                <c:if test="${not empty hasLogin && userType=='1'}">
                    <a href="teacher.jsp" class="nav-a">我的(老师)</a>
                </c:if>
                <c:if test="${empty hasLogin}">
                    <li class="nav-item">
                        <button class="btn btn-link" type="button" data-toggle="modal"
                                data-target="#mymodal">登录</button>
                        <span>/</span>
                        <button class="btn btn-link" type="button" id="enroll">注册</button>
                    </li>
                </c:if>
                <c:if test="${not empty hasLogin}">
                    <li class="nav-item">
                        <span>欢迎您：${hasLogin}</span>
                        <a href="quit">退出</a>
                    </li>
                </c:if>
            </ul>
        </div>
    </nav>
</div>
<div class="container-fluid" style="background-color: #20c997">
    <div class="row">
        <div class="col">
        </div>
        <div class="col-6">
            <h1 style="text-align: center">智能分析</h1>
        </div>
        <div class="col">
            <form id="fileUpload1" method="post" action="yhc_upload" enctype="multipart/form-data">
                <input type="file" class="btn btn-outline-success" name="upload">
                <input type="submit" class="btn btn-outline-primary" value="成績分析"/>
            </form>
        </div>
    </div>
</div>
<div class="header" style="background-color: #20c997">
    <div class="row">
        <div class="col-md-12">
            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a class="nav-link" href="yhc.jsp" style="color: #062c33">知識點掌握概況</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="yhc1.jsp" style="color: #062c33">正確率預測</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link  active" href="yhc2.jsp" style="color: #062c33">相關習題推送</a>
                </li>
            </ul>
        </div>
    </div>
</div>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">

            <h1>相關習題推送</h1>

        </div>
    </div>
</div>

</body>
</html>
