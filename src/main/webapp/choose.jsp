<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="baseUri" value="${pageContext.request.contextPath }" scope="request"></c:set>
<html>

<head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/choose_.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>课程查看</title>
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
		<table class="table table-hover">
		<thead class="thead-dark">
		<tr>
			<th scope="col">课程编号</th>
			<th scope="col">课程名</th>
			<th scope="col">任课老师编号</th>
			<th scope="col">任课老师姓名</th>
			<th scope="col">任课老师学校</th>
			<th scope="col">成绩</th>
		</tr>
		</thead>
		<tbody>
			<tr scope="row">
				<td>${data.course.cno}</td>
				<td>${data.course.cname}</td>
				<td>${teacher.uno}</td>
				<td>${teacher.name}</td>
				<td>${teacher.shool}</td>
				<td>
					${data.grade}
				</td>
			</tr>
		</tbody>
	</table>
	</div>
	<%--<div class="footer">
		<p>适用浏览器：IE8、360、FireFox、Chrome、Safari、Opera、傲游、搜狗、世界之窗.</p>
	</div>--%>
</body>
</html>