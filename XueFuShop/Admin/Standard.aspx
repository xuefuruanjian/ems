﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/MasterPage.Master" CodeBehind="Standard.aspx.cs" Inherits="XueFuShop.Admin.Standard" %>
<%@ Import Namespace="XueFu.EntLib" %><asp:Content ID="MasterContent" ContentPlaceHolderID="ContentPlaceHolder" runat="server"><div class="position"><img src="Style/Images/PositionIcon.png"  alt=""/>规格列表</div>	<table class="listTable" cellpadding="0">    <tr class="listTableHead">	    <td style="width:5%">ID</td>	    <td style="width:20%; text-align:left;text-indent:8px;">规格名称</td>	    <td style="width:15%">显示方式</td>  	    <td style="width:50%">值列表</td> 	    <td style="width:5%">管理</td>      	    <td style="width:5%">选择</td>            </tr><asp:Repeater ID="RecordList" runat="server">	<ItemTemplate>	             	<tr class="listTableMain" onmousemove="changeColor(this,'#FFFDD7')" onmouseout="changeColor(this,'#FFF')">			    <td style="width:5%"><%# Eval("ID") %></td>			    <td style="width:20%; text-align:left;text-indent:8px;"><%# Eval("Name") %></td>			    <td style="width:15%;"><%#EnumHelper.ReadEnumChineseName<DisplayTye>(Convert.ToInt32(Eval("DisplayTye")))%></td>			    <td style="width:50%;"><%# Eval("ValueList")%></td>			    <td style="width:5%;">			        <a href="javascript:pop('StandardAdd.aspx?ID=<%# Eval("ID") %>',800,600,'规格修改','StandardAdd<%# Eval("ID") %>')"><img src="Style/Images/edit.gif" alt="修改" title="修改" /></a> 			    </td>			    <td style="width:5%"><input type="checkbox" name="SelectID" value="<%# Eval("ID") %>" /></td> 	        		    </tr>        </ItemTemplate></asp:Repeater></table><div class="action">        <input type="button"  value=" 添 加 " class="button"  onclick="pop('StandardAdd.aspx',800,600,'规格添加','StandardAdd')"/>&nbsp;<asp:Button CssClass="button" ID="DeleteButton" Text=" 删 除 " OnClientClick="return checkSelect()" runat="server"  OnClick="DeleteButton_Click"/>&nbsp;<input type="checkbox" name="All" onclick="selectAll(this)" />全选/取消</div></asp:Content>
