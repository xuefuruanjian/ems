﻿<%@ Page Language="C#" MasterPageFile="MasterPage.Master" AutoEventWireup="true" CodeBehind="Questions.aspx.cs" Inherits="XueFuShop.Admin.Questions" Title="无标题页" %>
<%@ Import Namespace="XueFuShop.BLL" %>
        分类：<asp:DropDownList ID="SearchCategory" runat="server"></asp:DropDownList>
        课程名称：<XueFu:TextBox ID="SearchCourseName" CssClass="input" runat="server"/>
        试题名称：<XueFu:TextBox ID="SearchQuestionName" CssClass="input" runat="server"/>
        试题类型：<asp:DropDownList ID="SearchQuestionStyle" runat="server"></asp:DropDownList>
<table class="listTable" cellpadding="0">
<div class="action">
</div>
</asp:Content>