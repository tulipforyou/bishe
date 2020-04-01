<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="baseUri" value="${pageContext.request.contextPath }" scope="request"></c:set>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>消息通知</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/manageNews.css">
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<ul class="nav nav-tabs">
					<li role="presentation" class="active"><a class="dropdown-item" href="news1">课程介绍</a></li>
					<li role="presentation"><a class="dropdown-item" href="news2">课程内容</a></li>
					<li role="presentation"><a class="dropdown-item" href="news3">课程实践</a></li>
					<li role="presentation"><a class="dropdown-item" href="news4">教学团队</a></li>
				</ul>
			</div>
		</div>
		<div>
			<table>
					<c:forEach var="row" items="${data}">
								
									<tr >
										<td style="text-align:left;">${row.id}</td>
										<td style="text-align:right;">${row.date}</td>
									</tr>
									<tr>
										<td><a href="javascript:getContent(${row.id})"><h2>${row.head}</h2></a></td>
									</tr>
									<tr>
										<td>${row.summary}</td>
									</tr>
									<tr>
										<td>${row.body}</td>
									</tr>
									<tr>
										<td><img src="${baseUri}/upload/${row.img}" style="width: 100px;height:100px;"/></td>
									</tr>
									<tr>
										<td>___________________________________________________________________________________________________________________</td>
									</tr>
								
						</c:forEach>
				</table>
		
		</div>
		
		
	</div>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	 <script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
	function getContent(id) {
		window.location = "read.action?id=" + id;
	}
</script>
</body>
</html>