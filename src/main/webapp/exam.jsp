<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
    }

    Integer score = (Integer) request.getAttribute("score");
    if (score != null) {
%>
        <script>alert("您这次赚取了<%= score%>点微积分！")</script>
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
                    <a class="nav-link" href="receive.jsp">免费领养</a>
                </li>
                <li class="nav-item active">
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
            <b>答题赚微积分</b>
        </div>
        <div class="card-body">
            <div class="container" style="width: 500px;">
                <form action="exam.do">
                    <div class="form-group">
                        <label>1. Which is keyword in Java?</label>
                        <div class="custom-control custom-radio">
                            <input type="radio" id="answer1-1" name="answer1" value="1" class="custom-control-input">
                            <label class="custom-control-label" for="answer1-1">null</label>
                        </div>
                        <div class="custom-control custom-radio">
                            <input type="radio" id="answer1-2" name="answer1" value="2" class="custom-control-input">
                            <label class="custom-control-label" for="answer1-2">true</label>
                        </div>
                        <div class="custom-control custom-radio">
                            <input type="radio" id="answer1-3" name="answer1" value="3" class="custom-control-input">
                            <label class="custom-control-label" for="answer1-3">sizeof</label>
                        </div>
                        <div class="custom-control custom-radio">
                            <input type="radio" id="answer1-4" name="answer1" value="4" class="custom-control-input">
                            <label class="custom-control-label" for="answer1-4">implements</label>
                        </div><!-- true -->
                    </div>
                    <div class="form-group">
                        <label>2. 在 main() 方法中给出的整型数组，如果将其写到一个文件中，需要（ ）。</label>
                        <div class="custom-control custom-radio">
                            <input type="radio" id="answer2-1" name="answer2" value="1" class="custom-control-input">
                            <label class="custom-control-label" for="answer2-1">System.out.print (buffer[i]);</label>
                        </div>
                        <div class="custom-control custom-radio">
                            <input type="radio" id="answer2-2" name="answer2" value="2" class="custom-control-input">
                            <label class="custom-control-label" for="answer2-2">DataOutputStream dout = new DataOutputStream(new FileOutputStream(this.filename));</label>
                        </div><!-- true -->
                        <div class="custom-control custom-radio">
                            <input type="radio" id="answer2-3" name="answer2" value="3" class="custom-control-input">
                            <label class="custom-control-label" for="answer2-3">DataInputStream din = new DataInputStream(new FileInputStream(this.filename));。</label>
                        </div>
                        <div class="custom-control custom-radio">
                            <input type="radio" id="answer2-4" name="answer2" value="4" class="custom-control-input">
                            <label class="custom-control-label" for="answer2-4">System.in.read(buffer)。</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>3. 下列说法正确的是（）？</label>
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" name="answer3" value="1" id="answer3-1">
                            <label class="custom-control-label" for="answer3-1">对于局部内部类，只有在方法的局部变量被标记为final或局部变量是effctively final的，内部类才能使用它们</label>
                        </div><!-- true -->
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" name="answer3" value="2" id="answer3-2">
                            <label class="custom-control-label" for="answer3-2">成员内部类位于外部类内部，可以直接调用外部类的所有方法（静态方法和非静态方法）</label>
                        </div><!-- true -->
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" name="answer3" value="3" id="answer3-3">
                            <label class="custom-control-label" for="answer3-3">由于匿名内部类只能用在方法内部，所以匿名内部类的用法与局部内部类是一致的</label>
                        </div>
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" name="answer3" value="4" id="answer3-4">
                            <label class="custom-control-label" for="answer3-4">静态内部类可以访问外部类的成员变量</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>4. 截止JDK1.8版本,java并发框架支持锁包括？</label>
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" name="answer4" value="1" id="answer4-1">
                            <label class="custom-control-label" for="answer4-1">读写锁</label>
                        </div><!-- true -->
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" name="answer4" value="2" id="answer4-2">
                            <label class="custom-control-label" for="answer4-2">自旋锁</label>
                        </div><!-- true -->
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" name="answer4" value="3" id="answer4-3">
                            <label class="custom-control-label" for="answer4-3">X锁</label>
                        </div>
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" name="answer4" value="4" id="answer4-4">
                            <label class="custom-control-label" for="answer4-4">乐观锁</label>
                        </div><!-- true -->
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" name="answer4" value="5" id="answer4-5">
                            <label class="custom-control-label" for="answer4-5">排他锁</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="answer5">5. 对于JVM内存配置参数：-Xmx10240m -Xms10240m -Xmn5120m -XXSurvivorRatio=3,其最小内存值为:</label>
                        <input type="text" class="form-control" id="answer5" name="answer5">
                    </div><!-- 10240m -->
                    <div class="form-group">
                        <label for="answer6">6. 给定以下JAVA代码，这段代码运行后输出的结果是:</label>
<pre>
public class Test
{
    public static int aMethod(int i)throws Exception
    {
        try{
            return i / 10;
        }
        catch (Exception ex)
        {
            throw new Exception("exception in a Method");
        } finally{
            System.out.printf("finally");
        }
    }

    public static void main(String [] args)
    {
        try
        {
            aMethod(0);
        }
        catch (Exception ex)
        {
            System.out.printf("exception in main");
        }
        System.out.printf("finished");
    }
}
</pre>
                        <input type="text" class="form-control" id="answer6" name="answer6">
                    </div><!-- finally finished -->
                    <div class="form-group">
                        <label>7. doGet/doPost 是在 javax.servlet.GenericServlet 中实现的</label>
                        <div class="custom-control custom-radio">
                            <input type="radio" id="answer7-1" name="answer7" value="1" class="custom-control-input">
                            <label class="custom-control-label" for="answer7-1">对</label>
                        </div>
                        <div class="custom-control custom-radio">
                            <input type="radio" id="answer7-2" name="answer7" value="2" class="custom-control-input">
                            <label class="custom-control-label" for="answer7-2">错</label>
                        </div><!-- true -->
                    </div>
                    <div class="form-group">
                        <label>8. 关于JVM内存, 方法区用于存储JVM加载的类信息、常量、静态变量、以及编译器编译后的代码等数据，是线程隔离的</label>
                        <div class="custom-control custom-radio">
                            <input type="radio" id="answer8-1" name="answer8" value="1" class="custom-control-input">
                            <label class="custom-control-label" for="answer8-1">对</label>
                        </div>
                        <div class="custom-control custom-radio">
                            <input type="radio" id="answer8-2" name="answer8" value="2" class="custom-control-input">
                            <label class="custom-control-label" for="answer8-2">错</label>
                        </div><!-- true -->
                    </div>
                    <button type="submit" class="btn btn-primary" onclick="return examSubmit()">提交</button>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/exam.js"></script>
</body>

</html>