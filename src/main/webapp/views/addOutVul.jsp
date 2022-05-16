<%--
  Created by IntelliJ IDEA.
  User: jiyufei
  Date: 2021/01/04
  Time: 10:33
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>添加外部漏洞情报</title>
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" href="css/header.css"/>
        <link rel="stylesheet" href="css/bootstrap-reset.css"/>
        <link rel="stylesheet" href="css/font-awesome/font-awesome.css" />
        <link rel="stylesheet" href="css/style.css"/>
        <link rel="stylesheet" href="css/my.css"/>
        <link rel="stylesheet" href="css/style-responsive.css"/>
        <link rel="stylesheet" href="css/toastr.min.css"/>
        <link rel="stylesheet" href="css/date/bootstrap-datepicker.min.css" />
    </head>
    <body>
        <script src="js/vue.min.js"></script>
        <%@ include file="header.jsp" %>
        <%@ include file="nav.jsp" %>
        <section id="main-content" >
            <section class="wrapper site-min-height">
                
                <div class="row" id="all-add-sale">
                    <div class="col-sm-12">
                        <section class="panel">
                            <header class="panel-heading m-red bold">
                                添加外部漏洞情报
                            </header>
                            <div class="panel-body">
                                <form class="form-horizontal" method="post" id="ov-id">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">标题&nbsp;</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="ov-title" v-model="outVul.title" placeholder="标题">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">漏洞类型&nbsp;</label>
                                        <div class="col-sm-3">
                                            <select id="ov-vultype" class="form-control" v-model="outVul.vulType">
                                                <option value="0"></option>
                                                <option v-for="vulTypeItem in vulTypeList" :value="vulTypeItem.id">{{vulTypeItem.name}}</option>
                                            </select>
                                        </div>
                                        <label class="col-sm-2 control-label">CVE&nbsp;</label>
                                        <div class="col-sm-3">
                                            <input type="text" class="form-control" id="ov-cve" v-model="outVul.cve" placeholder="CVE">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">风险等级&nbsp;</label>
                                        <div class="col-sm-3">
                                            <select id="ov-risk" class="form-control" v-model="outVul.risk">
                                                <option value="1">低风险</option>
                                                <option value="2">中风险</option>
                                                <option value="3">高风险</option>
                                                <option value="4">严重风险</option>
                                            </select>
                                        </div>
                                        <label class="col-sm-2 control-label">漏洞状态&nbsp;</label>
                                        <div class="col-sm-3">
                                            <select id="ov-status" class="form-control" v-model="outVul.status">
                                                <option value="0">废弃</option>
                                                <option value="1">暂存</option>
                                                <option value="2">发布</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">影响范围</label>
                                        <div class="col-sm-8">
                                            <textarea id="ov-affect"></textarea>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">漏洞详情</label>
                                        <div class="col-sm-8">
                                            <textarea id="ov-content"></textarea>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">修复方案</label>
                                        <div class="col-sm-8">
                                            <textarea id="ov-fix"></textarea>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <div class="col-md-offset-2 col-sm-3">
                                            <button type="button" class="btn btn-primary col-sm-5" onclick="addOutVul();" id="button-add"><i class="icon-save"></i> 添加</button>
                                            <button type="button" class="btn btn-danger col-md-offset-1 col-sm-5" onclick="clearAll();"><i class="icon-trash"></i> 清空</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </section>
                    </div>
                </div>
    
                <div class="modal fade" id="myModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title">提示</h4>
                            </div>
                            <div class="modal-body">
                                <h4><i class="icon-info"></i></h4>
                            </div>
                            <div class="modal-footer">
                                <input type="hidden" value="" id="new-ov-id"/>
                                <button data-dismiss="modal" class="btn btn-success" data-dismiss="modal" type="button" onclick="goAdd();">继续添加</button>
                                <button data-dismiss="modal" class="btn btn-primary" data-dismiss="modal" type="button" onclick="showOutVul();">查看信息</button>
                                <button data-dismiss="modal" class="btn btn-info" data-dismiss="modal" type="button" onclick="myHidden();">完成添加</button>
                            </div>
                        </div>
                    </div>
                </div>
                
                
            </section>
        </section>
        
        <%--
        <script type="text/javascript">
            window.UEDITOR_HOME_URL = "/SecurityPlatform/ueditor/";
        </script>
        --%>
        
        <script src="js/jquery-1.8.3.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.scrollTo.min.js"></script>
        <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
        <script src="js/common-scripts.js"></script>
        <script src="js/toastr.min.js"></script>
        <script src="js/toastr.config.js"></script>
        <script src="js/jquery.dcjqaccordion.2.7.js"></script>
        <script src="ueditor/ueditor.config.js"></script>
        <script src="ueditor/ueditor.all.min.js"></script>
        <script src="js/date/bootstrap-datepicker.min.js"></script>
        <script src="js/date/bootstrap-datepicker.zh-CN.min.js"></script>
        
        
        <script>
            function setActive(){
                $("#nav-out-vul").addClass("active");
                $("#add-out-vul").addClass("active");
            }
            setActive();
            
            ue_affect = UE.getEditor("ov-affect",{
                autoHeightEnabled: true,
                initialFrameHeight: 400
            });
            ue_content = UE.getEditor("ov-content",{
                autoHeightEnabled: true,
                initialFrameHeight: 400
            });
            ue_fix = UE.getEditor("ov-fix",{
                autoHeightEnabled: true,
                initialFrameHeight: 400
            });


            $(document).ready(function () {
                
                getAllVulType();
            });


            function getAllVulType() {

                $.ajax({
                    type:"POST",
                    url:"getAllVulType.ad",
                    async: false,
                    data:{
                        'pageNum':1,
                        'pageSize':0
                    },
                    error:function(XMLHttpRequest, textStatus, errorThrown){
                        toastr["error"]("网络出错！请求失败！");
                    },
                    success:function(res){
                        if(res.code === 1006){
                            toastr["info"]("漏洞类型列表" + res.msg);
                        }else if(res.code !== 0){
                            toastr["error"]("查询漏洞类型列表出错！" + res.msg);
                        }else{
                            if(typeof(outVulVue) === 'undefined'){
                                outVulVue = new Vue({
                                    el:"#ov-id",
                                    data:{
                                        vulTypeList:res.content,
                                        outVul:{"title":null,"cve":null,"vulType":0,"risk":1,"affect":"","content":"","fix":"","status":2,"hot":0}
                                    }
                                });
                            }else{
                                outVulVue.vulTypeList = res.content;
                            }
                        }
                    }
                });
            }

            function clearAll(){
                outVulVue.outVul = {"title":"","cve":"","vul_type":0,"risk":1,"affect":"","content":"","fix":"","status":2,"hot":0};
                ue_affect.setContent("");
                ue_content.setContent("");
                ue_fix.setContent("");
            }
            
            function goAdd() {
                $("#myModal").modal('hide');
                clearAll();
            }
            
            function myHidden(){
                $("#button-add").addClass('disabled');
            }
            
            
            function addOutVul(){
                
                $.ajax({
                    type:"POST",
                    url:"addOutVul.ad",
                    data:{
                        "title":String(outVulVue.outVul.title),
                        "vulType":outVulVue.outVul.vulType,
                        "cve":String(outVulVue.outVul.cve),
                        "risk":outVulVue.outVul.risk,
                        "affect":String(ue_affect.getContent()),
                        "content":String(ue_content.getContent()),
                        "fix":String(ue_fix.getContent),
                        "status":outVulVue.outVul.status,
                        "hot":outVulVue.outVul.hot
                    },
                    error:function(XMLHttpRequest, textStatus, errorThrown){
                        toastr["error"]("网络出错！请求失败");
                    },
                    success:function(res){
                        if(res.code !== 0){
                            toastr["error"]("添加外部漏洞信息失败！原因:" + res.msg);
                        }else{
                            $(".modal-body i").html("&nbsp;&nbsp;添加外部漏洞信息成功！");
                            $('#new-ov-id').val(res.content);
                            $("#myModal").modal('show');

                        }
                    }
                });
            }

            function showOutVul(){
                /*
                id = $('#new-sale-id').val();
                window.location.href='showSale.htm?id=' + id;
                */
            }

            
        </script>
    
    </body>
</html>