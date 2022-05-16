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
        <title>添加数据</title>
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" href="css/header.css"/>
        <link rel="stylesheet" href="css/bootstrap-reset.css"/>
        <link rel="stylesheet" href="css/font-awesome/font-awesome.css" />
        <link rel="stylesheet" href="css/style.css"/>
        <link rel="stylesheet" href="css/my.css"/>
        <link rel="stylesheet" href="css/style-responsive.css"/>
        <link rel="stylesheet" href="css/toastr.min.css"/>
        <link rel="stylesheet" href="css/bootstrap-editable.css"/>
        <%--<link rel="stylesheet" href="css/date/bootstrap-datepicker.min.css" />--%>
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
                                添加公司数据详情
                            </header>
                            <div class="panel-body">
                                <form class="form-horizontal" method="post" id="data-id">
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label">数据名称</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="data-name" v-model="dataVul.name" placeholder="数据名称">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label">数据简介</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="data-profiles" v-model="dataVul.profiles" placeholder="数据简介">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label">部门名称</label>
                                        <div class="col-sm-4">
                                            <%--<input type="text" class="form-control" id="data-department" v-model="dataVul.department" placeholder="部门名称">--%>
                                            <select id="data-department" class="form-control" v-model="dataVul.department">
                                                <option value="0" selected="selected"></option>
                                                <option v-for="departmentItem in departmenList" :value="departmenItem.id">{{departmenItem.name}}</option>
                                            </select>
                                        </div>
                                        <label class="col-sm-1 control-label">组名/团队</label>
                                        <div class="col-sm-4">
                                            <input type="text" class="form-control" id="data-sub-department" v-model="dataVul.subDepartment" placeholder="组名/团队">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label">生&nbsp;成&nbsp;员</label>
                                        <div class="col-sm-4">
                                            <input type="text" class="form-control" id="data-producers" v-model="dataVul.producers" placeholder="生成员">
                                        </div>
                                        <label class="col-sm-1 control-label">管&nbsp;理&nbsp;员</label>
                                        <div class="col-sm-4">
                                            <input type="text" class="form-control" id="data-admin" v-model="dataVul.admin" placeholder="管理员">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label">数据编号</label>
                                        <div class="col-sm-4">
                                            <input type="text" class="form-control" id="data-number" v-model="dataVul.number" placeholder="数据编号">
                                        </div>
                                        <label class="col-sm-1 control-label">分类分级</label>
                                        <div class="col-sm-4">
                                            <select id="data-already-cl" class="form-control" v-model="dataVul.alreadyCl">
                                                <option value="1" selected = "selected">是</option>
                                                <option value="2">否</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label">分&nbsp;&nbsp;&nbsp;&nbsp;类</label>
                                        <div class="col-sm-4">
                                            <input type="text" class="form-control" id="data-classification" v-model="dataVul.classification" placeholder="分类">
                                        </div>
                                        <label class="col-sm-1 control-label">分&nbsp;&nbsp;&nbsp;&nbsp;级</label>
                                        <div class="col-sm-4">
                                            <select id="data-level" class="form-control" v-model="dataVul.level">
                                                <option value="1">公开</option>
                                                <option value="2">内部</option>
                                                <option value="3">秘密</option>
                                                <option value="4">机密</option>
                                                <option value="5">绝密</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label">存储类型</label>
                                        <div class="col-sm-4">
                                            <select id="data-type" class="form-control" v-model="dataVul.type">
                                                <option value="1">电子文档</option>
                                                <option value="2">数据库</option>
                                                <option value="3">纸质文档</option>
                                                <option value="4">电子文档&数据库</option>
                                                <option value="5">电子文档&纸质文档</option>
                                                <option value="6">数据库&纸质文档</option>
                                                <option value="7">其他</option>
                                            </select>
                                        </div>
                                        <label class="col-sm-1 control-label">存储格式</label>
                                        <div class="col-sm-4">
                                            <input type="text" class="form-control" id="data-format" v-model="dataVul.format" placeholder="存储格式：如PDF、WORD等">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label">存储位置</label>
                                        <div class="col-sm-4">
                                            <input type="text" class="form-control" id="data-position" v-model="dataVul.position" placeholder="存储位置">
                                        </div>
                                        <label class="col-sm-1 control-label">安全方案</label>
                                        <div class="col-sm-4">
                                            <input type="text" class="form-control" id="data-security" v-model="dataVul.security" placeholder="安全方案">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label">安全措施</label>
                                        <div class="col-sm-4">
                                            <select id="data-security-ok" class="form-control" v-model="dataVul.securityOk">
                                                <option value="0" selected = "selected">未评估</option>
                                                <option value="1">合格</option>
                                                <option value="2">不合格</option>
                                            </select>
                                        </div>
                                        <label class="col-sm-1 control-label">状&nbsp;&nbsp;&nbsp;&nbsp;态</label>
                                        <div class="col-sm-4">
                                            <select id="data-status" class="form-control" v-model="dataVul.status">
                                                <option value="0">废弃</option>
                                                <option value="1">暂存</option>
                                                <option value="2">发布</option>
                                            </select>
                                        </div>
                                    </div>
                                    
                                    <%--<hr class="my-divider"></hr>--%>
                                    <div class="form-group">
                                        <%--<button type="button" class="d
                                        jiyufei1991!
                                        isabled col-sm-4 btn-sm btn-success text-left">数据流动</button>--%>
                                        <span class="col-sm-5 label label-primary"><div class="text-left size-15">数据流动</div></span>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label">部门内部</label>
                                        <div class="col-sm-2">
                                            <select id="data-is-dep-range" class="form-control" v-model="dataVul.isDepRange">
                                                <option value="1">是</option>
                                                <option value="2" selected = "selected">否</option>
                                            </select>
                                        </div>
                                        <label class="col-sm-1 control-label">部门人员</label>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" id="data-dep-range" v-model="dataVul.depRange" placeholder="部门内流动涉及人员">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label"><span class="m-red bold">公司内部</span></label>
                                        <div class="col-sm-2">
                                            <select id="data-is-company-range" class="form-control" v-model="dataVul.isCompanyRange">
                                                <option value="1">是</option>
                                                <option value="2" selected = "selected">否</option>
                                            </select>
                                        </div>
                                        
                                    </div>
                                    <div class="form-group hidden" id="div-company-range">
                                        <label class="col-sm-1 control-label"><span class="m-red bold">公司内部详情</span></label>
                                        <div class="col-sm-9">
                                                 <thead>
                                                <tr>
                                                    <th>部门</th>
                                                    <th>人员</th>
                                                    <th>传输途径</th>
                                                    <th>用途</th>
                                                    <th>操作</th>
                                                </tr>
                                                </thead>
                                                <tbody id="table-company-range-body">
                                                    <tr>
                                                        <td>
                                                            <a href="#" data-type="text" data-url="" data-placeholder="部门"></a>
                                                        </td>
                                                        <td>
                                                            <a href="#" data-type="text" data-url="" data-placeholder="人员"></a>
                                                        </td>
                                                        <td>
                                                            <a href="#" data-type="text" data-url="" data-placeholder="传输途径"></a>
                                                        </td>
                                                        <td>
                                                            <a href="#" data-type="text" data-url="" data-placeholder="用途"></a>
                                                        </td>
                                                        <td>
                                                            <%--<button type="button" class="btn btn-danger btn-xs btn-del" title="删除"><i class="icon-remove"></i> </button>--%>
                                                            <button type="button" class="btn btn-success btn-xs btn-add" title="增加一行" onclick="addCompanyRangeLine();"><i class="icon-plus"></i> </button>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label"><span class="m-blue2 bold">公司外部</span></label>
                                        <div class="col-sm-2">
                                            <select id="data-is-society-range" class="form-control" v-model="dataVul.isSocietyRange">
                                                <option value="1">是</option>
                                                <option value="2" selected = "selected">否</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group hidden" id="div-society-range">
                                        <label class="col-sm-1 control-label"><span class="m-blue2 bold">公司外部详情</span></label>
                                        <div class="col-sm-9">
                                            <table class="table table-striped table-hover table-bordered" id="table-society-range">
                                                <thead>
                                                <tr>
                                                    <th>外部公司名称</th>
                                                    <th>人员</th>
                                                    <th>职位</th>
                                                    <th>传输途径</th>
                                                    <th>用途</th>
                                                    <th>操作</th>
                                                </tr>
                                                </thead>
                                                <tbody id="table-society-range-body">
                                                <tr>
                                                    <td>
                                                        <a href="#" data-type="text" data-url="" data-placeholder="外部公司名称"></a>
                                                    </td>
                                                    <td>
                                                        <a href="#" data-type="text" data-url="" data-placeholder="人员"></a>
                                                    </td>
                                                    <td>
                                                        <a href="#" data-type="text" data-url="" data-placeholder="职位"></a>
                                                    </td>
                                                    <td>
                                                        <a href="#" data-type="text" data-url="" data-placeholder="传输途径"></a>
                                                    </td>
                                                    <td>
                                                        <a href="#" data-type="text" data-url="" data-placeholder="用途"></a>
                                                    </td>
                                                    <td>
                                                        <%--<button type="button" class="btn btn-danger btn-xs btn-del" title="删除"><i class="icon-remove"></i> </button>--%>
                                                        <button type="button" class="btn btn-success btn-xs btn-add" title="增加一行" onclick="addSocietyRangeLine();"><i class="icon-plus"></i> </button>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    
                                    
                                    <div class="form-group">
                                        <div class="col-md-offset-1 col-sm-3">
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
        <script src="js/bootstrap-editable.min.js"></script>
        <script src="ueditor/ueditor.config.js"></script>
        <script src="ueditor/ueditor.all.min.js"></script>
        <%--<script src="js/date/bootstrap-datepicker.min.js"></script>
        <script src="js/date/bootstrap-datepicker.zh-CN.min.js"></script>--%>
        
        
        <script>
            function setActive(){
                $("#nav-data").addClass("active");
                $("#add-data").addClass("active");
            }
            setActive();
            
            
            function addCompanyRangeLine(){
                /*
                $("#table-company-range-body").on('click', '.btn-add', function() {
                    $(this).closest('tr').after("<tr>\n" +
                        "<td><a href=\"#\" data-type=\"text\" data-url=\"\" data-placeholder=\"部门\"></a></td>\n" +
                        "<td><a href=\"#\" data-type=\"text\" data-url=\"\" data-placeholder=\"人员\"></a></td>\n" +
                        "<td><a href=\"#\" data-type=\"text\" data-url=\"\" data-placeholder=\"传输途径\"></a></td>\n" +
                        "<td><a href=\"#\" data-type=\"text\" data-url=\"\" data-placeholder=\"用途\"></a></td>\n" +
                        "<td><button type=\"button\" class=\"btn btn-success btn-xs btn-add\" title=\"增加一行\" onclick=\"addCompanyRangeLine();\"><i class=\"icon-plus\"></i> </button>\n" +
                        "<button type=\"button\" class=\"btn btn-danger btn-xs btn-del\" title=\"删除\"><i class=\"icon-remove\"></i> </button></td>\n" +
                        "</tr>");
                });
                */
                
                $("#table-company-range-body").append("<tr>\n" +
                    "<td><a href=\"#\" data-type=\"text\" data-url=\"\" data-placeholder=\"部门\"></a></td>\n" +
                    "<td><a href=\"#\" data-type=\"text\" data-url=\"\" data-placeholder=\"人员\"></a></td>\n" +
                    "<td><a href=\"#\" data-type=\"text\" data-url=\"\" data-placeholder=\"传输途径\"></a></td>\n" +
                    "<td><a href=\"#\" data-type=\"text\" data-url=\"\" data-placeholder=\"用途\"></a></td>\n" +
                    "<td><button type=\"button\" class=\"btn btn-success btn-xs btn-add\" title=\"增加一行\" onclick=\"addCompanyRangeLine();\"><i class=\"icon-plus\"></i> </button>\n" +
                    "<button type=\"button\" class=\"btn btn-danger btn-xs btn-del\" title=\"删除\"><i class=\"icon-remove\"></i> </button></td>\n" +
                    "</tr>");
                
                $('#table-company-range-body a').editable();
            }

            function addSocietyRangeLine(){
                $("#table-society-range-body").append("<tr>\n" +
                    "<td><a href=\"#\" data-type=\"text\" data-url=\"\" data-placeholder=\"外部公司名称\"></a></td>\n" +
                    "<td><a href=\"#\" data-type=\"text\" data-url=\"\" data-placeholder=\"人员\"></a></td>\n" +
                    "<td><a href=\"#\" data-type=\"text\" data-url=\"\" data-placeholder=\"职位\"></a></td>\n" +
                    "<td><a href=\"#\" data-type=\"text\" data-url=\"\" data-placeholder=\"传输途径\"></a></td>\n" +
                    "<td><a href=\"#\" data-type=\"text\" data-url=\"\" data-placeholder=\"用途\"></a></td>\n" +
                    "<td><button type=\"button\" class=\"btn btn-success btn-xs btn-add\" title=\"增加一行\" onclick=\"addSocietyRangeLine();\"><i class=\"icon-plus\"></i> </button>\n" +
                    "<button type=\"button\" class=\"btn btn-danger btn-xs btn-del\" title=\"删除\"><i class=\"icon-remove\"></i> </button>\n" +
                    "</td></tr>");

                $('#table-society-range-body a').editable();
            }
            
            
            $(document).ready(function() {
                $.fn.editable.defaults.mode = 'popup';
                //$('#department').editable();
                $('#table-company-range-body a').editable();
                $("#table-company-range-body").on('click', '.btn-del', function () {
                    $(this).closest('tr').remove();
                });

                $("#data-is-company-range").change(function(){

                    if($("#data-is-company-range option:selected").val() === "1"){
                        if($("#div-company-range").hasClass("hidden")){
                            $("#div-company-range").removeClass("hidden");
                        }
                    }
                    if($("#data-is-company-range option:selected").val() === "2"){
                        if(!$("#div-company-range").hasClass("hidden")){
                            $("#div-company-range").addClass("hidden");
                        }
                    }
                });
                $("#data-is-society-range").change(function(){

                    if($("#data-is-society-range option:selected").val() === "1"){
                        if($("#div-society-range").hasClass("hidden")){
                            $("#div-society-range").removeClass("hidden");
                        }
                    }
                    if($("#data-is-society-range option:selected").val() === "2"){
                        if(!$("#div-society-range").hasClass("hidden")){
                            $("#div-society-range").addClass("hidden");
                        }
                    }
                });

                $('#table-society-range-body a').editable();
                $("#table-society-range-body").on('click', '.btn-del', function () {
                    $(this).closest('tr').remove();
                });
            });
            /*
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
            */

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