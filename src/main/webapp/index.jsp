<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="baseUri" value="${pageContext.request.contextPath }" scope="request"/>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>首页</title>
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
<%--        <link href="bs4/css/cover.css" rel="stylesheet">--%>
</head>
<body>
<nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
    <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="index">智能习题推荐</a>

    <a href="index" class="form-control form-control-dark w-100">首页</a>

    <a href="http://www.takenedu.net/news.php"
       class="form-control form-control-dark w-100" target="_blank">学习快讯</a>

    <a href="${pageContext.request.contextPath}/playMedia"
       class="form-control form-control-dark w-100">教学视频</a>

    <a href="${pageContext.request.contextPath}/news1"
       class="form-control form-control-dark w-100">课程介绍</a>

    <a href="${pageContext.request.contextPath}/news2"
       class="form-control form-control-dark w-100">课程内容</a>

    <a href="${pageContext.request.contextPath}/news3"
       class="form-control form-control-dark w-100">课程实践</a>

    <a href="${pageContext.request.contextPath}/news4"
       class="form-control form-control-dark w-100">教学团队</a>

    <a href="${pageContext.request.contextPath}/intelligentAnalysis"
       class="form-control form-control-dark w-100">智能分析</a>
    <a href="${pageContext.request.contextPath}/yhc.jsp"  class="form-control form-control-dark w-100">智能预测</a>

    <a href="${pageContext.request.contextPath}/peculiarityRecommend"
       class="form-control form-control-dark w-100">个性推荐</a>

    <a href="${pageContext.request.contextPath}/zstp.jsp"
       class="form-control form-control-dark w-100">课程图谱</a>

    <a href="${pageContext.request.contextPath}/contactUs.jsp" class="form-control form-control-dark w-100">联系我们</a>

    <c:if test="${not empty hasLogin && userType=='2'}">
        <a href="study.jsp" class="form-control form-control-dark w-100">我的(学生)</a>
    </c:if>
    <c:if test="${not empty hasLogin && userType=='1'}">
        <a href="teacher.jsp" class="form-control form-control-dark w-100">我的(老师)</a>
    </c:if>

    <c:if test="${empty hasLogin}">
        <button class="btn btn-outline-success btn-sm" type="button" data-toggle="modal"
                data-target="#mymodal">登录
        </button>
        <span>/</span>
        <button class="btn btn-outline-success btn-sm" type="button" id="enroll">注册</button>
    </c:if>

    <c:if test="${not empty hasLogin}">
        <ul class="navbar-nav px-3">
            <li class="nav-item text-nowrap">
                <a class="nav-link" href="quit" id="quit">退出</a>
            </li>
        </ul>
    </c:if>
</nav>

<!-- model -->
<div class="modal fade" id="mymodal" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
     data-backdrop='static'>
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="model-title">登录</h3>
                <button class="close" type="button" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row row1">
                        <label for="name" class="col-sm-2">用户名</label>
                        <div class="col-sm-10">
                            <input type="text" placeholder="用户名" class="form-control

											" id="name">
                        </div>

                    </div>
                    <div class="row row1">
                        <label for="name" class="col-sm-2">学号/职工号</label>
                        <div class="col-sm-10">
                            <input type="text" placeholder="学号/职工号" class="form-control

											" id="no">
                        </div>

                    </div>
                    <div class="row">
                        <label for="password" class="col-sm-2">密码</label>
                        <div class="col-sm-10">
                            <input type="password" placeholder="密码" class="form-control" id="password">
                        </div>
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-block btn-link-dark" data-dismiss="modal" id="login">登录</button>
            </div>
        </div>

    </div>
</div>



<div class="container-fluid">
    <div class="row">
        <div class="col-md-3">
            <br/> <br/> <br/> <br/>
            <div style="color: aqua ; text-align: left; font-size: 20px">
                名师讲堂
                <hr style="border-bottom:3px double #f7f7f7;"/>
                <span style="font-size: 15px; color: #34ce57">AAA  &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                    <a href="https://github.com/tulipforyou?tab=repositories" target="_blank">合肥工业大学16届毕业生--本科生</a>
                </span><br/>

                <span style="font-size: 15px; color: #34ce57">BBB  &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                    <a href="https://github.com/tulipforyou?tab=repositories" target="_blank">合肥工业大学16届毕业生--研究生</a>
                </span><br/>

                <span style="font-size: 15px; color: #34ce57">CCC  &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                    <a href="https://github.com/tulipforyou?tab=repositories" target="_blank">合肥工业大学16届毕业生--博士生</a>
                </span><br/><br/>
            </div>
            <div style="color: #ff6600;text-align: left; font-size: 20px">
                新课推荐
                <hr style="border-bottom:3px double #f7f7f7;"/>
                <span style="font-size: 15px; color: #34ce57">AA英语  &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                    <a href="#" target="_blank">高三英语补习班开课了</a>
                </span><br/>

                <span style="font-size: 15px; color: #34ce57">BB数学  &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                    <a href="#" target="_blank">985名师教你学数学</a>
                </span><br/>

                <span style="font-size: 15px; color: #34ce57">CC物理  &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                    <a href="#" target="_blank">专注物理五十年</a>
                </span><br/>
            </div>
        </div>
        <div class="col-md-6">
            <br/> <br/> <br/>
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100" src="images/001.jpg" style="width: 1500px;height: 400px" alt="First slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="images/003.jpg" style="width: 1500px;height: 400px" alt="Second slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="images/002.jpg" style="width: 1500px;height: 400px" alt="Third slide">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>

        </div>
        <div class="col-md-3">
            <br/> <br/> <br/> <br/>
            <div style="color: #9fcdff; text-align: left; font-size: 20px">
                相关推荐
                <hr style="border-bottom:3px solid #f7f7f7;"/>
                <span style="font-size: 15px; color: #34ce57">人工智能  &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                    <a href="http://www.cnki.com.cn/Article/CJFDTotal-JYJA201734003.htm" target="_blank">走进人工智能教育新时代</a>
                </span><br/>
                <hr style="border-bottom:3px dashed #d4edda;"/>

                <span style="font-size: 15px; color: #34ce57">认知诊断  &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                    <a href="http://wiki.cnki.com.cn/HotWord/134081.htm" target="_blank">知网空间--认知诊断</a>
                </span><br/>
                <hr style="border-bottom:3px dashed #d4edda;"/>

                <span style="font-size: 15px; color: #34ce57">机器学习  &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                    <a href="https://morvanzhou.github.io/tutorials/machine-learning/ML-intro/" target="_blank">机器学习方法</a>
                </span><br/>
                <hr style="border-bottom:3px dashed #d4edda;"/>

                <span style="font-size: 15px; color: #34ce57">Java Web  &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                    <a href="https://www.w3cschool.cn/javaweb/" target="_blank">W3C Java Web 综合学习</a>
                </span><br/>
                <hr style="border-bottom:3px dashed #d4edda;"/>

                <span style="font-size: 15px; color: #34ce57">数据库  &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                    <a href="https://www.runoob.com/mysql/mysql-tutorial.html" target="_blank">菜鸟MySQL教程</a>
                </span><br/>
                <hr style="border-bottom:3px dashed #d4edda;"/>

                <span style="font-size: 15px; color: #34ce57">hfut  &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                    <a href="http://www.hfut.edu.cn/" target="_blank">合肥工业大学</a>
                </span><br/>
            </div>
        </div>
    </div>
<br/>
    <div class="row">
        <div class="col-md-2">

        </div>

        <div class="col-md-8">
            <div class="containt">
                <%--<ul class="containt_l">
                    <li class="active"><a href="##">课程介绍</a></li>
                    <li><a href="##">课程内容</a></li>
                    <li><a href="##">课程实践</a></li>
                    <li><a href="##">教学团队</a></li>
                </ul>--%>
                <ul class="containt_r">
                    <div style="color: #0b2e13; text-align: left; font-size: 20px">
                        课程介绍
<%--                        <hr style="background-color: #d4edda"/>--%>
                    </div>
                    <li style="height: auto;">

                        <table>
                            <c:forEach var="row" items="${data1}">
                                <tr>
                                    <td><a href="javascript:getContent(${row.id})">
                                        <h3 style="text-align: center;font-size: 30px">
                                           ${row.head}
                                        </h3>
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align:left;">
											<span style="color: aqua">
												编号：${row.id}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发布日期：${row.date}
											</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>摘要：${row.summary}</td>
                                </tr>
                                <tr>
                                    <td><img src="${baseUri}/upload/${row.img}" style="height: 600px ;width: 1200px"/></td>
                                </tr>
                                <tr>
                                    <td>
                                        _____________________________________________________________________________________________________
                                    </td>
                                </tr>

                            </c:forEach>
                        </table>

                    </li>
                    <div style="color: #0b2e13; text-align: left; font-size: 20px">
                        <br/>
                        课程内容
<%--                        <hr style="background-color: #d4edda"/>--%>
                    </div>
                    <li style="height:auto;">
                        <table>
                            <c:forEach var="row" items="${data2}">
                                <tr>
                                    <td><a href="javascript:getContent(${row.id})">
                                        <h3 style="text-align: center;font-size: 30px">
                                            ${row.head}
                                        </h3>
                                    </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align:left;">
											<span style="color: aqua">
												编号：${row.id}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发布日期：${row.date}
											</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>摘要：${row.summary}</td>
                                </tr>
                                <tr>
                                    <td><img src="${baseUri}/upload/${row.img}" style="height: 600px ;width: 1200px"/></td>
                                </tr>
                                <tr>
                                    <td>
                                        _____________________________________________________________________________________________________
                                    </td>
                                </tr>

                            </c:forEach>
                        </table>

                    </li>
                    <div style="color: #0b2e13; text-align: left; font-size: 20px">
                        <br/>
                        课程实践
<%--                        <hr style="background-color: #d4edda"/>--%>
                    </div>
                    <li style="height:auto;">
                        <table>
                            <c:forEach var="row" items="${data3}">
                                <tr>
                                    <td><a href="javascript:getContent(${row.id})">
                                        <h3 style="text-align: center;font-size: 30px">
                                            ${row.head}
                                        </h3>
                                    </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align:left;">
											<span style="color: aqua">
												编号：${row.id}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发布日期：${row.date}
											</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>摘要：${row.summary}</td>
                                </tr>
                                <tr>
                                    <td><img src="${baseUri}/upload/${row.img}" style="height: 600px ;width: 1200px"/></td>
                                </tr>
                                <tr>
                                    <td>
                                        _____________________________________________________________________________________________________
                                    </td>
                                </tr>

                            </c:forEach>
                        </table>
                    </li>
                    <div style="color: #0b2e13; text-align: left; font-size: 20px">
                        <br/>
                        教学团队
<%--                        <hr style="background-color: #d4edda"/>--%>
                    </div>
                    <li style="height: auto;">
                        <table>
                            <c:forEach var="row" items="${data4}">
                                <tr>
                                    <td><a href="javascript:getContent(${row.id})">
                                        <h3 style="text-align: center;font-size: 30px">
                                           ${row.head}
                                        </h3>
                                    </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align:left;">
											<span style="color: aqua">
												编号：${row.id}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发布日期：${row.date}
											</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>摘要：${row.summary}</td>
                                </tr>
                                <tr>
                                    <td><img src="${baseUri}/upload/${row.img}" style="height: 600px ;width: 1200px"/></td>
                                </tr>
                                <tr>
                                    <td>
                                        _____________________________________________________________________________________________________
                                    </td>
                                </tr>

                            </c:forEach>
                        </table>
                    </li>
                </ul>
                <div style="clear: both;"></div>
            </div>
        </div>

        <div class="col-md-2">

        </div>
    </div>
</div>









<%--<div class="containt">
    <ul class="containt_l">
        <li class="active"><a href="##">课程介绍</a></li>
        <li><a href="##">课程内容</a></li>
        <li><a href="##">课程实践</a></li>
        <li><a href="##">教学团队</a></li>
    </ul>
    <ul class="containt_r">
        <li style="height: auto;">

            <table>
                <c:forEach var="row" items="${data1}">
                    <tr>
                        <td><a href="javascript:getContent(${row.id})"><h2>标题：${row.head}</h2></a></td>
                    </tr>
                    <tr>
                        <td style="text-align:left;">
											<span style="color: aqua">
												编号：${row.id}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发布日期：${row.date}
											</span>
                        </td>
                    </tr>
                    <tr>
                        <td>摘要：${row.summary}</td>
                    </tr>
                    <tr>
                        <td><img src="${baseUri}/upload/${row.img}" style="height: 600px ;width: 1200px"/></td>
                    </tr>
                    <tr>
                        <td>
                            _____________________________________________________________________________________________________
                        </td>
                    </tr>

                </c:forEach>
            </table>

        </li>
        <li style="height:auto;">
            <table>
                <c:forEach var="row" items="${data2}">

                    <tr>
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
                        <td><img src="${baseUri}/upload/${row.img}"/></td>
                    </tr>
                    <tr>
                        <td>
                            ___________________________________________________________________________________________________________________
                        </td>
                    </tr>

                </c:forEach>
            </table>

        </li>
        <li style="height:auto;">
            <table>
                <c:forEach var="row" items="${data3}">

                    <tr>
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
                        <td><img src="${baseUri}/upload/${row.img}"/></td>
                    </tr>
                    <tr>
                        <td>
                            ___________________________________________________________________________________________________________________
                        </td>
                    </tr>

                </c:forEach>
            </table>
        </li>
        <li style="height: auto;">
            <table>
                <c:forEach var="row" items="${data4}">

                    <tr>
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
                        <td><img src="${baseUri}/upload/${row.img}"/></td>
                    </tr>
                    <tr>
                        <td>
                            ___________________________________________________________________________________________________________________
                        </td>
                    </tr>

                </c:forEach>
            </table>
        </li>
    </ul>
    <div style="clear: both;"></div>
</div>--%>
<%--<div class="footer">
    <p>适用浏览器：IE8、360、FireFox、Chrome、Safari、Opera、傲游、搜狗、世界之窗.</p>
</div>--%>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/index_.js"></script>
<script type="text/javascript">
    function getContent(id) {
        window.location = "read.action?id=" + id;
    }
</script>


</body>
</html>