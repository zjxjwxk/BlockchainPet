<%@ page import="model.Pet" %><%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
    }

    String guessResult = (String) request.getAttribute("guessResult");
    if (guessResult != null) {
%>
<script>alert("<%= guessResult%>")</script>
<%
    }

    Pet initialPet = (Pet) session.getAttribute("initialPet");
%>
<%@page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>

<head>
    <title>区块链宠物</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
    <link rel="stylesheet" href="resources/css/main.css">
</head>

<body>
<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #fff">
    <div class="container">
        <a class="navbar-brand" id="title" href="index.jsp" style="color: #0084ff"><b>区块链宠物</b></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">主页</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="pet-market.do">狗狗集市</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="receive.jsp">免费领养</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="exam.jsp">答题赚微积分</a>
                </li>
            </ul>
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="register.jsp">注册</a>
                </li>
                <%
                    if (session.getAttribute("nikename") != null) {
                %>
                <li class="nav-item dropdown active">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" href="" aria-haspopup="true" aria-expanded="false"><%=session.getAttribute("nikename")%></a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="information.do">个人中心</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="<%=basePath + "exit.do"%>">退出</a>
                    </div>
                </li>
                <%
                } else {
                %>
                <li class="nav-item">
                    <a class="nav-link" href="login.jsp">登陆</a>
                </li>
                <%
                    }
                %>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <div class="card">
        <div class="card-header" style="background-color: #fff">
            <b>领养成功</b>
        </div>
        <div class="card-body">
            <img id="receive-bg" src="resources/img/bg1.png"/>
            <div id="receive">
                <h3><b>领养成功</b></h3>
                <div>您的第0代莱茨狗等级及属性如下：</div>
                <div>
                    <table width="500px" class="generate-text">
                        <tr>
                            <th colspan="2" style="font-size: 18px; padding: 0 30%;">等级  <span style="color: #0084ff;"><%= initialPet.getQuality()%></span></th>
                        </tr>
                        <tr>
                            <th style="font-size: 18px; ">属性</th>
                        </tr>
                        <tr>
                            <td>体型：<%= initialPet.getBodyType()%>&nbsp;&nbsp;
                                <span class="badge badge-primary"><%= (initialPet.getBasicQualitys().get("bodyType") == 1 ? "稀有" : "")%></span>
                            </td>
                            <td>花纹：<%= initialPet.getPattern()%>&nbsp;&nbsp;
                                <span class="badge badge-primary"><%= (initialPet.getBasicQualitys().get("pattern") == 1 ? "稀有" : "")%></span>
                            </td>
                        </tr>
                        <tr>
                            <td>眼睛：<%= initialPet.getEye()%>&nbsp;&nbsp;
                                <span class="badge badge-primary"><%= (initialPet.getBasicQualitys().get("eye") == 1 ? "稀有" : "")%></span>
                            </td>
                            <td>眼镜色：<%= initialPet.getEyeColor()%>&nbsp;&nbsp;
                                <span class="badge badge-primary"><%= (initialPet.getBasicQualitys().get("eyeColor") == 1 ? "稀有" : "")%></span>
                            </td>
                        </tr>
                        <tr>
                            <td>嘴巴：<%= initialPet.getMouth()%>&nbsp;&nbsp;
                                <span class="badge badge-primary"><%= (initialPet.getBasicQualitys().get("mouth") == 1 ? "稀有" : "")%></span>
                            </td>
                            <td>肚皮色：<%= initialPet.getBellyColor()%>&nbsp;&nbsp;
                                <span class="badge badge-primary"><%= (initialPet.getBasicQualitys().get("bellyColor") == 1 ? "稀有" : "")%></span>
                            </td>
                        </tr>
                        <tr>
                            <td>身体色：<%= initialPet.getBodyColor()%>&nbsp;&nbsp;
                                <span class="badge badge-primary"><%= (initialPet.getBasicQualitys().get("bodyColor") == 1 ? "稀有" : "")%></span>
                            </td>
                            <td>花纹色：<%= initialPet.getPatternColor()%>&nbsp;&nbsp;
                                <span class="badge badge-primary"><%= (initialPet.getBasicQualitys().get("patternColor") == 1 ? "稀有" : "")%></span>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
</body>

</html>