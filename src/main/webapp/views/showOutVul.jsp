<%--
  Created by IntelliJ IDEA.
  User: jiyufei
  Date: 2021/01/12
  Time: 14:08
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>外部漏洞详情</title>
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" href="css/header.css"/>
        <link rel="stylesheet" href="css/bootstrap-reset.css"/>
        <link rel="stylesheet" href="css/font-awesome/font-awesome.css" />
        <link rel="stylesheet" href="css/style.css"/>
        <link rel="stylesheet" href="css/my.css"/>
        <link rel="stylesheet" href="css/style-responsive.css"/>
        <link rel="stylesheet" href="css/toastr.min.css"/>
    </head>
    <body>
        <%@ include file="./header.jsp" %>
        <%@ include file="./nav.jsp" %>
        <section id="main-content" >
            <section class="wrapper site-min-height">
                
                <div class="row">
                    <div class="col-sm-12">
                        <section class="panel">
                            <header class="panel-heading m-red bold">
                                外部漏洞详情
                            </header>
                            <div class="panel-body">
                                <div  id="ov-show" class="hidden">
                                    <input type="hidden" id="id" value="${id}"/>
                                    
                                    <div class="row">
                                        <div class="col-sm-offset-1 col-sm-10 text-center">
                                            <span class="size-25 bold">{{myOV.title}}</span>
                                        </div>
                                    </div>
                                    <br/>
                                    <div class="row">
                                        <%--<label class="col-sm-offset-1 col-sm-1 control-label">漏洞类型</label>--%>
                                        <label class="col-sm-offset-1 label control-label label-inverse col-sm-2" id="ov-vul-type">漏洞类型：{{myOV.vulTypeStr}}</label>
                                        <label class="col-sm-1 control-label">CVE编号</label>
                                        <label class="label control-label label-success col-sm-2" id="ov-cve">{{myOV.cve}}</label>
                                        <label class="col-sm-1 control-label">风险等级</label>
                                        <template v-if="myOV.risk === 1">
                                            <label class="label control-label label-primary col-sm-1">低风险</label>
                                        </template>
                                        <template v-else-if="myOV.risk === 2">
                                            <label class="label control-label label-info col-sm-1">中风险</label>
                                        </template>
                                        <template v-else-if="myOV.risk === 3">
                                            <label class="label control-label label-warning col-sm-1">高风险</label>
                                        </template>
                                        <template v-else-if="myOV.risk === 4">
                                            <label class="label control-label label-danger col-sm-1">严重风险</label>
                                        </template>
                                        <template v-else>
                                            <label class="label control-label label-default col-sm-1">错误</label>
                                        </template>
                                        <label class="col-sm-1 control-label">漏洞状态</label>
                                        <template v-if="myOV.status === 0">
                                            <label class="label control-label label-default col-sm-1">废弃</label>
                                        </template>
                                        <template v-else-if="myOV.status === 1">
                                            <label class="label control-label label-primary col-sm-1">暂存</label>
                                        </template>
                                        <template v-else-if="myOV.status === 2">
                                            <label class="label control-label label-success col-sm-1">发布</label>
                                        </template>
                                        
                                    </div>
                                        
                                    <br/>
                                    <div class="row">
                                        <label class="col-sm-1 control-label">影响范围</label>
                                        <div class="col-sm-10">
                                            <textarea id="ov-affect"></textarea>
                                        </div>
                                    </div>
                                    <br/>
                                    
                                    <div class="row">
                                        <label class="col-sm-1 control-label">漏洞详情</label>
                                        <div class="col-sm-10">
                                            <textarea id="ov-content"></textarea>
                                        </div>
                                    </div>
                                    <br/>
                                    
                                    <div class="row">
                                        <label class="col-sm-1 control-label">修复方案</label>
                                        <div class="col-sm-10">
                                            <textarea id="ov-fix"></textarea>
                                        </div>
                                    </div>
                                    <br/>
                                    <div class="row">
                                        <div class="col-sm-offset-1 col-sm-3">
                                            <button type="button" class="btn btn-primary col-sm-5" onclick="editOutVul();"><i class="icon-pencil"></i>&nbsp;修改订单</button>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
                
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title">提示</h4>
                            </div>
                            <div class="modal-body" id="my-modal-body">
    
                                <h4><i class="icon-info"></i></h4>
                
                            </div>
                            <div class="modal-footer">
                                <button data-dismiss="modal" class="btn btn-success" type="button" onclick="">确定</button>
                            </div>
                        </div>
                    </div>
                </div>
                
            </section>
        </section>

        <script src="js/jquery-1.8.3.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.scrollTo.min.js"></script>
        <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
        <script src="js/common-scripts.js"></script>
        <script src="js/jquery.dcjqaccordion.2.7.js"></script>
        <script src="js/vue.min.js"></script>
        <script src="js/toastr.min.js"></script>
        <script src="js/toastr.config.js"></script>
        <script src="ueditor/ueditor.config.js"></script>
        <script src="ueditor/ueditor.all.min.js"></script>
        
        <script>
            function setActive(){
                $("#nav-out-vul").addClass("active");
            }
            setActive();

            
            $(document).ready(function () {
                ue_affect = UE.getEditor("ov-affect",{
                    toolbars: [
                        ['fullscreen', 'source']
                    ],
                    initialFrameHeight: 400,
                    autoHeightEnabled: true,
                    readonly:true
                });

                ue_content = UE.getEditor("ov-content",{
                    toolbars: [
                        ['fullscreen', 'source']
                    ],
                    /*initialFrameHeight: 400,*/
                    autoHeightEnabled: true,
                    readonly:true
                });

                ue_fix = UE.getEditor("ov-fix",{
                    toolbars: [
                        ['fullscreen', 'source']
                    ],
                   /* initialFrameHeight: 400,*/
                    autoHeightEnabled: true,
                    readonly:true
                });
                
                id = parseInt($("#id").val());
                if(isNaN(id) || id < 1){
                    $(".modal-body i").text("&nbsp;&nbsp;必须指定查看的外部漏洞ID！");
                    $("#myModal").modal('show');
                }else{
                    $.ajax({
                        type:"POST",
                        url:"getOutVulById.ad",
                        dataType:"json",
                        data:{
                            'id':id
                        },
                        error:function(XMLHttpRequest, textStatus, errorThrown){
                            $(".modal-body i").text("&nbsp;&nbsp;网络出错！请求失败");
                            $("#myModal").modal('show');
                        },
                        success:function(res){
                            if(res.code === 1202){
                                $("#my-modal-body i").text(res.msg);
                                $("#myModal").modal('show');
                            }else if(res.code !==  0){
                                $("#my-modal-body i").text("&nbsp;&nbsp;查询外部漏洞失败！" + res.msg);
                                $("#myModal").modal('show');
                            }else{
                                outVulVue = new Vue({
                                    el:'#ov-show',
                                    data:{
                                        myOV:res.content
                                    }
                                });
                                ue_affect.ready(function () {
                                    ue_affect.setContent(res.content.affect);
                                });
                                ue_content.ready(function () {
                                    ue_content.setContent(res.content.content);
                                });
                                ue_fix.ready(function () {
                                    ue_fix.setContent(res.content.fix);
                                });
                                if($("#ov-show").hasClass("hidden")){
                                    $("#ov-show").removeClass("hidden");
                                }
                            }
                        }
                    });
                }
            });
            
            function editOutVul(){
                window.location.href='editOutVul.htm?id=' + id;
            }
            
        </script>
    
    </body>
</html>