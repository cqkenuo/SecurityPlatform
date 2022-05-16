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
    <title>外部漏洞情报列表</title>
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
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section id="main-content" >
    <section class="wrapper site-min-height">
        
        <div class="row">
            <div class="col-sm-12">
                <section class="panel">
                    <header class="panel-heading m-red bold">
                        外部漏洞情报
                    </header>
                    <div class="panel-body editable-table hidden" id="list-result">
                        
                        <input type="hidden" id="page-num" value="${pageNum}"/>
                        <table class="table table-striped" id="table-out-vul">
                            <thead>
                            <tr>
                                <th>序号</th>
                                <th>CVE</th>
                                <th>标题</th>
                                <th>漏洞类型</th>
                                <th>风险等级</th>
                                <%--<th>公司风险</th>--%>
                                <th>状态</th>
                                <th>发布时间</th>
                                <th>更新时间</th>
                            </tr>
                            </thead>
                            <tbody id="table-body">
                            <template v-for="item in myOutVul">
                                <tr>
                                    <td>{{item.id}}</td>
                                    <td>{{item.cve}}</td>
                                    <td><a v-bind:href="'showOutVul.htm?id=' + item.id" target="_blank">{{item.title}}</a></td>
                                    <td>{{item.vulTypeStr}}</td>
    
                                    <td v-if="item.risk === 1"><button type="button" class="btn btn-primary btn-xs">低</button></td>
                                    <td v-else-if="item.risk === 2"><button type="button" class="btn btn-info btn-xs">中</button></td>
                                    <td v-else-if="item.risk === 3"><button type="button" class="btn btn-warning btn-xs">高</button></td>
                                    <td v-else-if="item.risk === 4"><button type="button" class="btn btn-danger btn-xs">严重</button></td>
                                    <td v-else><button type="button" class="btn btn-default btn-xs">错误</button></td>
    
                                    <td v-if="item.status === 0"><button type="button" class="btn btn-default btn-xs">废弃</button></td>
                                    <td v-else-if="item.status === 1"><button type="button" class="btn btn-info btn-xs">暂存</button></td>
                                    <td v-else-if="item.status === 2"><button type="button" class="btn btn-success btn-xs">发布</button></td>
                                    <td v-else><button type="button" class="btn btn-danger btn-xs">错误</button></td>
                                    <td>{{item.showTime}}</td>
                                    <td>{{item.updateTime}}</td>
                                    
                                    <td>
                                        <button type="button" class="btn btn-success btn-xs" title="查看" :onclick="'javascript:getOutVulById(' + item.id + ');'"><i class="icon-search"></i> </button>
                                        <button type="button" class="btn btn-primary btn-xs" title="修改" :onclick="'javascript:editOutVulById(' + item.id + ');'"><i class="icon-pencil"></i> </button>
                                    </td>
                                </tr>
                            </template>
                            </tbody>
                        </table>
                        
                        <div class="row" id="pagination">
                            <div class="col-sm-2">
                                <span id="pagination-header">当前{{start}}-{{end}}条，共{{all}}条记录</span>
                            </div>
                            <div class="col-sm-offset-7 col-sm-3">
                                <ul class="pagination pagination-sm pull-right" id="pagination-body">
                                    <template v-if="myNum === 1">
                                        <li class="disabled"><a href="#">«</a></li>
                                        <li class="active"><a href="#">1</a></li>
                                        <li><a href="javascript:getAllOutVul(2)">2</a></li>
                                        <li><a href="javascript:getAllOutVul(3)">3</a></li>
                                        <li><a href="javascript:getAllOutVul(4)">4</a></li>
                                        <li><a href="javascript:getAllOutVul(5)">5</a></li>
                                        <li><a href="javascript:getAllOutVul(2)">»</a></li>
                                    </template>
                                    <template v-else-if="myNum === 2">
                                        <li><a href="javascript:getAllOutVul(1)">«</a></li>
                                        <li><a href="javascript:getAllOutVul(1)">1</a></li>
                                        <li class="active"><a href="#">2</a></li>
                                        <li><a href="javascript:getAllOutVul(3)">3</a></li>
                                        <li><a href="javascript:getAllOutVul(4)">4</a></li>
                                        <li><a href="javascript:getAllOutVul(5)">5</a></li>
                                        <li><a href="javascript:getAllOutVul(3)">»</a></li>
                                    </template>
                                    <template v-else>
                                        <li><a :href="'javascript:getAllOutVul(' + pageNumI1 + ')'">«</a></li>
                                        <li><a :href="'javascript:getAllOutVul('+ pageNumI2 + ')'">{{pageNumI2}}</a></li>
                                        <li><a :href="'javascript:getAllOutVul('+ pageNumI1 + ')'">{{pageNumI1}}</a></li>
                                        <li class="active"><a href="#">{{myNum}}</a></li>
                                        <li><a :href="'javascript:getAllOutVul('+ pageNumA1 + ')'">{{pageNumA1}}</a></li>
                                        <li><a :href="'javascript:getAllOutVul('+ pageNumA2 + ')'">{{pageNumA2}}</a></li>
                                        <li><a :href="'javascript:getAllOutVul('+ pageNumA1 + ')'">»</a></li>
                                    </template>
                                </ul>
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
                    <div class="modal-body">
                        <h4><i class="icon-info">&nbsp;&nbsp;</i></h4>
                    </div>
                    <div class="modal-footer">
                        <button data-dismiss="modal" class="btn btn-success" data-dismiss="modal" type="button">确定</button>
                    </div>
                </div>
            </div>
        </div>
        
        
        <div class="modal fade bs-example-modal-lg" id="outVulCargoModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">信息预览</h4>
                    </div>
                    <div class="modal-body">
                        <table class="table table-bordered" id="table-details">
                            
                            <tbody>
                                <tr>
                                    <td>影响范围</td>
                                    <td>{{myOutVulDetails.affect}}</td>
                                </tr>
                                <tr>
                                    <td>漏洞详情</td>
                                    <td>{{myOutVulDetails.content}}</td>
                                </tr>
                                <tr>
                                    <td>修复方案</td>
                                    <td>{{myOutVulDetails.fix}}</td>
                                </tr>
                                
                            </tbody>
                        </table>
                    
                    
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

<script>
    function setActive(){
        $("#nav-out-vul").addClass("active");
        $("#info-out-vul").addClass("active");
    }
    setActive();

    gPageNum = parseInt($("#page-num").val());
    pageSize = 10;
    $(document).ready(function () {
        $.ajax({
            type:"POST",
            url:"getAllOutVul.ad",
            dataType:"json",
            data:{
                'pageNum':gPageNum,
                'pageSize':pageSize
            },
            error:function(XMLHttpRequest, textStatus, errorThrown){
                $(".modal-body i").html("&nbsp;&nbsp;网络出错！请求失败");
                $("#myModal").modal('show');
            },
            success:function(res){
                if(res.code !==  0){
                    $(".modal-body i").html("&nbsp;&nbsp;获取外部漏洞情报信息失败！" + res.msg);
                    $("#myModal").modal('show');
                }else if(res.code  === 1006){
                    toastr["info"](res.msg);
                }else{
                    if($("#list-result").hasClass('hidden')){
                        $("#list-result").removeClass("hidden");
                    }
                    //customer = res.content;
                    vBody = new Vue({
                        el:'#table-body',
                        data:{
                            myOutVul:res.content
                        }
                    });
                    vPag = new Vue({
                        el:'#pagination',
                        data:{
                            start:res.start,
                            end:res.end,
                            all:res.num,
                            myNum:gPageNum
                        },
                        computed:{
                            pageNumA1:function(){
                                return this.myNum + 1;
                            },
                            pageNumA2:function(){
                                return this.myNum + 2;
                            },
                            pageNumI1:function(){
                                return this.myNum - 1;
                            },
                            pageNumI2:function(){
                                return this.myNum - 2;
                            }
                        },
                    });
                    if(res.end === res.num){
                        toastr["success"]("已到达最后一页！");
                    }
                }
            }
        });
    });





    function getAllOutVul(pageNum){
        gPageNum = pageNum;
        $.ajax({
            type:"POST",
            url:"getAllOutVul.ad",
            dataType:"json",
            data:{
                'pageNum':gPageNum,
                'pageSize':pageSize
            },
            error:function(XMLHttpRequest, textStatus, errorThrown){
                $(".modal-body i").html("&nbsp;&nbsp;网络出错！请求失败");
                $("#myModal").modal('show');
            },
            success:function(res){
                if(res.code !==  0){
                    $(".modal-body i").html("&nbsp;&nbsp;获取外部漏洞情报信息失败！" + res.msg);
                    $("#myModal").modal('show');
                }else{
                    if($("#list-result").hasClass('hidden')){
                        $("#list-result").removeClass("hidden");
                    }
                    outVul = res.content;
                    len = vBody.myOutVul.length;
                    vBody.myOutVul.splice(0,len);
                    for(var i=0;i<outVul.length;i++){
                        vBody.myOutVul.push(outVul[i]);
                    }
                    vPag.start = res.start;
                    vPag.end = res.end;
                    vPag.all = res.num;
                    vPag.myNum = res.pageNum;
                    $("#page-num").val(res.pageNum);
                    if(res.end === res.num){
                        toastr["success"]("已到达最后一页！");
                    }
                }
            }
        });
    }

    function showOutVul(id){
        window.location.href='showOutVul.htm?id=' + id;
    }

    function editOutVul(id){
        window.location.href='editOutVul.htm?id=' + id;
    }
    

    function getOutVulById(id) {
        $.ajax({
            type:"POST",
            url:"getOutVulById.ad",
            dataType:"json",
            data:{
                'id':id
            },
            error:function(XMLHttpRequest, textStatus, errorThrown){
                $(".modal-body i").html("&nbsp;&nbsp;网络出错！请求失败");
                $("#myModal").modal('show');
            },
            success:function(res){
                if(res.code !== 0){
                    $(".modal-body i").html("&nbsp;&nbsp;查询漏洞详情失败！" + res.msg);
                    $("#myModal").modal('show');
                }else{
                    outVulDetails = res.content;
                    if(typeof outVulDetailsVue === "undefined"){
                        outVulDetailsVue = new Vue({
                            el:'#table-details',
                            data:{
                                myOutVulDetails:outVulDetails
                            }
                        });
                    }else{
                        outVulDetailsVue.myOutVulDetails = outVulDetails;
                    }
                    $("#outVulCargoModal").modal('show');
                }
            }
        });



    }


</script>

</body>
</html>