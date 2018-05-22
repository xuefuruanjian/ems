﻿<%@ Page Language="C#" MasterPageFile="MasterPage.Master" AutoEventWireup="true" CodeBehind="ShippingAdd.aspx.cs" Inherits="XueFuShop.Admin.ShippingAdd" %>
<asp:Content ID="MasterContent" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
<div class="position"><img src="Style/Images/PositionIcon.png"  alt=""/>物流<%=GetAddUpdate()%></div><div class="add">	<ul>		<li class="left">名称：</li>		<li class="right"><asp:TextBox ID="Name" CssClass="input" runat="server" Width="400px"></asp:TextBox>  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="不能为空" ControlToValidate="Name" Display="Dynamic"></asp:RequiredFieldValidator></li>	</ul>	<ul>		<li class="left">描述：</li>		<li class="right"><asp:TextBox ID="Description" CssClass="input" runat="server" Width="400px" TextMode="MultiLine" Height="80px"></asp:TextBox></li>	</ul>	<ul>		<li class="left">是否启用：</li>		<li class="right"><asp:RadioButtonList ID="IsEnabled" runat="server" RepeatDirection="Horizontal"><asp:ListItem Value="0">否</asp:ListItem><asp:ListItem Value="1" Selected="True">是</asp:ListItem></asp:RadioButtonList></li>	</ul>	<ul>		<li class="left">运费方式：</li>		<li class="right"><asp:RadioButtonList ID="ShippingType" runat="server" RepeatDirection="Horizontal" onclick="selectShippingType()"><asp:ListItem Value="1" Selected="True">固定运费</asp:ListItem><asp:ListItem Value="2">按重量计算</asp:ListItem><asp:ListItem Value="3">按商品数量计算</asp:ListItem></asp:RadioButtonList></li>	</ul>	<ul style="display:none" id="ShippingTypeDiv">		<li class="left">首重：</li>		<li class="right"><asp:TextBox ID="FirstWeight" CssClass="input" runat="server" Width="80px" Text="0"></asp:TextBox>（克）<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="不能为空" ControlToValidate="FirstWeight" Display="Dynamic"></asp:RequiredFieldValidator></li>		<li class="left">续重：</li>		<li class="right"><asp:TextBox ID="AgainWeight" CssClass="input" runat="server" Width="80px" Text="0"></asp:TextBox>（克）
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="不能为空" ControlToValidate="AgainWeight" Display="Dynamic"></asp:RequiredFieldValidator></li>	</ul></div><div class="action">    <asp:Button CssClass="button" ID="SubmitButton" Text=" 确 定 " runat="server"  OnClick="SubmitButton_Click" /></div><script language="javascript" type="text/javascript">    function selectShippingType(){        var shippingType=getRadioValue(os("name",globalNamePrefix+"ShippingType"));        if(shippingType=="2"){            o("ShippingTypeDiv").style.display="";        }        else{            o("ShippingTypeDiv").style.display="none";        }    }    selectShippingType();</script>
</asp:Content>