﻿<%@ Page Language="C#" MasterPageFile="MasterPage.Master" AutoEventWireup="true" CodeBehind="KPIAdd.aspx.cs" Inherits="XueFuShop.Admin.KPIAdd" Title="无标题页" %>
<asp:Content ID="MasterContent" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
<link rel="stylesheet" href="Style/jquery.bigautocomplete.css" type="text/css" />
<script type="text/javascript" src="Js/jquery.1.12.4.min.js"></script>
<script type="text/javascript" src="Js/jquery.bigautocomplete.js"></script>
<div class="position"><img src="/Admin/Style/Images/PositionIcon.png"  alt=""/>KPI<%=GetAddUpdate()%></div>
<script type="text/javascript">
$(function(){
	$("#"+globalIDPrefix+"CompanyName").bigAutocomplete({
	    width:"400px",
		url:"Ajax.aspx?Action=SearchCompanyName",
		callback:function(data){
		    $("#CompanyId").val(data.result.Id);
		}
	});
})
</script>
</asp:Content>