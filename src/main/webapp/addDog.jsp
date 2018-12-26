<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
                    <li class="nav-item">
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
                <b>添加狗狗</b>
            </div>
            <div class="card-body">
                <div class="container" style="width: 500px;">
                    <form action="add-pet-to-market.do" method="post">
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label for="petId">狗狗ID</label>
                                <input type="text" class="form-control" id="petId" name="petId" placeholder="请输入狗狗ID">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="petName">狗狗名字</label>
                                <input type="text" class="form-control" id="petName" name="petName" placeholder="请输入狗狗名字">
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label for="quality">狗狗品质</label>
                                <input type="text" class="form-control" id="quality" name="quality" placeholder="请输入狗狗品质">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="generation">狗狗代数</label>
                                <input type="text" class="form-control" id="generation" name="generation" placeholder="请输入狗狗代数">
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label for="bodyType">狗狗体型</label>
                                <input type="text" class="form-control" id="bodyType" name="bodyType" placeholder="请输入狗狗体型">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" name="bodyTypeQuality" value="1" id="bodyTypeQuality">
                                    <label class="custom-control-label" for="bodyTypeQuality">稀有</label>
                                </div>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="eye">狗狗眼睛</label>
                                <input type="text" class="form-control" id="eye" name="eye" placeholder="请输入狗狗眼睛">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" name="eyeQuality" value="1" id="eyeQuality">
                                    <label class="custom-control-label" for="eyeQuality">稀有</label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label for="mouth">狗狗嘴巴</label>
                                <input type="text" class="form-control" id="mouth" name="mouth" placeholder="请输入狗狗嘴巴">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" name="mouthQuality" value="1" id="mouthQuality">
                                    <label class="custom-control-label" for="mouthQuality">稀有</label>
                                </div>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="bodyColor">狗狗身体色</label>
                                <input type="text" class="form-control" id="bodyColor" name="bodyColor" placeholder="请输入狗狗身体色">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" name="bodyColorQuality" value="1" id="bodyColorQuality">
                                    <label class="custom-control-label" for="bodyColorQuality">稀有</label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label for="pattern">狗狗花纹</label>
                                <input type="text" class="form-control" id="pattern" name="pattern" placeholder="请输入狗狗花纹">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" name="patternQuality" value="1" id="patternQuality">
                                    <label class="custom-control-label" for="patternQuality">稀有</label>
                                </div>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="eyeColor">狗狗眼镜色</label>
                                <input type="text" class="form-control" id="eyeColor" name="eyeColor" placeholder="请输入狗狗眼镜色">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" name="eyeColorQuality" value="1" id="eyeColorQuality">
                                    <label class="custom-control-label" for="eyeColorQuality">稀有</label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label for="bellyColor">狗狗肚皮色</label>
                                <input type="text" class="form-control" id="bellyColor" name="bellyColor" placeholder="请输入狗狗肚皮色">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" name="bellyColorQuality" value="1" id="bellyColorQuality">
                                    <label class="custom-control-label" for="bellyColorQuality">稀有</label>
                                </div>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="patternColor">狗狗花纹色</label>
                                <input type="text" class="form-control" id="patternColor" name="patternColor" placeholder="请输入狗狗花纹色">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" name="patternColorQuality" value="1" id="patternColorQuality">
                                    <label class="custom-control-label" for="patternColorQuality">稀有</label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-10">
                                <label for="imgPath">狗狗图片地址</label>
                                <input type="text" class="form-control" id="imgPath" name="imgPath" placeholder="请输入狗狗图片地址">
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-9">
                                <button type="submit" class="btn btn-primary">添加</button>
                            </div>
                        </div>
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