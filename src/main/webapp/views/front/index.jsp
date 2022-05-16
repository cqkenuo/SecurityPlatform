<%--
  Created by IntelliJ IDEA.
  User: jiyufei
  Date: 2017/12/6
  Time: 10:33
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>首页</title>
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" href="css/header.css"/>
        <link rel="stylesheet" href="css/bootstrap-reset.css"/>
        <link rel="stylesheet" href="css/font-awesome/font-awesome.css" />
        <link rel="stylesheet" href="css/style.css"/>
        <link rel="stylesheet" href="css/my.css"/>
        <link rel="stylesheet" href="css/style-responsive.css"/>
        <link rel="stylesheet" href="css/toastr.min.css"/>
        
    </head>
    <body class="full-width">
    
        <section id="container">
            
            <%@ include file="header.jsp" %>
            <section id="main-content">
                <section class="wrapper">
                    <div class="row">
                        <div class="col-sm-offset-2 col-sm-8">
                            <div class="row state-overview">
                                <div class="col-sm-3">
                                    <section class="panel">
                                        <div class="symbol red">
                                            <i class="icon-file-text"></i>
                                        </div>
                                        <div class="value">
                                            <h1 class="count">
                                                0
                                            </h1>
                                            <p>安全文章数</p>
                                        </div>
                                    </section>
                                </div>
                                <div class="col-sm-3">
                                    <section class="panel">
                                        <div class="symbol terques">
                                            <i class="icon-globe"></i>
                                        </div>
                                        <div class="value">
                                            <h1 class="count2">
                                                0
                                            </h1>
                                            <p>漏洞情报数</p>
                                        </div>
                                    </section>
                                </div>
                                <div class="col-sm-3">
                                    <section class="panel">
                                        <div class="symbol blue">
                                            <i class="icon-shield"></i>
                                        </div>
                                        <div class="value">
                                            <h1 class="count3">
                                                0
                                            </h1>
                                            <p>公司漏洞数</p>
                                        </div>
                                    </section>
                                </div>
                                <div class="col-sm-3">
                                    <section class="panel">
                                        <div class="symbol yellow">
                                            <i class="icon-medkit"></i>
                                        </div>
                                        <div class="value">
                                            <h1 class="count4">
                                                0
                                            </h1>
                                            <p>漏洞修复方案</p>
                                        </div>
                                    </section>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-9">
                                    <section class="panel">
                                        <header class="panel-heading">
                                            外部漏洞情报
                                        </header>
                                        <div class="panel-body">
                                            <div class="hidden" id="index-out-vul">
                                                <template v-for="item in myOutVul">
                                                    <div class="m-classic-search">
                                                        <h4><a v-bind:href="'showOutVul.htm?id=' + item.id">{{item.title}}</a></h4>
                                                        <p>
                                                            <button type="button" class="btn btn-info btn-xs">{{item.vulType}}</button>&nbsp;&nbsp;&nbsp;&nbsp;
                                                            <button type="button" class="btn btn-primary btn-xs">{{item.cve}}</button>&nbsp;&nbsp;&nbsp;&nbsp;
                                                            <button type="button" class="btn btn-info btn-xs">{{item.risk}}</button>&nbsp;&nbsp;&nbsp;&nbsp;
                                                            <button type="button" class="btn btn-danger btn-xs">{{item.showTime}}</button>
                                                        </p>
                                                    </div>
                                                </template>
                                            </div>
                                        </div>
                                    </section>
                                    <section class="panel">
                                        <header class="panel-heading" >
                                            内部漏洞公示
                                            <span class="tools pull-right">
                                                <a href="">查看更多</a>
                                            </span>
                                        </header>
                                        <div class="panel-body">
                                            <table class="table table-striped" id="index-in-vul">
                                                <thead>
                                                <tr>
                                                    <th>标题</th>
                                                    <th>编号</th>
                                                    <th>漏洞类型</th>
                                                    <th>风险等级</th>
                                                    <%--<th>点击量</th>--%>
                                                    <th>状态</th>
                                                    <th>部门</th>
                                                    <th>创建时间</th>
                                                </tr>
                                                </thead>
                                                <tbody id="table-body">
                                                <template v-for="item in myInVul">
                                                    <tr>
                                                        <td><a v-bind:href="'showInVul.htm?id=' + item.id" target="_blank">{{item.title}}</a></td>
                                                        <td>{{item.cve}}</td>
                                                        <td>{{item.vulType}}</td>
                                                        <td v-if="item.risk === 1"><button type="button" class="btn btn-primary btn-xs">低</button></td>
                                                        <td v-else-if="item.risk === 2"><button type="button" class="btn btn-info btn-xs">中</button></td>
                                                        <td v-else-if="item.risk === 3"><button type="button" class="btn btn-warning btn-xs">高</button></td>
                                                        <td v-else-if="item.risk === 4"><button type="button" class="btn btn-danger btn-xs">严重</button></td>
                                                        <td v-else><button type="button" class="btn btn-default btn-xs">-</button></td>
                                                        <%--<td>{{item.num}}</td>--%>
                                                        <td><button type="button" class="btn btn-success btn-xs">{{item.status}}</button></td>
                                                        <td>{{item.department}}</td>
                                                        <td>{{item.createTime}}</td>
                                                    </tr>
                                                </template>
                                                </tbody>
                                            </table>
                                        </div>
                                    </section>
                                
                                </div>
                                <div class="col-sm-3">
                                    <section class="panel">
                                        <header class="panel-heading">
                                            知识库
                                        </header>
                                        <div class="list-group">
                                            <a class="list-group-item " href="javascript:;">
                                                <h4 class="list-group-item-heading">.一句话.的艺术——简单的编码和变形绕过检测</h4>
                                                <p class="list-group-item-text">一句话木马</p>
                                            </a>
                                            <a class="list-group-item" href="javascript:;">
                                                <h4 class="list-group-item-heading">CSRF简单介绍及利用方法</h4>
                                                <p class="list-group-item-text">CSRF</p>
                                            </a>
                                            <a class="list-group-item" href="javascript:;">
                                                <h4 class="list-group-item-heading">CVE-2015-5090漏洞利用</h4>
                                                <p class="list-group-item-text">CVE-2015-5090</p>
                                            </a>
                                        </div>
                                    </section>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </section>
            </section>
            
        </section>
        
        <script src="js/jquery-1.8.3.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.scrollTo.min.js"></script>
        <%--<script src="js/jquery.nicescroll.js" type="text/javascript"></script>--%>
        <script src="js/common-scripts.js"></script>
        <script src="js/jquery.dcjqaccordion.2.7.js"></script>
        <script src="js/vue.min.js"></script>
        <script src="js/toastr.min.js"></script>
        <script src="js/toastr.config.js"></script>
        <script src="js/base64.min.js"></script>
        <script src="js/count.js"></script>
        
        <script>
            /*
            $('#search_title').bind('keyup', function(event) {
                if (event.keyCode == "13") {
                    //window.location.href='search.htm?title=' + Base64.encode($("#search_title").val());
                    //window.location.href='search.htm?title=' + $("#search_title").val();
                    if($("#search_title").val() == ""){
                        window.location.href='search.htm';
                    }else{
                        window.location.href='search2.htm?title=' + Base64.encode($("#search_title").val());
                    }
                    
                    //console.log(Base64.encode($("#search_title").val()))
                }
            });
            */

            //initOutVul = {"id":0,"title":"","vulType":"","cve":null,"risk":"","hits":0,"createdBy":"","status":0,"createTime":"2019-01-01 00:00:00"};
            
            function getAllOutVul(){
                $.ajax({
                    type:'post',
                    url:'getAllOutVul.json',
                    data:{
                        "pageNum":1,
                        "pageSize":10
                    },
                    success:function(result){
                        if(result.code === 1006){
                            toastr["info"]("外部漏洞情报" + result.msg);
                        }else if(result.code !== 0){
                            toastr["error"]("读取外部漏洞数据失败！" + result.msg);
                        }else{
                            outVul = result.content;
                            if(typeof outVulVue === 'undefined'){
                                outVulVue = new Vue({
                                    el:'#index-out-vul',
                                    data:{
                                        myOutVul:outVul
                                    }
                                });
                            }else{
                                len = outVulVue.myOutVul.length;
                                outVulVue.myOutVul.splice(0,len);
                                for(var i=0;i<outVul.length;i++){
                                    outVulVue.myOutVul.push(outVul[i]);
                                }
                            }
                            if($("#index-out-vul").hasClass("hidden")){
                                $("#index-out-vul").removeClass("hidden");
                            }
                            
                        }
                    }
                });
            }

            function getAllInVul(){
                $.ajax({
                    type:'post',
                    url:'getAllInVul.json',
                    data:{
                        "pageNum":1,
                        "pageSize":10
                    },
                    success:function(result){
                        if(result.code === 1006){
                            toastr["info"]("内部漏洞" + result.msg);
                        }else if(result.code !== 0){
                            toastr["error"]("读取内部漏洞数据失败！" + result.msg);
                        }else{
                            inVul = result.content;
                            if(typeof inVulVue === 'undefined'){
                                inVulVue = new Vue({
                                    el:'#index-in-vul',
                                    data:{
                                        myInVul:inVul
                                    }
                                });
                            }else{
                                len = inVulVue.myInVul.length;
                                inVulVue.myInVul.splice(0,len);
                                for(var i=0;i<inVul.length;i++){
                                    inVulVue.myInVul.push(inVul[i]);
                                }
                            }
                            if($("#index-in-vul").hasClass("hidden")){
                                $("#index-in-vul").removeClass("hidden");
                            }

                        }
                    }
                });
            }
            
            
            $(document).ready(function(){
                getAllOutVul();
                getAllInVul();
            });
            
            
            
            
        </script>
    
    </body>
</html>