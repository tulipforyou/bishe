<%--
  Created by IntelliJ IDEA.
  User: 25243
  Date: 2020/3/8
  Time: 16:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="baseUri" value="${pageContext.request.contextPath }" scope="request"/>
<html>
<head>
    <meta charset="UTF-8">
    <title>老师上传习题</title>
    <script src="./js/jquery.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/enroll_.css">

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
<div class="containt">
    <p class="h1">习题上传！</p>
    <form action="teacherUploadExercise" method="post">
        <div class="form-group row">
            <label class="col-sm-4" style="text-align:right;"> 课程名称：</label>
            <div class="col-sm-8">
                <input type="text" name="className"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-4" style="text-align:right;"> 习题类型：</label>
            <div class="col-sm-8">
                <input type="text" name="exerciseType"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-4" style="text-align:right;"> 涉及知识点概述：</label>
            <div class="col-sm-8" >
                <textarea cols="24" rows="3" name="knowledgePoints"></textarea>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-4" style="text-align:right;"> 题干：</label>
            <div class="col-sm-8">
                <textarea cols="24" rows="3" name="subject"></textarea>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-4" style="text-align:right;"> 备选答案1：</label>
            <div class="col-sm-8" >
            <input type="text" name="answer1"/>
            </div>
            <label class="col-sm-4" style="text-align:right;"> 备选答案2：</label>
            <div class="col-sm-8" >
            <input type="text" name="answer2"/>
            </div>
            <label class="col-sm-4" style="text-align:right;"> 备选答案3：</label>
            <div class="col-sm-8" >
            <input type="text" name="answer3"/>
            </div>
            <label class="col-sm-4" style="text-align:right;"> 备选答案4：</label>
            <div class="col-sm-8" >
            <input type="text" name="answer4"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-4" style="text-align:right;"> 正确答案：</label>
            <div class="col-sm-8">
                <input type="text" name="correctAnswer"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-4" style="text-align:right;"> 上传时间：</label>
            <div class="col-sm-8">
                <input type="text" name="uptime"/>
            </div>
        </div>
        <div class="form-group row">
            <input type="submit" class="btn btn-outline-dark btn-block" value="上传"/>
        </div>
    </form>
</div>
</body>
</html>
