<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>删除消息</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/manageNews.css">
</head>
<body>
	<div class="container">
	<div class="masthead">
			<h3 class="text-muted page-header">欢迎你，管理员</h3>
		<nav class="nav nav-pills nav-fill">
			<li class="nav-item ">
				<a class=" nav-link " href="addNews.jsp">发布消息</a>
			</li>
			<li class="nav-item ">
				<a class=" nav-link" href="updateNews.jsp">更改消息</a>
			</li>
			<li class="nav-item ">
				 <a class=" nav-link active">删除消息</a>
			</li>
		
</nav>
</div>
		
		<!-- background image -->
	
		<!-- 添加消息界面 -->
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-9">
			<h3 class="text-muted page-header">删除消息</h3>
				<form action="deleteNews" method="post" class="form-horizontal" id="deleteNewsForm">
					<div class="form-group">
						<label for="news_id" class="col-md-4 control-label">删除消息</label>
						<div class="col-md-4">
							<input type="text" name="id" class="form-control"
								id="id" placeholder="要删除消息的标题">
						</div>
						<div class="col-md-4"></div>
					</div>

					<div class="form-group">
						<div class="col-md-offset-2 col-md-10 ">
							<button type="submit" class="btn btn-default" id="submit1">删除</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	 <script type="text/javascript" src="js/jquery.min.js"></script>
	 <script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
</body>
</html>