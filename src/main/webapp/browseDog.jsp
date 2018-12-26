<%@ page import="model.Pet" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                    <li class="nav-item active">
                        <a class="nav-link" href="pet-market.do">狗狗集市</a>
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
        <div class="card" style="padding-bottom: 0">
            <div class="card-header" style="background-color: #fff">
                <b>狗狗集市</b>
                <div class="float-right" id="sort">
                    <a href="#">稀有度 <i class="fas fa-sort"></i></a>
                    <a href="#">价格 <i class="fas fa-sort"></i></a>
                    <a href="#">时间 <i class="fas fa-sort"></i></a>
                </div>
            </div>
            <div class="card-body">
                <div class="row">
                    <%
                        List<Pet> petList = (ArrayList<Pet>) session.getAttribute("petList");
                        for (Pet pet :
                                petList) {
                    %>
                    <div class="card pet">
                        <a href="<%=basePath + "market-pet-information.do?petId=" + pet.getId()%>"><img class="card-img-top" src="<%= pet.getImgPath()%>"></a>
                        <div class="card-body">
                            <span class="badge badge-primary"><%= pet.getQuality() %></span>
                            <span class="badge badge-light">第<%= pet.getGeneration() %>代</span>
                            <div><%= pet.getName() + "  " + pet.getId() %></div>
                            <div class="text-blue">1999.00微</div>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
            <div class="card-footer">
                <a class="btn btn-primary offset-5" href="addDog.jsp">添加狗狗</a>
            </div>
        </div>
    </div>
    <script src="resources/js/jquery.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
</body>

</html>