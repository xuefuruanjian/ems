﻿<%@ Page Language="C#" MasterPageFile="MasterPage.Master" AutoEventWireup="true" CodeBehind="ShippingAdd.aspx.cs" Inherits="XueFuShop.Admin.ShippingAdd" %>
<asp:Content ID="MasterContent" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
<div class="position"><img src="Style/Images/PositionIcon.png"  alt=""/>物流<%=GetAddUpdate()%></div>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="不能为空" ControlToValidate="AgainWeight" Display="Dynamic"></asp:RequiredFieldValidator></li>
</asp:Content>