﻿<%@ Page Language="C#" MasterPageFile="MasterPage.Master" AutoEventWireup="true" CodeBehind="TestPaper.aspx.cs" Inherits="XueFuShop.Admin.TestPaper" %>
<%@ Import Namespace="XueFuShop.BLL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
<link type="text/css" href="Style/jquery.bigautocomplete.css" rel="stylesheet" />
<script type="text/javascript" src="Js/jquery.1.12.4.min.js"></script>
<script type="text/javascript" src="Js/jquery.bigautocomplete.js"></script>
<ul class="search">
        公司：<asp:TextBox ID="CompanyName" Width="200px" name="CompanyName" CssClass="input" runat="server"> </asp:TextBox>        
        用户名：<asp:TextBox ID="UserName" CssClass="input" runat="server"></asp:TextBox>
        姓名：<asp:TextBox ID="RealName" CssClass="input" runat="server"></asp:TextBox>
        课程名称：<asp:TextBox ID="CourseName" CssClass="input" runat="server"></asp:TextBox>        
        时间：<asp:TextBox CssClass="input Wdate" ID="SearchStartDate" TabIndex="2" runat="server" Width="80px" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,maxDate:'#F{$dp.$D(globalIDPrefix+\'SearchEndDate\')}'})"></asp:TextBox> -- <asp:TextBox CssClass="input Wdate" ID="SearchEndDate" runat="server" Width="80px" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,minDate:'#F{$dp.$D(globalIDPrefix+\'SearchStartDate\')}',startDate:'#F{$dp.$D(globalIDPrefix+\'SearchStartDate\')}'})"></asp:TextBox>
        状态：<asp:DropDownList ID="IsPass" runat="server"><asp:ListItem Value="">全部</asp:ListItem><asp:ListItem Value="1">通过</asp:ListItem><asp:ListItem Value="0">未通过</asp:ListItem></asp:DropDownList>
<table class="listTable" cellpadding="0">
             {%>
<div class="action">
<script type="text/javascript">
    $(function(){
	    document.onkeydown = function(event) {  
        var target, code, tag;  
        if (!event) {  
            event = window.event; //针对ie浏览器  
            target = event.srcElement;  
            code = event.keyCode;  
            if (code == 13) {  
                tag = target.tagName;  
                if (tag == "TEXTAREA") { return true; }  
                else { return false; }  
            }  
        }  
        else {  
            target = event.target; //针对遵循w3c标准的浏览器，如Firefox  
            code = event.keyCode;  
            if (code == 13) {  
                tag = target.tagName;  
                if (tag == "INPUT") { return false; }  
                else { return true; }  
            }  
        }  
    };
	
	$("#ctl00_ContentPlaceHolder_CompanyName").bigAutocomplete({
	    width:"304px",
		url:"Ajax.aspx?Action=SearchCompanyName",
		callback:function(data){
		}
	});
})
</script>
</asp:Content>