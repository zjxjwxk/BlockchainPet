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
                </ul>
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="register.jsp">注册</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">登陆</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container">
        <div class="card">
            <div class="card-header" style="background-color: #fff">
                <b>注册</b>
            </div>
            <div class="card-body">
                <div class="container" style="width: 500px;">
                    <form id="register-form">
                        <div class="form-group">
                            <label for="username">用户名</label>
                            <input type="text" class="form-control" id="username" aria-describedby="userHelp" placeholder="请输入用户名">
                            <small id="userHelp" class="form-text text-muted">&nbsp;&nbsp;6——16个字符</small>
                        </div>
                        <div class="form-group">
                            <label for="password">用户密码</label>
                            <input type="password" class="form-control" id="password" aria-describedby="passwordHelp" placeholder="请输入用户密码">
                            <small id="passwordHelp" class="form-text text-muted">&nbsp;&nbsp;至少1位密码</small>
                        </div>
                        <div class="form-group">
                            <label for="confirm-password">确认密码</label>
                            <input type="password" class="form-control" id="confirm-password" aria-describedby="confirmPasswordHelp" placeholder="请输入确认密码">
                            <small id="confirmPasswordHelp" class="form-text text-muted">&nbsp;&nbsp;需要与“用户密码”相同</small>
                        </div>
                        <div class="form-group">
                            <label for="email">电子邮件</label>
                            <input type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="请输入电子邮件地址">
                            <small id="emailHelp" class="form-text text-muted">&nbsp;&nbsp;必须是真实邮箱的邮件地址</small>
                        </div>
                        <div class="form-group">
                            <label for="real-username">真实姓名</label>
                            <input type="text" class="form-control" id="real-username" aria-describedby="realUsernameHelp" placeholder="请输入真实姓名">
                            <small id="realUsernameHelp" class="form-text text-muted">&nbsp;&nbsp;必须是3——8个中文字符</small>
                        </div>
                        <div class="form-group">
                            <label for="sex">性别</label>
                            <select class="form-control" id="sex">
                                <option value="" style="display: none">请选择性别</option>
                                <option>男</option>
                                <option>女</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="education">学历</label>
                            <select class="form-control" id="education">
                                <option value="" style="display: none">请选择学历</option>
                                <option value="博士">博士</option>
                                <option value="硕士">硕士</option>
                                <option value="本科">本科</option>
                                <option value="专科">专科</option>
                                <option value="高中">高中</option>
                                <option value="初中">初中</option>
                                <option value="小学">小学</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="phone">联系电话</label>
                            <input type="number" class="form-control" id="phone" aria-describedby="phoneHelp" placeholder="请输入联系电话">
                            <small id="phoneHelp" class="form-text text-muted">&nbsp;&nbsp;只填一个号码，不超过15位</small>
                        </div>
                        <div class="form-group">
                            <label for="province">所在省/市</label>
                            <select class="form-control" id="province">
                                <option value="" style="display: none">请选择所在省/市</option>
                                <option value="浙江">浙江</option>
                                <option value="上海">上海</option>
                                <option value="背景">北京</option>
                                <option value="广州">广州</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="address">联系地址</label>
                            <input type="text" class="form-control" id="address" placeholder="请输入联系地址">
                        </div>
                        <div class="form-group">
                            <label for="zip-code">邮政编码</label>
                            <input type="number" class="form-control" id="zip-code" placeholder="请输入邮政编码">
                        </div>
                        <div class="form-group">
                            <label for="question">忘记密码问题</label>
                            <input type="text" class="form-control" id="question" placeholder="请输入忘记密码问题">
                        </div>
                        <div class="form-group">
                            <label for="answer">忘记密码问题答案</label>
                            <input type="text" class="form-control" id="answer" placeholder="请输入忘记密码问题答案">
                        </div>
                        <button type="submit" class="btn btn-primary" onclick="return register()">注册</button>
                        <button type="reset" class="btn btn-primary">重置</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script src="resources/js/jquery.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    <script src="resources/js/register.js"></script>
</body>

</html>