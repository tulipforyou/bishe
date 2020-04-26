<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="baseUri" value="${pageContext.request.contextPath }" scope="request"/>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>联系我们</title>
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

<div class="container-fluid">
    <div class="row">

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2">联系我们</h1>
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
            <canvas class="my-4 w-100" id="myChart" width="900" height="380"></canvas>
        </main>

    </div>
</div>
<%--<div class="header">
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
</div>--%>
</body>
</html>