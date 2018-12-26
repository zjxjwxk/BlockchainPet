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
            <b>猜数字</b>
        </div>
        <div class="card-body">
            <img id="receive-bg" src="resources/img/bg1.png"/>
            <div id="receive">
                <div>
                    莱茨狗可以进行繁殖，后代有几率遗传上一代的属性和基因突变出新属性。莱茨狗有8个外貌特征，每个特征有两种不同的属性：稀有属性和普通属性。这些属性组合起来，将会决定最终的稀有等级（普通、稀有、卓越、史诗、神话、传说）。因此，作为莱茨狗的初代，即0代的特征非常重要，现在您将通过猜数字的游戏来作为第0代莱茨狗特征随机的种子之一。（等级跟稀有属性个数对应如下：普通（1个）、稀有（2个）、卓越（3个）、史诗（4个或5个）、神话（6 个或7个）、传说（8个））
                </div>
                <hr/>
                <div>
                    以下是0代莱茨狗的初始属性，每猜一次数字，莱茨狗的8项属性就会随机变化哦！系统已经随机生成了一个1~100的数，快猜猜看吧！
                </div>
                <div>
                    <table width="500px" class="generate-text">
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
                <form action="guess-number.do" method="post">
                    <div class="form-group row offset-4">
                        <input type="number" class="col-sm-3 form-control" name="guessNumber" placeholder="请输入猜测的数字"/>
                        <div class="col-sm-2">
                            <button class="btn btn-primary">猜数</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
</body>

</html>