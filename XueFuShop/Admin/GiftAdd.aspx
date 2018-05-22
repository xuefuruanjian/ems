﻿<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.Master" AutoEventWireup="true" CodeBehind="GiftAdd.aspx.cs" Inherits="XueFuShop.Admin.GiftAdd" Title="无标题页" %>
<%@ Register Assembly="XueFu.EntLib" Namespace="XueFu.EntLib" TagPrefix="XueFu" %>
<%@ Import Namespace="XueFuShop.BLL" %>
<asp:Content ID="MasterContent" ContentPlaceHolderID="ContentPlaceHolder" runat="server"><div class="position"><img src="/Admin/Style/Images/PositionIcon.png"  alt=""/>礼品<%=GetAddUpdate()%></div><div class="add">	<ul>		<li class="left">名称：</li>		<li class="right"><XueFu:TextBox ID="Name" CssClass="input" runat="server" Width="400px" CanBeNull="必填" /></li>	</ul>	<ul>		<li class="left">图片：</li>		<li class="right"><XueFu:TextBox ID="Photo" CssClass="input" runat="server" Width="400px" /></li>	</ul>	<ul>		<li class="left">上传图片：</li>		<li class="right"><iframe src="UploadAdd.aspx?Control=Photo&TableID=<%=GiftBLL.TableID %>&FilePath=GiftPhoto/Original" width="400" height="30px" frameborder="0" allowTransparency="true" scrolling="no"></iframe></li>	</ul> 	<ul>		<li class="left">介绍：</li>		<li class="right"><XueFu:TextBox ID="Description" CssClass="input" runat="server" Width="400px"  TextMode="MultiLine" Height="80px"/></li>	</ul>		<XueFu:Hint ID="Hint" runat="server" /></div><div class="action">    <asp:Button CssClass="button" ID="SubmitButton" Text=" 确 定 " runat="server"  OnClick="SubmitButton_Click" /></div></asp:Content>
