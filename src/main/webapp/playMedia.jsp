<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="baseUri" value="${pageContext.request.contextPath }" scope="request"></c:set>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
    Date date = new Date();
    String nowDate = sdf.format(date);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>互动学习</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/media_.css">
<link href="css/video-js.min.css" rel="stylesheet">
<script src="./js/jquery.min.js"></script>
<%--<script src="http://vjs.zencdn.net/ie8/1.1.0/videojs-ie8.min.js"></script>--%>
<script src="./js/video.min.js"></script>
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
	<div class="media">
		<video id="my-video" class="video-js" controls preload="auto" width="1000px" height="650px"
		  poster="${baseUri}/upload/media/${media.picture}" data-setup="{}">
<%--			<source src="${baseUri}/upload/media/${media.src}" type="video/mp4">--%>
			<p class="vjs-no-js">
			  To view this video please enable JavaScript, and consider upgrading to a web browser that
			  <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a>
			</p>
		  </video>
		 
	</div>
	
	 <script type="text/javascript">
		var myPlayer = videojs('my-video');
		videojs("my-video").ready(function(){
			var myPlayer = this;
			//myPlayer.src("http://192.168.1.139:8080/boot-crm/upload/water.mp4");
			myPlayer.src("${baseUri}/upload/media/${media.src}");
			myPlayer.play();
		});
</script>

<h1>评论区</h1>
	<div class="comment">
	
		
			<input name="w_name" id="w_name" value="${sessionScope.name}" hidden="hidden"/>
            <input name="w_date" id="w_date" value="<%=nowDate%>" hidden="hidden"/>
            <input name="w_media_id" id="w_media_id" value="${media.id}" hidden="hidden"/>
            <textarea  name="w_content" id="w_content" placeholder="请输入你的留言" ></textarea>
            <div >
                  <button id="wordsBtn" class="button" >留言</button>
             </div>

            
		
	
	 <!-- 留言信息列表展示 -->
        <div>
            <ul>
<!--                 先遍历留言信息（一条留言信息，下面的全是回复信息） -->
                <c:forEach items="${words_list}" var="words">
<!--                     如果留言信息是在本文章下的才显示 -->
                    <c:if test="${words.media_id eq media.id}">
                        <li>
                            <br/>
                            <div style="text-align: left;color:#444">
                                <div>
                                    <span style="color:#01AAED">${words.name}</span>
                                </div>
                                <div>${words.content}</div>
                            </div>
                            <div>
                                <div class="comment-parent" style="text-align:left;margin-top:7px;color:#444">
                                    <span>${words.date}</span>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <p>
                                       <a href="javascript:;" style="text-decoration: none;" onclick="btnReply(this)">回复</a>
                                    </p>
                                    <hr style="margin-top: 7px;"/>
                                </div>
<!--                                 回复表单默认隐藏 -->
                                <div class="replycontainer" style="margin-left: 61px;display:none">
                                    
                                        <input name="r_media_id" id="r_media_id" value="${media.id}" hidden="hidden"/>
                                        <input name="r_name" id="r_name" value="${sessionScope.name}" hidden="hidden"/>
                                        <input name="r_date" id="r_date" value="<%=nowDate%>" hidden="hidden"/>
                          
                                        <input name="r_words_id" id="r_words_id" value="${words.id}" hidden="hidden"/>
                            
                                        <div>
                                            <textarea name="r_content" id="r_content" lay-verify="replyContent" placeholder="请输入回复内容" style="min-height:80px;"></textarea>
                                        </div>
                                        <div >
                                            <button class="replyBtn">提交</button>
                                        </div>
                                    
                                </div>
                            </div>

<!--                             以下是回复信息 -->
                            <c:forEach items="${reply_list}" var="reply">
<!--                                 每次遍历出来的留言下存在回复信息才展示（本条回复信息是本条留言下的就显示在当前留言下） -->
                                <c:if test="${reply.media_id eq media.id && reply.words_id eq words.id}">
                                    <div style="text-align: left;margin-left:61px;color: #444">
                                        <div>
                                            <span style="color:#5FB878">${reply.name}&nbsp;&nbsp;</span>
                                        </div>
                                        <div>@${words.name}:&nbsp;&nbsp; ${reply.content}</div>
                                        <span>${reply.date}</span>
                                    </div>
                       
                                </c:if>
                            </c:forEach>
                        </li>
                    </c:if>
                </c:forEach>
            </ul>
         </div>
	
	
	
	</div>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
<!-- 	<div  class="footer"> -->
<!-- 		<p>适用浏览器：IE8、360、FireFox、Chrome、Safari、Opera、傲游、搜狗、世界之窗.</p> -->
<!-- 	</div> -->
 </body>
<script>
 function btnReply(elem) {
	 if ($(elem).text() == '回复') {
		 $(elem).parent('p').parent('.comment-parent').siblings('.replycontainer').css("display","block");
         $(elem).text('收起');
     } else {
    	 $(elem).parent('p').parent('.comment-parent').siblings('.replycontainer').css("display","none");
    	 $(elem).text('回复');
     }
 };
 $("#wordsBtn").click(function(){
     var w_media_id = $("#w_media_id").val();
     var w_name = $("#w_name").val();
     var w_date = $("#w_date").val();
     var w_content = $("#w_content").val();
     console.log("进来了");
     $.ajax({
         url: 'saveWords',
         type: 'POST',
         dataType: 'json',
         data: {
             media_id: w_media_id ,
             name: w_name,
             date: w_date,
             content: w_content,
         },
         
         success: function(data){
            alert(data);
            window.location.reload();
         },
         error:function(){
        	 alert("there is something wrong!");
         }
     });
 });
 
 $(".replyBtn").click(function(){
     var r_media_id = $("#r_media_id").val();
     var r_name = $("#r_name").val();
     var r_date = $("#r_date").val();
     var r_content = $("#r_content").val();
     var r_words_id = $("#r_words_id").val();
     $.ajax({
         url: 'saveReply',
         type: 'POST',
         dataType: 'json',
         data: {
             media_id: r_media_id ,
             name: r_name,
             date: r_date,
             content: r_content,
             words_id: r_words_id
         },
         
         success: function(data){
            alert(data);
            window.location.reload();
         },
         error:function(){
        	 alert("there is something wrong!");
         }
     });
 });
</script>
</html>