﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/MasterPage.Master" CodeBehind="Order.aspx.cs" Inherits="XueFuShop.Admin.Order" %>
<asp:Content ID="MasterContent" ContentPlaceHolderID="ContentPlaceHolder" runat="server"><script language="javascript" src="js/calendar.js" type="text/javascript"></script><div class="position"><img src="Style/Images/PositionIcon.png"  alt=""/>订单列表</div>	<ul class="search">    <li>        订单状态：<asp:DropDownList ID="OrderStatus" runat="server">		        <asp:ListItem Value="">所有</asp:ListItem>		        <asp:ListItem Value="1">待付款</asp:ListItem>		        <asp:ListItem Value="2">待审核</asp:ListItem>		        <asp:ListItem Value="3">无效</asp:ListItem>		        <%--<asp:ListItem Value="4">配货中</asp:ListItem>		        <asp:ListItem Value="5">已发货</asp:ListItem>		        <asp:ListItem Value="6">已收货</asp:ListItem>		        <asp:ListItem Value="7">已退货</asp:ListItem>--%>		        </asp:DropDownList>        订单号：<asp:TextBox CssClass="input" ID="OrderNumber" runat="server" Width="100px"></asp:TextBox>				收货人：<asp:TextBox CssClass="input" ID="Consignee" runat="server" Width="100px"></asp:TextBox>		下单时间：从<asp:TextBox CssClass="input" ID="StartAddDate" runat="server" RequiredFieldType="日期时间"  onfocus="cdr.show(this);"></asp:TextBox> 到 <asp:TextBox CssClass="input" ID="EndAddDate" runat="server" RequiredFieldType="日期时间"  onfocus="cdr.show(this);"></asp:TextBox>	    <asp:Button CssClass="button" ID="SearchButton" Text=" 搜 索 " runat="server"  OnClick="SearchButton_Click" />    </li></ul><div class="listBlock">    <ul>        <li <%if(intOrderStatus==int.MinValue){%>class="listOn"<%} %> onclick="window.location='Order.aspx'">所有订单</li>        <li <%if(intOrderStatus==1){%>class="listOn"<%} %> onclick="window.location='Order.aspx?OrderStatus=1'">待付款</li>        <li <%if(intOrderStatus==2){%>class="listOn"<%} %> onclick="window.location='Order.aspx?OrderStatus=2'">待审核</li>        <li <%if(intOrderStatus==3){%>class="listOn"<%} %> onclick="window.location='Order.aspx?OrderStatus=3'">无效</li>        <%--<li <%if(intOrderStatus==4){%>class="listOn"<%} %> onclick="window.location='Order.aspx?OrderStatus=4'">配货中</li>        <li <%if(intOrderStatus==5){%>class="listOn"<%} %> onclick="window.location='Order.aspx?OrderStatus=5'">已发货</li>        <li <%if(intOrderStatus==6){%>class="listOn"<%} %> onclick="window.location='Order.aspx?OrderStatus=6'">已收货</li>        <li <%if(intOrderStatus==7){%>class="listOn"<%} %> onclick="window.location='Order.aspx?OrderStatus=7'">已退货</li>--%>    </ul>	</div><table class="listTable" cellpadding="0">    <tr class="listTableHead">	    <td style="width:5%">ID</td>	    <td style="width:20%; text-align:left;text-indent:8px;">订单号</td>     	    <td style="width:10%">订单金额</td>	    <td style="width:10%">收货人</td>	    <td style="width:25%">收货地址</td>	    <td style="width:10%">审核状态</td> 	       	    <td style="width:15%">下单时间</td>      	    <td style="width:5%">管理</td>              </tr><asp:Repeater ID="RecordList" runat="server">	<ItemTemplate>	             <tr class="listTableMain" onmousemove="changeColor(this,'#FFFDD7')" onmouseout="changeColor(this,'#FFF')">			<td style="width:5%"><%# Eval("ID") %></td>			<td style="width:20%; text-align:left;text-indent:8px;"><%# Eval("OrderNumber") %></td>     	        <td style="width:10%"><%# Convert.ToDecimal(Eval("ProductMoney")) - Convert.ToDecimal(Eval("FavorableMoney")) + Convert.ToDecimal(Eval("ShippingMoney")) + Convert.ToDecimal(Eval("OtherMoney"))%></td>   	        <td style="width:10%"><%# Eval("Consignee")%></td>	        <td style="width:25%"><%# Eval("Address")%></td> 	        <td style="width:10%"><%# XueFuShop.BLL.OrderBLL.ReadOrderStatus(Convert.ToInt32(Eval("OrderStatus")))%></td> 	         	        <td style="width:15%"><%# Eval("AddDate") %></td>   			<td style="width:5%;"><a href='OrderDetail.aspx?ID=<%# Eval("ID") %>'>查看</a></td>				        		</tr>        </ItemTemplate></asp:Repeater></table><div class="listPage"><XueFu:CommonPager ID="MyPager" runat="server" /></div></asp:Content>