<%--
  Created by IntelliJ IDEA.
  User: jiyufei
  Date: 2017/12/6
  Time: 10:27
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8"%>

<aside>
    <div id="sidebar"  class="nav-collapse ">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu" id="nav-accordion">
            <li>
                <a href="adminIndex.htm" id="nav-home">
                    <i class="icon-home"></i>
                    <span>主页</span>
                </a>
            </li>
            
            <li class="sub-menu">
                <a href="javascript:" id="nav-out-vul" >
                    <i class="icon-globe"></i>
                    <span>外部漏洞管理</span>
                </a>
                <ul class="sub">
                    <li id="info-out-vul"><a  href="listOutVul.htm">外部漏洞列表</a></li>
                    <li id="add-out-vul"><a  href="addOutVul.htm">添加外部漏洞</a></li>
                    <li id="search-out-vul"><a  href="searchOutVul.htm">搜索外部漏洞</a></li>
                </ul>
            </li>
            
            <li class="sub-menu">
                <a href="javascript:" id="nav-in-vul">
                    <i class="icon-building"></i>
                    <span>内部漏洞管理</span>
                </a>
                <ul class="sub">
                    <li id="info-in-vul"><a  href="listOutVul.htm">内部漏洞列表</a></li>
                    <li id="add-in-vul"><a  href="addOutVul.htm">添加内部漏洞</a></li>
                    <li id="search-in-vul"><a  href="searchOutVul.htm">搜索内部漏洞</a></li>
                </ul>
            </li>
            
            <li class="sub-menu">
                <a href="javascript:" id="nav-knowledge" >
                    <i class="icon-book"></i>
                    <span>知识库管理</span>
                </a>
                <ul class="sub">
                    <li id="info-knowledge"><a  href="listKnowledge.htm">知识库列表</a></li>
                    <li id="add-knowledge"><a  href="addKnowledge.htm">添加知识库</a></li>
                    <li id="search-knowledge"><a  href="searchKnowledge.htm">搜索知识库</a></li>
                </ul>
            </li>
    
            <li class="sub-menu">
                <a href="javascript:" id="nav-notice" >
                    <i class="icon-file-text"></i>
                    <span>公告管理</span>
                </a>
                <ul class="sub">
                    <li id="info-notice"><a  href="listNotice.htm">公告列表</a></li>
                    <li id="add-notice"><a  href="addNotice.htm">添加公告</a></li>
                    <li id="search-notice"><a  href="searchNotice.htm">搜索公告</a></li>
                </ul>
            </li>
    
            <li class="sub-menu">
                <a href="javascript:" id="nav-manage" >
                    <i class="icon-cog"></i>
                    <span>系统管理</span>
                </a>
                <ul class="sub">
                    <li id="manage-user"><a  href="manageUser.htm">管理用户</a></li>
                    <li id="add-user"><a  href="addUser.htm">添加用户</a></li>
                    
                </ul>
            </li>
            
        </ul>
        <!-- sidebar menu end-->
    </div>
</aside>