<%@ page import="model.Pet" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
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
                <b>个人中心</b>
            </div>
            <div class="card-body">
                <div id="profile-avatar" class="media">
                    <img id="avatar" class="mr-3" src="resources/img/12.png" alt="Generic placeholder image">
                    <div class="media-body">
                        <h5 class="mt-0"><%= session.getAttribute("nikename") %></h5>
                        1000微积分
                    </div>
                </div>
                <ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" data-toggle="tab" href="#my-pets" role="tab">我的狗狗</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#multiplication" role="tab">狗狗繁衍</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#my-email" role="tab">我的密保邮箱</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade show active" id="my-pets" role="tabpanel">
                        <div class="row">
                            <%
                                List<Pet> pets = (ArrayList<Pet>)session.getAttribute("userPets");
                                if (pets == null || pets.size() == 0) {
                            %>
                            <div id="info-div">
                                您还没有宠物，快去<a href="receive.jsp">免费领养</a>一只吧！
                            </div>
                            <%
                                } else {
                                    for (Pet pet :
                                            pets) {
                            %>
                            <div class="card pet">
                                <a href="<%=basePath + "pet-information.do?petId=" + pet.getId()%>"><img class="card-img-top" src="<%= pet.getImgPath()%>"></a>
                                <div class="card-body">
                                    <span class="badge badge-primary"><%= pet.getQuality()%></span>
                                    <span class="badge badge-light">第<%= pet.getGeneration()%>代</span>
                                    <div><%= pet.getName()%>&nbsp;<%= pet.getId()%></div>
                                    <div class="text-blue">1999.00微</div>
                                </div>
                            </div>
                            <%
                                    }
                                }
                            %>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="multiplication" role="tabpanel">
                        <%
                            Pet pet1 = (Pet) request.getAttribute("pet1");
                            Pet pet2 = (Pet) request.getAttribute("pet2");
                        %>
                        <form action="" method="post">
                            <div class="row">
                                <div class="col-md-4 offset-1">
                                    <div style="margin: 10px 10px 10px 70px;">
                                        <div class="card-body">
                                            <div style="margin: 10px;">
                                                <img class="pet-img" src="<%= pet1.getImgPath()%>">
                                            </div>
                                            <div class="row" style="margin: 10px">
                                                <h5><span class="badge badge-primary"><%= pet1.getQuality()%></span></h5>&nbsp;&nbsp;
                                                <h5><span class="badge badge-light">第<%= pet1.getGeneration()%>代</span></h5>
                                            </div>
                                            <div class="row" style="margin: 20px">
                                                <h4><%= pet1.getName() + "  " + pet1.getId()%></h4>
                                            </div>
                                        </div>
                                    </div>
                                    <table width="500px" class="generate-text">
                                        <tr>
                                            <th colspan="2" style="font-size: 18px; padding: 0 30%;">等级  <span style="color: #0084ff;"><%= pet1.getQuality()%></span></th>
                                        </tr>
                                        <tr>
                                            <th style="font-size: 18px; ">属性</th>
                                        </tr>
                                        <tr>
                                            <td>体型：<%= pet1.getBodyType()%>&nbsp;&nbsp;
                                                <span class="badge badge-primary"><%= (pet1.getBasicQualitys().get("bodyType") == 1 ? "稀有" : "")%></span>
                                            </td>
                                            <td>花纹：<%= pet1.getPattern()%>&nbsp;&nbsp;
                                                <span class="badge badge-primary"><%= (pet1.getBasicQualitys().get("pattern") == 1 ? "稀有" : "")%></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>眼睛：<%= pet1.getEye()%>&nbsp;&nbsp;
                                                <span class="badge badge-primary"><%= (pet1.getBasicQualitys().get("eye") == 1 ? "稀有" : "")%></span>
                                            </td>
                                            <td>眼镜色：<%= pet1.getEyeColor()%>&nbsp;&nbsp;
                                                <span class="badge badge-primary"><%= (pet1.getBasicQualitys().get("eyeColor") == 1 ? "稀有" : "")%></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>嘴巴：<%= pet1.getMouth()%>&nbsp;&nbsp;
                                                <span class="badge badge-primary"><%= (pet1.getBasicQualitys().get("mouth") == 1 ? "稀有" : "")%></span>
                                            </td>
                                            <td>肚皮色：<%= pet1.getBellyColor()%>&nbsp;&nbsp;
                                                <span class="badge badge-primary"><%= (pet1.getBasicQualitys().get("bellyColor") == 1 ? "稀有" : "")%></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>身体色：<%= pet1.getBodyColor()%>&nbsp;&nbsp;
                                                <span class="badge badge-primary"><%= (pet1.getBasicQualitys().get("bodyColor") == 1 ? "稀有" : "")%></span>
                                            </td>
                                            <td>花纹色：<%= pet1.getPatternColor()%>&nbsp;&nbsp;
                                                <span class="badge badge-primary"><%= (pet1.getBasicQualitys().get("patternColor") == 1 ? "稀有" : "")%></span>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="col-md-4 offset-1">
                                    <div style="margin: 10px 10px 10px 70px;">
                                        <div class="card-body">
                                            <div style="margin: 10px;">
                                                <img class="pet-img" src="<%= pet2.getImgPath()%>">
                                            </div>
                                            <div class="row" style="margin: 10px">
                                                <h5><span class="badge badge-primary"><%= pet2.getQuality()%></span></h5>&nbsp;&nbsp;
                                                <h5><span class="badge badge-light">第<%= pet2.getGeneration()%>代</span></h5>
                                            </div>
                                            <div class="row" style="margin: 20px">
                                                <h4><%= pet2.getName() + "  " + pet2.getId()%></h4>
                                            </div>
                                        </div>
                                    </div>
                                    <table width="500px" class="generate-text">
                                        <tr>
                                            <th colspan="2" style="font-size: 18px; padding: 0 30%;">等级  <span style="color: #0084ff;"><%= pet2.getQuality()%></span></th>
                                        </tr>
                                        <tr>
                                            <th style="font-size: 18px; ">属性</th>
                                        </tr>
                                        <tr>
                                            <td>体型：<%= pet2.getBodyType()%>&nbsp;&nbsp;
                                                <span class="badge badge-primary"><%= (pet2.getBasicQualitys().get("bodyType") == 1 ? "稀有" : "")%></span>
                                            </td>
                                            <td>花纹：<%= pet2.getPattern()%>&nbsp;&nbsp;
                                                <span class="badge badge-primary"><%= (pet2.getBasicQualitys().get("pattern") == 1 ? "稀有" : "")%></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>眼睛：<%= pet2.getEye()%>&nbsp;&nbsp;
                                                <span class="badge badge-primary"><%= (pet2.getBasicQualitys().get("eye") == 1 ? "稀有" : "")%></span>
                                            </td>
                                            <td>眼镜色：<%= pet2.getEyeColor()%>&nbsp;&nbsp;
                                                <span class="badge badge-primary"><%= (pet2.getBasicQualitys().get("eyeColor") == 1 ? "稀有" : "")%></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>嘴巴：<%= pet2.getMouth()%>&nbsp;&nbsp;
                                                <span class="badge badge-primary"><%= (pet2.getBasicQualitys().get("mouth") == 1 ? "稀有" : "")%></span>
                                            </td>
                                            <td>肚皮色：<%= pet2.getBellyColor()%>&nbsp;&nbsp;
                                                <span class="badge badge-primary"><%= (pet2.getBasicQualitys().get("bellyColor") == 1 ? "稀有" : "")%></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>身体色：<%= pet2.getBodyColor()%>&nbsp;&nbsp;
                                                <span class="badge badge-primary"><%= (pet2.getBasicQualitys().get("bodyColor") == 1 ? "稀有" : "")%></span>
                                            </td>
                                            <td>花纹色：<%= pet2.getPatternColor()%>&nbsp;&nbsp;
                                                <span class="badge badge-primary"><%= (pet2.getBasicQualitys().get("patternColor") == 1 ? "稀有" : "")%></span>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <button class="btn btn-primary offset-5" type="submit">繁衍</button>
                        </form>
                    </div>
                    <div class="tab-pane fade" id="my-email" role="tabpanel">
                        <div id="my-email-div">
                            <a class="btn btn-primary" href="<%=basePath + "email.do"%>">查看密保邮箱</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="resources/js/jquery.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
</body>

</html>