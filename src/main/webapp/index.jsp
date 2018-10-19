<%@page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>

<head>
    <title>Blockchain-pet</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <script src="resources/js/jquery.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    <style type="text/css">
        body {
            background-color: #f6f6f6;
        }

        .card {
            margin-top: 15px;
        }

        #title {
            color: #0084ff;
        }

        .pet{
            width: 200px;
            height: 300px;
            margin: 0 0 10px 16px;
        }
    </style>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #fff">
        <div class="container">
            <a class="navbar-brand" id="title" href="#"><b>区块链宠物</b></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">主页<span class="sr-only">(current)</span></a>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-primary my-2 my-sm-0" type="submit">Search</button>
                </form>
            </div>
        </div>
    </nav>
    <div class="container">
        <div class="card">
            <div class="card-header" style="background-color: #fff">
                <b>排序</b>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="card pet">
                        <img class="card-img-top" src="resources/img/1.png">
                        <div class="card-body">
                            <span class="label label-default">稀有</span>
                            <div>宠物一号</div>
                        </div>
                    </div>
                    <div class="card pet">
                        <img class="card-img-top" src="resources/img/2.png">
                        <div class="card-body">
                            宠物2号
                        </div>
                    </div>
                    <div class="card pet">
                        <img class="card-img-top" src="resources/img/3.png">
                        <div class="card-body">
                            宠物3号
                        </div>
                    </div>
                    <div class="card pet">
                        <img class="card-img-top" src="resources/img/4.png">
                        <div class="card-body">
                            宠物4号
                        </div>
                    </div>
                    <div class="card pet">
                        <img class="card-img-top" src="resources/img/5.png">
                        <div class="card-body">
                            宠物5号
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="card pet">
                        <img class="card-img-top" src="resources/img/6.png">
                        <div class="card-body">
                            宠物6号
                        </div>
                    </div>
                    <div class="card pet">
                        <img class="card-img-top" src="resources/img/7.png">
                        <div class="card-body">
                            宠物7号
                        </div>
                    </div>
                    <div class="card pet">
                        <img class="card-img-top" src="resources/img/8.png">
                        <div class="card-body">
                            宠物8号
                        </div>
                    </div>
                    <div class="card pet">
                        <img class="card-img-top" src="resources/img/9.png">
                        <div class="card-body">
                            宠物9号
                        </div>
                    </div>
                    <div class="card pet">
                        <img class="card-img-top" src="resources/img/10.png">
                        <div class="card-body">
                            宠物10号
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="card pet">
                        <img class="card-img-top" src="resources/img/11.png">
                        <div class="card-body">
                            宠物11号
                        </div>
                    </div>
                    <div class="card pet">
                        <img class="card-img-top" src="resources/img/12.png">
                        <div class="card-body">
                            宠物12号
                        </div>
                    </div>
                    <div class="card pet">
                        <img class="card-img-top" src="resources/img/13.png">
                        <div class="card-body">
                            宠物13号
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>