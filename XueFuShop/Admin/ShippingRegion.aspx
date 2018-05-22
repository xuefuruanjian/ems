﻿<%@ Page Language="C#" MasterPageFile="MasterPage.Master" AutoEventWireup="true" CodeBehind="ShippingRegion.aspx.cs" Inherits="XueFuShop.Admin.ShippingRegion" %>
<%@ Import Namespace="XueFuShop.BLL" %><asp:Content ID="MasterContent" ContentPlaceHolderID="ContentPlaceHolder" runat="server"><script language="javascript" type="text/javascript" src="/Admin/js/UnlimitClass.js"></script><div class="position"><img src="/Admin/Style/Images/PositionIcon.png"  alt=""/>物流区域列表</div>	<table class="listTable" cellpadding="0" cellpadding="0">    <tr class="listTableHead">	<td style="width:5%">ID</td>	<td style="width:30%; text-align:left;text-indent:8px;">物流区域</td>	<td style="width:55%">详细区域</td>  	<td style="width:5%">管理</td>       	<td style="width:5%">选择</td>        </tr><asp:Repeater ID="RecordList" runat="server">	<ItemTemplate>	             	<tr class="listTableMain" onmousemove="changeColor(this,'#FFFDD7')" onmouseout="changeColor(this,'#FFF')">			<td style="width:5%"><%# Eval("ID") %></td>			<td style="width:30%; text-align:left;text-indent:8px;"><%# Eval("Name") %></td>			<td style="width:55%"><%#RegionBLL.RegionNameList(Eval("RegionID").ToString())%></td>  			<td style="width:5%;"><a href='ShippingRegion.aspx?ID=<%# Eval("ID") %>&ShippingID=<%=shippingID%>'><img src="Style/Images/edit.gif" alt="修改" title="修改" /></a></td>			<td style="width:5%"><input type="checkbox" name="SelectID" value="<%# Eval("ID") %>" /></td> 	        		</tr>        </ItemTemplate></asp:Repeater></table><div class="action">        <input type="button"  value=" 添 加 " class="button"  onclick="window.location.href='ShippingRegion.aspx?ShippingID=<%=shippingID%>'"/>&nbsp;<asp:Button CssClass="button" ID="DeleteButton" Text=" 删 除 " OnClientClick="return checkSelect()" runat="server"  OnClick="DeleteButton_Click"/>&nbsp;<input type="checkbox" name="All" onclick="selectAll(this)" />全选/取消</div><div class="position"><img src="/Admin/Style/Images/PositionIcon.png"  alt=""/>物流区域<%=GetAddUpdate()%></div><div class="add">	<ul>		<li class="left">名称：</li>		<li class="right"><XueFu:TextBox ID="Name" CssClass="input" runat="server" Width="400px" CanBeNull="必填"/></li>	</ul>	<%if(shipping.ShippingType==(int)ShippingType.Fixed){%>		<ul>		<li class="left">固定运费：</li>		<li class="right"><XueFu:TextBox ID="FixedMoeny" CssClass="input" runat="server" Width="400px" Text="0" CanBeNull="必填" RequiredFieldType="金额"/>（元）</li>	</ul>		<%} %>	<%if(shipping.ShippingType==(int)ShippingType.Weight){%>		<ul>		<li class="left">首重<%=shipping.FirstWeight %>克：</li>		<li class="right"><XueFu:TextBox ID="FirstMoney" CssClass="input" runat="server" Width="100px" Text="0" CanBeNull="必填" RequiredFieldType="金额"/>（元）</li>		<li class="left">续重<%=shipping.AgainWeight %>克：</li>		<li class="right"><XueFu:TextBox ID="AgainMoney" CssClass="input" runat="server" Width="100px" CanBeNull="必填" RequiredFieldType="金额"/>（元）</li>	</ul>	<%} %>	<%if(shipping.ShippingType==(int)ShippingType.ProductCount){%>			<ul>		<li class="left">单件商品：</li>		<li class="right"><XueFu:TextBox ID="OneMoeny" CssClass="input" runat="server" Width="100px" CanBeNull="必填" RequiredFieldType="金额"/>（元）</li>		<li class="left">加一件商品：</li>		<li class="right"><XueFu:TextBox ID="AnotherMoeny" CssClass="input" runat="server" Width="100px" CanBeNull="必填" RequiredFieldType="金额"/>（元）</li>	</ul>		<%} %>	<ul>		<li class="left">选择区域：</li>        <li class="right"><XueFu:MultiUnlimitControl ID="RegionID" runat="server"/></li>	</ul></div><div class="action">    <asp:Button CssClass="button" ID="SubmitButton" Text=" 确 定 " runat="server"  OnClick="SubmitButton_Click" /></div></asp:Content>
