﻿<%@ Page Language="C#" MasterPageFile="MasterPage.Master" AutoEventWireup="true" CodeBehind="KPI.aspx.cs" Inherits="XueFuShop.Admin.KPI" Title="无标题页" %>
<%@ Import Namespace="XueFuShop.BLL" %>
<asp:Content ID="MasterContent" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
<link rel="stylesheet" href="Style/jquery.bigautocomplete.css" type="text/css" />
<script type="text/javascript" src="Js/jquery.1.12.4.min.js"></script>
<script type="text/javascript" src="Js/jquery.bigautocomplete.js"></script>
<div class="position"><img src="/Admin/Style/Images/PositionIcon.png"  alt=""/>KPI列表</div>	
		指标名称：<asp:TextBox CssClass="input" ID="Name" runat="server" Width="150px"></asp:TextBox>
		<td>操作</td>
				<span class="handle">
<script type="text/javascript">
$(function(){
	$("#"+globalIDPrefix+"CompanyName").bigAutocomplete({
	    width:"304px",
		url:"Ajax.aspx?Action=SearchCompanyName",
		callback:function(data){
    		$("#CompanyID").val(data.result.Id);
		}
	});	
})
</script>
</asp:Content>