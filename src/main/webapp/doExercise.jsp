<%--
  Created by IntelliJ IDEA.
  User: 25243
  Date: 2020/3/9
  Time: 19:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="baseUri" value="${pageContext.request.contextPath }" scope="request"/>
<html>
<head>
   <%-- <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/choose_.css">--%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>学生做习题</title>
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
    <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">Company name</a>

    <a href="index" class="form-control form-control-dark w-100">首页</a>

    <a href="http://www.takenedu.net/news.php"  class="form-control form-control-dark w-100" target="_blank">学习快讯</a>

    <a href="${pageContext.request.contextPath}/playMedia"  class="form-control form-control-dark w-100">教学视频</a>

    <a href="${pageContext.request.contextPath}/news1"  class="form-control form-control-dark w-100">课程介绍</a>

    <a href="${pageContext.request.contextPath}/news2"  class="form-control form-control-dark w-100">课程内容</a>

    <a href="${pageContext.request.contextPath}/news3"  class="form-control form-control-dark w-100">课程实践</a>

    <a href="${pageContext.request.contextPath}/news4"  class="form-control form-control-dark w-100">教学团队</a>

    <a href="${pageContext.request.contextPath}/intelligentAnalysis"  class="form-control form-control-dark w-100">智能分析</a>

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
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
            <div class="sidebar-sticky">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link" href="course">
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
                        <a class="nav-link active" href="doExercise">
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
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2">做练习</h1>
            </div>
            <table class="table table-hover">
                <thead class="thead-dark fixedHeader">
                <tr>
                    <th scope="col">选择提交</th>
                    <th scope="col">习题编号</th>
                    <th scope="col">课程名称</th>
                    <th scope="col">习题类型</th>
                    <th scope="col">涉及知识点</th>
                    <th scope="col">题目</th>
                    <th scope="col">选项一</th>
                    <th scope="col">选项二</th>
                    <th scope="col">选项三</th>
                    <th scope="col">选项四</th>
                    <th scope="col">正确答案</th>
                </tr>
                </thead>
            </table>
            <form action="checkAnswer" method="post">
                <table class="table table-hover">
                    <tbody id="tbodyId">
                    <c:forEach var="row" items="${allExercise}">
                        <tr scope="row ">
                            <td>
                                <label>
                                    <input type="checkbox" class="checkbox" value="${row.id }" id="checkbox" name="checkbox" style="zoom:200%"/>
                                    <span class="lbl"></span>
                                </label>
                            </td>
                            <td id="no">${row.id}</td>
                            <td>${row.className}</td>
                            <td>${row.exerciseType}</td>
                            <td>${row.knowledgePoints}</td>
                            <td>${row.subject}</td>
                            <td>${row.answer1}</td>
                            <td>${row.answer2}</td>
                            <td>${row.answer3}</td>
                            <td>${row.answer4}</td>
                            <td id="sa">
                                <label title="请填写答案:">
                                    <input type="text" name="studentAnswer">
                                </label>
                            </td>
                        </tr>
                    </c:forEach>
                    <input type="submit" value="提交" class=" btn btn-secondary">
                    </tbody>
                </table>
            </form>
            <canvas class="my-4 w-100" id="myChart" width="900" height="380"></canvas>
        </main>
    </div>
</div>

<%--<div class="containt">
    <table class="table table-hover">
        <thead class="thead-dark fixedHeader">
        <tr>
            <th scope="col">选择提交</th>
            <th scope="col">习题编号</th>
            <th scope="col">课程名称</th>
            <th scope="col">习题类型</th>
            <th scope="col">涉及知识点</th>
            <th scope="col">题目</th>
            <th scope="col">选项一</th>
            <th scope="col">选项二</th>
            <th scope="col">选项三</th>
            <th scope="col">选项四</th>
            <th scope="col">正确答案</th>
        </tr>
        </thead>
    </table>
    <form action="checkAnswer" method="post">
        <table class="table table-hover">
            <tbody id="tbodyId">
            <c:forEach var="row" items="${allExercise}">
                <tr scope="row ">
                    <td>
                        <label>
                            <input type="checkbox" class="checkbox" value="${row.id }" id="checkbox" name="checkbox" style="zoom:200%"/>
                            <span class="lbl"></span>
                        </label>
                    </td>
                    <td id="no">${row.id}</td>
                    <td>${row.className}</td>
                    <td>${row.exerciseType}</td>
                    <td>${row.knowledgePoints}</td>
                    <td>${row.subject}</td>
                    <td>${row.answer1}</td>
                    <td>${row.answer2}</td>
                    <td>${row.answer3}</td>
                    <td>${row.answer4}</td>
                    <td id="sa">
                        <label title="请填写答案:">
                            <input type="text" name="studentAnswer">
                        </label>
                    </td>
                </tr>
            </c:forEach>
            <input type="submit" value="提交" class=" btn btn-secondary">
            </tbody>
        </table>
    </form>
</div>
&lt;%&ndash;<div class="footer" >
    <p>适用浏览器：IE8、360、FireFox、Chrome、Safari、Opera、傲游、搜狗、世界之窗.</p>
</div>&ndash;%&gt;
<script type="text/javascript" src="js/jquery.min.js"></script>--%>
<%--<script type="text/javascript" src="js/studentAnswer.js"></script>--%>
</body>
</html>
