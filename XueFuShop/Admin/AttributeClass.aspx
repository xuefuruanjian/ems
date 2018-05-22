﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/MasterPage.Master" CodeBehind="AttributeClass.aspx.cs" Inherits="XueFuShop.Admin.AttributeClass" %>
<asp:Content ID="MasterContent" ContentPlaceHolderID="ContentPlaceHolder" runat="server"><div class="position"><img src="Style/Images/PositionIcon.png"  alt=""/>属性组列表</div>	<table class="listTable" cellpadding="0" cellpadding="0">    <tr class="listTableHead">	<td style="width:5%">ID</td>	<td style="width:55%; text-align:left;text-indent:8px;">名称</td>	<td style="width:10%">属性数量</td>       	<td style="width:25%">管理</td>       	<td style="width:5%">选择</td>        </tr><asp:Repeater ID="RecordList" runat="server">	<ItemTemplate>	             	<tr class="listTableMain" onmousemove="changeColor(this,'#FFFDD7')" onmouseout="changeColor(this,'#FFF')">			<td style="width:5%"><%# Eval("ID") %></td>			<td style="width:55%; text-align:left;text-indent:8px;"><%# Eval("Name") %></td>			<td style="width:10%;"><%# Eval("AttributeCount") %></td>			<td style="width:25%;">			    <a href="javascript:pop('AttributeClassAdd.aspx?ID=<%# Eval("ID") %>',600,200,'属性组修改','AttributeClassAdd<%# Eval("ID") %>')"><img src="Style/Images/edit.gif" alt="修改" title="修改" /></a> 			    <a href="javascript:pop('Attribute.aspx?AttributeClassID=<%# Eval("ID") %>',800,600,'属性列表','AttributeClassAdd<%# Eval("ID") %>')"><img src="Style/Images/list.gif" alt="属性列表" title="属性列表" /></a> 			</td>			<td style="width:5%"><input type="checkbox" name="SelectID" value="<%# Eval("ID") %>" /></td> 	        		</tr>        </ItemTemplate></asp:Repeater></table><div class="action">        <input type="button"  value=" 添 加 " class="button" onclick="pop('AttributeClassAdd.aspx',600,200,'属性组添加','AttributeClassAdd')"/>&nbsp;<asp:Button CssClass="button" ID="DeleteButton" Text=" 删 除 " OnClientClick="return checkSelect()" runat="server"  OnClick="DeleteButton_Click"/>&nbsp;<input type="checkbox" name="All" onclick="selectAll(this)" />全选/取消</div></asp:Content>
