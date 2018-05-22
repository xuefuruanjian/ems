﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/MasterPage.Master" CodeBehind="ProductUnionEdit.aspx.cs" Inherits="XueFuShop.Admin.ProductUnionEdit" %>
<%@ Import Namespace="XueFu.EntLib" %><asp:Content ID="MasterContent" ContentPlaceHolderID="ContentPlaceHolder" runat="server">	<script language="javascript" src="js/ProductBatchEdit.js" type="text/javascript"></script><script language="javascript" type="text/javascript" src="js/calendar.js"></script><div class="position"><img src="Style/Images/PositionIcon.png"  alt=""/>统一编辑</div><ul class="search">    <li>友情提示：1、会员价格为-1表示会员价格将根据会员等级折扣比例计算 2、统一编辑中文本框不写表示不修改此项</li></ul><ul class="search">    <li>        分类：<asp:DropDownList ID="ClassID" runat="server" ></asp:DropDownList>        品牌：<asp:DropDownList ID="BrandID" runat="server" ></asp:DropDownList>        名称：<asp:TextBox CssClass="input" ID="Name" runat="server" Width="100px"></asp:TextBox>		添加时间：从<asp:TextBox CssClass="input" ID="StartAddDate" runat="server" RequiredFieldType="日期时间"  onfocus="cdr.show(this);"></asp:TextBox> 到 <asp:TextBox CssClass="input" ID="EndAddDate" runat="server" RequiredFieldType="日期时间"  onfocus="cdr.show(this);"></asp:TextBox>		<asp:Button CssClass="button" ID="SearchButton" Text=" 搜 索 " runat="server"  OnClick="SearchButton_Click" />    </li></ul><div class="listBlock">    <ul>        <li onclick="window.location='ProductSingleEdit.aspx'">逐个编辑</li>        <li class="listOn" onclick="window.location='ProductUnionEdit.aspx'">统一编辑</li>    </ul>	</div><div class="pageMark"></div><asp:Repeater ID="RecordList" runat="server">	<ItemTemplate>		<div class="nameBlock" title="<%# Eval("Name")%>" id="Product<%# Eval("ID")%>">		<%# StringHelper.Substring(Eval("Name").ToString(),13)%><img src="Style/Images/delete.gif" title="删除" onclick="deleteProduct(<%# Eval("ID")%>)" />		<span style="display:none"><input name="ProductID" value="<%# Eval("ID")%>" type="checkbox" checked="checked" /></span>		</div>	</ItemTemplate></asp:Repeater><div style="clear:both; width:100%; height:2px;"></div><div class="add">	<ul>		<li class="left">重量：</li>		<li class="right"><input type="text" class="input" id="Weight" /> 克 </li>	</ul>	<ul>		<li class="left">市场价：</li>		<li class="right"><input type="text" class="input" id="MarketPrice" /> 元 </li>	</ul>	 <%foreach(XueFuShop.Models.UserGradeInfo userGrade in userGradeList){ %>	 <ul>		<li class="left"><%=userGrade.Name %>价：</li>		<li class="right"><input type="text" class="input" id="MemberPrice<%=userGrade.ID %>" />  元 </li>	</ul>	<%} %>	<ul>		<li class="left">赠送积分：</li>		<li class="right"><input type="text" class="input" id="SendPoint" /></li>	</ul>		<ul <%//if(XueFuShop.Common.ShopConfig.ReadConfigInfo().ProductStorageType == (int)ProductStorageType.SelfStorageSystem){ %>style="display:none"<%//} %>>		<li class="left">总库存数量：</li>		<li class="right"><input type="text" class="input" id="TotalStorageCount" /></li>	</ul>	<ul>		<li class="left">库存下限：</li>		<li class="right"><input type="text" class="input" id="LowerCount" /></li>	</ul>	<ul>		<li class="left">库存上限：</li>		<li class="right"><input type="text" class="input" id="UpperCount" /></li>	</ul>	</div><div class="action">        <input type="button"  value=" 确 定 " class="button"  onclick="saveUnionEdit()"/> </div><script language="javascript" type="text/javascript">var userGradeIDList="<%=userGradeIDList %>";var userGradeNameList="<%=userGradeNameList %>";</script><style type="text/css">.add ul .left{	width:40%;}</style></asp:Content>