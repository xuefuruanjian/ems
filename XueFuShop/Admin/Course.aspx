﻿<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.Master" AutoEventWireup="true" CodeBehind="Course.aspx.cs" Inherits="XueFuShop.Admin.Course" Title="无标题页" %>
<%@ Import Namespace="XueFuShop.BLL" %>
<asp:Content ID="MasterContent" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
<script language="javascript" src="js/jquery.1.12.4.min.js" type="text/javascript"></script>
<div class="position"><img src="/Admin/Style/Images/PositionIcon.png"  alt=""/>题库列表</div>
<ul class="search">
        分类：<asp:DropDownList ID="SearchCategory" runat="server"></asp:DropDownList>
<table class="listTable" cellpadding="0">
<%if (CompareAdminPower("AddCourseCate", PowerCheckType.Single))
  {%>
    <asp:Button  class="button" ID="Button2" runat="server" Text="删除" OnClick="Button2_Click" />
<script language="javascript">
$(function(){
    $("[name='SelectID'],[name='All']").click(function(){
        var checkboxvalue='';
        $("input[name='SelectID']:checked").each(function(){
                checkboxvalue += ',' + $(this).attr('value');
        }); 
        $("#CheckBoxValue").val(checkboxvalue.substr(1));
    });
    
    $("#BatchOut").click(function(){
        if($("#CheckBoxValue").val() != ''){
            pop('QuestionXls.aspx?CourseID='+$("#CheckBoxValue").val()+'&Action=BatchFileOut',700,300,'批量导出','CourseAdd');
        }
    })
    
    $("#BatchMove").click(function(){
        if($("#CheckBoxValue").val() != ''){
            pop('CourseMove.aspx?CourseID='+$("#CheckBoxValue").val()+'',700,200,'课程分类移动','CourseMove');
        }
    })
})
</script>
<%} %>
</asp:Content>