<%@ page import="model.Pet" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
    }
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
                        <a class="nav-link" href="index.jsp">狗狗集市</a>
                    </li>
                    <li class="nav-item">
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
                            <a class="dropdown-item" href="profile.jsp">个人中心</a>
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
                <b>狗狗详情</b>
            </div>
            <%
                Pet pet = (Pet) request.getAttribute("pet");
            %>
            <div class="card-body">
                <div>
                    <div id="pet-div">
                        <div class="card-body">
                            <div style="margin: 10px;">
                                <img id="pet-img" src="<%= pet.getImgPath()%>">
                            </div>
                            <div class="row" style="margin: 10px">
                                <h5><span class="badge badge-primary"><%= pet.getQuality()%></span></h5>&nbsp;&nbsp;
                                <h5><span class="badge badge-light">第<%= pet.getGeneration()%>代</span></h5>
                            </div>
                            <form class="row form-inline" action="change-pet-name.do">
                                <input type="hidden" name="petId" value="<%= pet.getId() %>">
                                <div class="form-group">
                                    <label>
                                        <input class="form-control mx-sm-1" type="text" name="petName" value="<%= pet.getName()%>">
                                    </label>
                                    <input class="btn btn-primary" type="submit" value="修改名字">
                                </div>
                            </form>
                        </div>
                    </div>
                    <table width="500px" id="generate-text">
                        <tr>
                            <th colspan="2" style="font-size: 18px; padding: 0 30%;">等级  <span style="color: #0084ff;"><%= pet.getQuality()%></span></th>
                        </tr>
                        <tr>
                            <th style="font-size: 18px; ">属性</th>
                        </tr>
                        <tr>
                            <td>体型：<%= pet.getBodyType()%>&nbsp;&nbsp;
                                <span class="badge badge-primary"><%= (pet.getBasicQualitys().get("bodyType") == 1 ? "稀有" : "")%></span>
                            </td>
                            <td>花纹：<%= pet.getPattern()%>&nbsp;&nbsp;
                                <span class="badge badge-primary"><%= (pet.getBasicQualitys().get("pattern") == 1 ? "稀有" : "")%></span>
                            </td>
                        </tr>
                        <tr>
                            <td>眼睛：<%= pet.getEye()%>&nbsp;&nbsp;
                                <span class="badge badge-primary"><%= (pet.getBasicQualitys().get("eye") == 1 ? "稀有" : "")%></span>
                            </td>
                            <td>眼镜色：<%= pet.getEyeColor()%>&nbsp;&nbsp;
                                <span class="badge badge-primary"><%= (pet.getBasicQualitys().get("eyeColor") == 1 ? "稀有" : "")%></span>
                            </td>
                        </tr>
                        <tr>
                            <td>嘴巴：<%= pet.getMouth()%>&nbsp;&nbsp;
                                <span class="badge badge-primary"><%= (pet.getBasicQualitys().get("mouth") == 1 ? "稀有" : "")%></span>
                            </td>
                            <td>肚皮色：<%= pet.getBellyColor()%>&nbsp;&nbsp;
                                <span class="badge badge-primary"><%= (pet.getBasicQualitys().get("bellyColor") == 1 ? "稀有" : "")%></span>
                            </td>
                        </tr>
                        <tr>
                            <td>身体色：<%= pet.getBodyColor()%>&nbsp;&nbsp;
                                <span class="badge badge-primary"><%= (pet.getBasicQualitys().get("bodyColor") == 1 ? "稀有" : "")%></span>
                            </td>
                            <td>花纹色：<%= pet.getPatternColor()%>&nbsp;&nbsp;
                                <span class="badge badge-primary"><%= (pet.getBasicQualitys().get("patternColor") == 1 ? "稀有" : "")%></span>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <script src="resources/js/jquery.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
</body>

</html>