<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="baseUri" value="${pageContext.request.contextPath }" scope="request"></c:set>
<html>

<head>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/choose_.css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>联系我们</title>
</head>
<body style="background: #d4edda">
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
<div class="header">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="main-title text-center">
                    <h2>智能习题推荐系统</h2>
                    <p class="MsoNormal"
                       style="text-indent:37px;mso-char-indent-count:2.0;line-height:32px;mso-line-height-rule:exactly;mso-pagination:widow-orphan">
                        &nbsp;&nbsp;&nbsp;&nbsp;智能推荐系统是互联网和电子商务发展的产物，它是建立在海量数据挖掘基础上的一种高级商务智能平台，
                        向顾客提供个性化的信息服务和决策支持。近年来已经出现了许多非常成功的大型推荐系统实例，与此同时，
                        智能推荐系统也逐渐成为学术界的研究热点之一。</p>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="about text-center">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="title">
                    <h2>关于我们</h2>
                    <p class="MsoNormal"
                       style="text-indent:37px;mso-char-indent-count:2.0;line-height:32px;mso-line-height-rule:exactly;mso-pagination:widow-orphan">
                        &nbsp;&nbsp;&nbsp;&nbsp;计算机与信息学院的前身是创建于1958年的无线电工程系，1996年由原计算机与信息系、计算中心和微机所组成学院，
                        更名为计算机与信息学院。2018年成立人工智能学院，人工智能学院与计算机与信息学院为一个实体。
                        学院每年承担国家重点研发计划、国家863计划、973计划、国家自然科学基金重点项目、杰青项目、优青项目、面上项目等国家和省部级及面向国民经济主战场的科研课题几十项，
                        年均科研经费超过4000万元。学院现有数字媒体技术、数据挖掘与智能计算、情感计算与交互、计算机图形学、分布式实时系统、
                        计算机网络与信息安全、智能信息处理、数字信号处理、空间信息处理、无线通信网络及信息系统、微波与光通信、
                        面向服务的软件工程方法、软件交互技术、软件质量保证与可信计算、嵌入式软件理论与技术、多媒体信息系统等研究方向。
                        计算机与信息学院将秉承“学院、荣誉、责任”之精神，坚持“以学科建设为龙头，以教学科研为两翼，以人才培养为中心，
                        以行政实验为保障”之理念，促进学院科学、和谐发展，全面建设高水平研究型学院。
                    </p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="title">
                    <h2>联系我们</h2>
                    <p class="MsoNormal"
                       style="text-indent:37px;mso-char-indent-count:2.0;line-height:32px;mso-line-height-rule:exactly;mso-pagination:widow-orphan">
                        联系电话：18856362003<br/>
                        QQ:2524356811<br/>
                        地址：安徽省宣城市宣州区合肥工业大学宣城校区<br/><br/>
                        <img src="images/dz.jpg" alt="sd" style="width: 1100px;height: 550px">
                        <br/><br/>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="" id="footer">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="footer-title text-center">
                    <h4>合肥工业大学</h4>
                </div>
            </div>
            <div class="col-md-12 text-center footer-line">
                <p>Copyright &copy; 2020.Company name All rights reserved.</p>
            </div>
        </div>
    </div>
</div>
</body>
</html>