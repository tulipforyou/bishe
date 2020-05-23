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

<c:if test="${empty hasLogin}">
    <br/><br/>
    <br/><br/>
    <br/><br/>
    <h1 style="text-align: center;color: #b21f2d">请返回首页登录使用</h1>
    <h1 style="text-align: center;color: #b21f2d"><a href="index">确定</a> </h1>
</c:if>
<c:if test="${not empty hasLogin}">
    <div class="container-fluid">
    <div class="row">
    <c:if test="${not empty hasLogin && userType=='1'}">
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
            <div class="sidebar-sticky">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link" href="grade1">
                            <span data-feather="home"></span>
                            选课管理 <span class="sr-only"></span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="grade2">
                            <span data-feather="file"></span>
                            成绩导入
                        </a>
                    </li>
                        <%-- <li class="nav-item">
                             <a class="nav-link" href="grade3">
                                 <span data-feather="shopping-cart"></span>
                                 成绩分析
                             </a>
                         </li>
                         <li class="nav-item">
                             <a class="nav-link" href="grade4">
                                 <span data-feather="users"></span>
                                 成绩预警
                             </a>
                         </li>--%>
                    <li class="nav-item">
                        <a class="nav-link" href="addMedia.html">
                            <span data-feather="bar-chart-2"></span>
                            课程上传
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="teacherUploadExercise.jsp">
                            <span data-feather="layers"></span>
                            习题上传
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="playMedia">
                            <span data-feather="layers"></span>
                            查看课程视频
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="managerExercise">
                            <span data-feather="layers"></span>
                            管理习题
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="lookStudentAnswers">
                            <span data-feather="layers"></span>
                            学生已做习题查看
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="showNews">
                            <span data-feather="layers"></span>
                            校內快訊
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="addNews.jsp">
                            <span data-feather="layers"></span>
                            信息管理
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
    </c:if>
    <c:if test="${not empty hasLogin && userType=='2'}">
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
            <div class="sidebar-sticky">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link active" href="course">
                            <span data-feather="home"></span>
                            学生选课 <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="choose">
                            <span data-feather="file"></span>
                            课程及成绩查看
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="playMedia">
                            <span data-feather="shopping-cart"></span>
                            查看课程视频
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="doExercise">
                            <span data-feather="users"></span>
                            做习题
                        </a>
                    </li>
                        <%--                    <li class="nav-item">--%>
                        <%--                        <a class="nav-link" href="grade3">--%>
                        <%--                            <span data-feather="bar-chart-2"></span>--%>
                        <%--                            成绩分析--%>
                        <%--                        </a>--%>
                        <%--                    </li>--%>
                        <%--                    <li class="nav-item">--%>
                        <%--                        <a class="nav-link" href="grade4">--%>
                        <%--                            <span data-feather="layers"></span>--%>
                        <%--                            成绩预警--%>
                        <%--                        </a>--%>
                        <%--                    </li>--%>
                    <li class="nav-item">
                        <a class="nav-link" href="showMyExercises">
                            <span data-feather="layers"></span>
                            已做习题回顾
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="showNews">
                            <span data-feather="layers"></span>
                            校內快訊
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
    </c:if>
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2">老师上传习题</h1>
            </div>
            <p class="h1">习题上传！</p>
            <form action="teacherUploadExercise" method="post">

                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="className"> 课程名称：</span>
                    </div>
                    <input type="text" name="className" class="form-control" aria-label="Sizing example input" aria-describedby="className">
                </div>
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="exerciseType"> 习题类型：</span>
                    </div>
                    <input type="text" name="exerciseType" class="form-control" aria-label="Sizing example input" aria-describedby="exerciseType">
                </div>
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="knowledgePoints"> 涉及知识点概述：</span>
                    </div>
                    <textarea name="knowledgePoints" class="form-control" aria-label="Sizing example input" aria-describedby="knowledgePoints" cols="24" rows="3"></textarea>
                </div>
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="subject"> 题干：</span>
                    </div>
                    <textarea name="subject" class="form-control" aria-label="Sizing example input" aria-describedby="subject" cols="24" rows="3"></textarea>
                </div>
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="answer1"> 备选答案1：</span>
                    </div>
                    <input type="text" name="answer1" class="form-control" aria-label="Sizing example input" aria-describedby="answer1">
                </div>
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="answer2"> 备选答案2：</span>
                    </div>
                    <input type="text" name="answer2" class="form-control" aria-label="Sizing example input" aria-describedby="answer2">
                </div>
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="answer3"> 备选答案3：</span>
                    </div>
                    <input type="text" name="answer3" class="form-control" aria-label="Sizing example input" aria-describedby="answer3">
                </div>
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="answer4"> 备选答案4：</span>
                    </div>
                    <input type="text" name="answer4" class="form-control" aria-label="Sizing example input" aria-describedby="answer4">
                </div>
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="correctAnswer"> 正确答案：</span>
                    </div>
                    <input type="text" name="correctAnswer" class="form-control" aria-label="Sizing example input" aria-describedby="correctAnswer">
                </div>
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="uptime"> 上传时间：</span>
                    </div>
                    <input type="text" name="uptime" class="form-control" aria-label="Sizing example input" aria-describedby="uptime">
                </div>

                <div class="form-group row">
                    <input type="submit"  class="btn btn-secondary btn-lg btn-block" value="上传"/>
                </div>
            </form>
            <canvas class="my-4 w-100" id="myChart" width="900" height="380"></canvas>
        </main>
    </div>
</div>
<%--<div class="containt">
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
</div>--%>
</c:if>
</body>
</html>
