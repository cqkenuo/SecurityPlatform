<%--
  Created by IntelliJ IDEA.
  User: jiyufei
  Date: 2017/12/6
  Time: 10:25
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8"%>
<header class="header white-bg">
    <a href="adminIndex.htm" class="logo"><img  alt="" class="ace-icon header-img" src="img/logo_t1.png" />&nbsp;<span>XXXX</span>安全管理平台</a>
    <!--logo end-->
    <div class="top-nav">
        <!--search & user info start-->
        
        <ul class="nav pull-right top-menu">
            <!-- user login dropdown start-->
            <li class="dropdown">
                <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                    <img alt="" src="img/1.png" class="header-pic">
                    <span class="username"><%=session.getAttribute("realName")%></span>
                    <%--<span class="username">季玉飞</span>--%>
                    <b class="caret"></b>
                </a>
                <ul class="dropdown-menu extended logout">
                    <div class="log-arrow-up"></div>
                    <li><a href="#"><i class=" icon-user"></i>个人中心</a></li>
                    <li><a href="#"><i class="icon-cog"></i> 设置</a></li>
                    <li><a href="logout.htm"><i class="icon-off"></i>注销</a></li>
                </ul>
            </li>
            <!-- user login dropdown end -->
        </ul>
        <!--search & user info end-->
    </div>
    
    <div class="nav notify-row" id="top_menu">
        <!--  notification start -->
        <ul class="nav top-menu">
            
            <!-- inbox dropdown start-->
            <li id="header_inbox_bar" class="dropdown">
                <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                    <i class="icon-envelope-alt"></i>
                    <span class="badge bg-important">2</span>
                </a>
                <ul class="dropdown-menu extended inbox">
                    <div class="notify-arrow notify-arrow-red"></div>
                    <li>
                        <p class="red">你有2条新消息</p>
                    </li>
                    <li>
                        <a href="#">
                            <span class="photo"><img alt="avatar" src="img/1.png" class="header-pic"></span>
                            <span class="subject">
                                <span class="from">系统消息</span>
                                <span class="time">10分钟前</span>
                            </span>
                            <span class="message">
                                测试消息
                            </span>
                        </a>
                    </li>

                    <li>
                        <a href="#">
                            <span class="photo"><img alt="avatar" src="img/1.png" class="header-pic"></span>
                            <span class="subject">
                                    <span class="from">系统消息</span>
                                    <span class="time">23分钟前</span>
                            </span>
                            <span class="message">
                                测试消息
                            </span>
                        </a>
                    </li>
                    <li>
                        <a href="#">查看所有消息</a>
                    </li>
                </ul>
            </li>
            <!-- inbox dropdown end -->
            <!-- notification dropdown start-->
            <li id="header_notification_bar" class="dropdown">
                <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                    
                    <i class="icon-bell-alt"></i>
                    <span class="badge bg-warning">3</span>
                </a>
                <ul class="dropdown-menu extended notification">
                    <div class="notify-arrow notify-arrow-yellow"></div>
                    <li>
                        <p class="yellow">你有4条注意事项</p>
                    </li>
                    
                    <li>
                        <a href="#">
                            <span class="label label-warning"><i class="icon-bell"></i></span>
                            测试消息
                            
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="label label-danger"><i class="icon-bolt"></i></span>
                            测试消息
                            
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="label label-success"><i class="icon-plus"></i></span>
                            测试消息
                            
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="label label-info"><i class="icon-bullhorn"></i></span>
                            测试消息
                            
                        </a>
                    </li>
                    <li>
                        <a href="#">查看所有注意事项</a>
                    </li>
                </ul>
            </li>
        </ul>
        
        <!--  notification end -->
    </div>
    
</header>