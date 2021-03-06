<%--
  Created by IntelliJ IDEA.
  User: jiyufei
  Date: 2017/12/5
  Time: 21:06
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>登录安全管理系统</title>
    <%--<link href="css/bootstrap.min.css" rel="stylesheet" />--%>
    <link rel="stylesheet" href="../css/login/bootstrap.min.css" />
    
    <%--<link rel="stylesheet" href="css/googleapi.css" />--%>
    <link rel="stylesheet" href="../css/login/ace.min.css" />
    <link rel="stylesheet" href="../css/login/ace-rtl.min.css" />
    <style type="text/css">
        .bottom-center{
            padding-bottom: 10%;
        }
    </style>
</head>
<body class="login-layout">
<div class="main-container">
    <div class="main-content">
        <div class="row">
            <div class="col-sm-12 bottom-center"></div>
        </div>
        <div class="row">
            <div class="col-sm-10 col-sm-offset-1">
                <div class="login-container">
                    
                    <div class="space-6"></div>
                    <div class="position-relative">
                        <div id="login-box" class="login-box visible widget-box no-border">
                            <div class="widget-body">
                                <div class="widget-main">
                                    <h4 class="header blue lighter bigger">
                                        <i class="ace-icon glyphicon glyphicon-folder-open green"></i>
                                        安全管理系统
                                    </h4>
                                    
                                    <div class="space-6"></div>
                                    
                                    <form id="loginform" action="check.htm" method="post">
                                        <fieldset>
                                            <%
                                                int err = 0;
                                                if( request.getParameter("err") != null){
                                                    err = Integer.parseInt(request.getParameter("err"));
                                            %>
                                            <%
                                                }
                                            %>
                                            <div <%if(err > 0){out.print("class=\"has-error\"");} %>>
                                                <label class="block clearfix">
                                                    <span class="block input-icon input-icon-right">
                                                    <input type="text" class="form-control" id="username" name="mail" placeholder="邮箱" />
                                                    <i class="ace-icon glyphicon glyphicon-user"></i>
                                                    </span>
                                                </label>
                                            </div>
                                            <div <%if(err > 0){out.print("class=\"has-error\"");} %>>
                                                <label class="block clearfix">
                                                    <span class="block input-icon input-icon-right">
                                                        <input type="password" class="form-control" id="password" name="password" placeholder="密码" />
                                                        <i class="ace-icon glyphicon glyphicon-lock"></i>
                                                        <%
                                                            if(err == 1){
                                                                out.print("<span class=\"help-block\"><i class=\"icon-remove-sign\"></i>用户名或密码错误</span>");
                                                            }else if(err == 2){
                                                                out.print("<span class=\"help-block\"><i class=\"icon-remove-sign\"></i>会话已过期</span>");
                                                            }
                                                        %>
                                                    </span>
                                                </label>
                                            </div>
                                            <!--
                                                <input type="hidden" name="token" vlaue="${token}"/>
                                            -->
                                            <div class="clearfix">
                                                <label class="inline">
                                                    <input type="checkbox" class="ace" />
                                                    <span class="lbl">记住我</span>
                                                </label>
                                                
                                                <button type="button" class="width-35 pull-right btn btn-sm btn-primary" id="login_button" onclick="javascript:submitForm();">
                                                    登录
                                                </button>
                                            </div>
                                            
                                            <div class="space-4"></div>
                                        </fieldset>
                                    </form>
                                    
                                    <div class="social-or-login center">
                                    
                                    </div>
                                
                                </div><!-- /widget-main -->
                                
                                <div class="toolbar clearfix">
                                    <div>
                                        <a href="#" onclick="show_box('forgot-box'); return false;" class="forgot-password-link">
                                            <i class="ace-icon glyphicon glyphicon-arrow-left"></i>
                                            忘记密码
                                        </a>
                                    </div>
                                    
                                    <div>
                                        <a href="#" onclick="show_box('signup-box'); return false;" class="user-signup-link">
                                            注册账号
                                            <i class="glyphicon glyphicon-arrow-right"></i>
                                        </a>
                                    </div>
                                </div>
                            </div><!-- /widget-body -->
                        </div><!-- /login-box -->
                        
                        <div id="forgot-box" class="forgot-box widget-box no-border">
                            <div class="widget-body">
                                <div class="widget-main">
                                    <h4 class="header red lighter bigger">
                                        <i class="ace-icon glyphicon glyphicon-cloud-download"></i>
                                        找回密码
                                    </h4>
                                    <div class="space-6"></div>
                                    <p>
                                        输入邮箱后，发送找回密码邮件
                                    </p>
                                    
                                    <form>
                                        <fieldset>
                                            <label class="block clearfix">
                                                <span class="block input-icon input-icon-right">
                                                    <input type="email" class="form-control" placeholder="Email" />
                                                    <span class="ace-icon glyphicon glyphicon-envelope"></span>
                                                </span>
                                            </label>
                                            
                                            <div class="clearfix">
                                                <button type="button" class="width-35 pull-right btn btn-sm btn-danger">
                                                    <i class="ace-icon glyphicon glyphicon-send"></i>
                                                    找回
                                                </button>
                                            </div>
                                        </fieldset>
                                    </form>
                                </div><!-- /widget-main -->
                                
                                <div class="toolbar center">
                                    <a href="#" onclick="show_box('login-box'); return false;" class="back-to-login-link">
                                        返回登录页
                                        <i class="ace-icon glyphicon glyphicon-arrow-right"></i>
                                    </a>
                                </div>
                            </div><!-- /widget-body -->
                        </div><!-- /forgot-box -->
                        
                        <div id="signup-box" class="signup-box widget-box no-border">
                            <div class="widget-body">
                                <div class="widget-main">
                                    <h4 class="header green lighter bigger">
                                        <i class="ace-icon glyphicon glyphicon-user blue"></i>
                                        注册新用户
                                    </h4>
                                    
                                    <div class="space-6"></div>
                                    <p> 请按要求输入信息 </p>
                                    
                                    <form>
                                        <fieldset>
                                            <label class="block clearfix">
                                                <span class="block input-icon input-icon-right">
                                                    <input type="email" class="form-control" placeholder="Email" />
                                                    <i class="ace-icon glyphicon glyphicon-envelope"></i>
                                                </span>
                                            </label>
                                            
                                            <label class="block clearfix">
                                                <span class="block input-icon input-icon-right">
                                                    <input type="text" class="form-control" placeholder="Username" />
                                                    <i class="ace-icon glyphicon glyphicon-user"></i>
                                                </span>
                                            </label>
                                            
                                            <label class="block clearfix">
                                                <span class="block input-icon input-icon-right">
                                                    <input type="password" class="form-control" placeholder="Password" />
                                                    <i class="ace-icon glyphicon glyphicon-lock"></i>
                                                </span>
                                            </label>
                                            
                                            <label class="block clearfix">
                                                <span class="block input-icon input-icon-right">
                                                    <input type="password" class="form-control" placeholder="Repeat password" />
                                                    <i class="ace-icon glyphicon glyphicon-retweet"></i>
                                                </span>
                                            </label>
                                            
                                            <label class="block">
                                                <input type="checkbox" class="ace" />
                                                <span class="lbl">
                                                我接受<a href="#">用户协议</a>
                                                </span>
                                            </label>
                                            
                                            <div class="space-24"></div>
                                            
                                            <div class="clearfix">
                                                <button type="reset" class="width-30 pull-left btn btn-sm">
                                                    <i class="ace-icon glyphicon glyphicon-refresh"></i>
                                                    重置
                                                </button>
                                                
                                                <button type="button" class="width-65 pull-right btn btn-sm btn-success">
                                                    注册
                                                    <i class="ace-icon glyphicon glyphicon-arrow-right icon-on-right"></i>
                                                </button>
                                            </div>
                                        </fieldset>
                                    </form>
                                </div>
                                
                                <div class="toolbar center">
                                    <a href="#" onclick="show_box('login-box'); return false;" class="back-to-login-link">
                                        <i class="ace-icon glyphicon glyphicon-arrow-left"></i>
                                        返回登录页
                                    </a>
                                </div>
                            </div><!-- /widget-body -->
                        </div><!-- /signup-box -->
                    </div><!-- /position-relative -->
                </div>
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div>
</div><!-- /.main-container -->

<script src="../js/jquery-1.8.3.min.js"></script>
<!--
<script type="text/javascript">
    window.jQuery || document.write("<script src='js/jquery-3.2.1.min.js'>"+"<"+"/script>");
</script>
-->
<script type="text/javascript">
    document.onkeydown = function(e){
        if(!e){
            e = window.event;
        }
        if(event.keyCode == 13){
            document.getElementById("login_button").click();
            return false;
        }
    }

    function show_box(id) {
        jQuery('.widget-box.visible').removeClass('visible');
        jQuery('#'+id).addClass('visible');
    }
</script>
<script src="../js/jquery.md5.js"></script>
<script type="text/javascript">
    function submitForm(){
        $("#password")[0].value = $.md5($("#password")[0].value);
        $("#loginform")[0].submit();
    }
</script>
</body>
</html>
