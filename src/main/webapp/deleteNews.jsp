<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="baseUri" value="${pageContext.request.contextPath }" scope="request"/>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%--    <link rel="stylesheet" href="css/bootstrap.min.css">--%>
    <%--    <link rel="stylesheet" href="css/manageNews.css">--%>
    <title>消息添加</title>
    <link rel="canonical" href="https://v4.bootcss.com/docs/examples/dashboard/">

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
                            <a class="nav-link" href="teacherUploadExercise.jsp">
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
                <h1 class="h2">消息添加</h1>
            </div>
            <div class="container">
                <div class="masthead">
                    <h3 class="text-muted page-header">欢迎你，管理员</h3>
                    <nav class="nav nav-pills nav-fill">
                        <li class="nav-item ">
                            <a class=" nav-link" href="addNews.jsp">发布消息</a>
                        </li>
                        <li class="nav-item">
                            <a class=" nav-link" href="updateNews.jsp">更改消息</a>
                        </li>
                        <li class="nav-item ">
                            <a class=" nav-link active">删除消息</a>
                        </li>
                    </nav>
                </div>
<br/><br/>
				<div class="row">
					<div class="col-md-3"></div>
					<div class="col-md-9">
						<h3 class="text-muted page-header">删除消息</h3>
						<form action="deleteNews" method="post" class="form-horizontal" id="deleteNewsForm">

							<div class="input-group mb-2">
								<div class="input-group-prepend">
									<label class="input-group-text" for="news_id">删除消息</label>
								</div>
									<input type="text" name="id" class="form-control"
										   id="news_id" placeholder="要删除消息的标题">
							</div>
                            <br/><br/>
							<div class="form-group">
								<div class="col-md-offset-2 col-md-12 ">
									<button type="submit" class="btn btn-secondary btn-lg btn-block"  id="submit1">删除</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</main>
	</div>
</div>
</c:if>
</body>
</html>