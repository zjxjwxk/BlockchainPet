<%@ page import="model.Pet" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
                        <div style="margin: 40px;">
                            <img id="pet-img" src="<%= pet.getImgPath()%>">
                        </div>
                        <form method="post" action="modify-market-pet.do">
                            <input type="hidden" name="petId" value="<%= pet.getId() %>">
                            <div class="form-group row">
                                <label for="petName" class="col-sm-2 col-form-label">狗狗名字</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="petName" id="petName" value="<%= pet.getName() %>">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="generation" class="col-sm-2 col-form-label">代数</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="generation" id="generation" value="<%= pet.getGeneration() %>">
                                </div>
                            </div>
                            <div class="form-group row offset-2">
                                <button type="submit" class="btn btn-primary">修改完成</button>
                            </div>
                        </form>
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