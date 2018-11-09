<%
    String loginErrorMessage = (String) request.getAttribute("loginError");
    if (loginErrorMessage != null) {
%>
    <script type="text/javascript">
        alert("<%=loginErrorMessage %>");
    </script>
<%
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
                        <a class="nav-link" href="#">我的狗窝</a>
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
                        if (session.getAttribute("username") != null) {
                    %>
                    <li class="nav-item active">
                        <a class="nav-link"><%=session.getAttribute("username")%></a>
                    </li>
                    <%
                        } else {
                    %>
                    <li class="nav-item active">
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
                <b>登陆</b>
            </div>
            <div class="card-body">
                <div class="container" style="width: 500px;">
                    <form id="login-form" action="login.do">
                        <div class="form-group">
                            <label for="username">用户名</label>
                            <input type="text" class="form-control" id="username" name="username" aria-describedby="userHelp" placeholder="请输入用户名">
                        </div>
                        <div class="form-group">
                            <label for="password">密码</label>
                            <input type="password" class="form-control" id="password" name="password" aria-describedby="passwordHelp" placeholder="请输入用户密码">
                        </div>
                        <div class="form-group" id="forget">
                            <a href="#">忘记密码</a>&nbsp;&nbsp;
                            <a href="register.jsp">立即注册</a>
                        </div>
                        <button type="submit" class="btn btn-primary" onclick="return login()">登陆</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script src="resources/js/jquery.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    <script src="resources/js/login.js"></script>
</body>

</html>