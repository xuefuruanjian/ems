﻿<%@ Page Language="C#" MasterPageFile="MasterPage.Master" AutoEventWireup="true" CodeBehind="QuestionXls.aspx.cs" Inherits="XueFuShop.Admin.QuestionXls" Title="无标题页" %>
<asp:Content ID="MasterContent" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
<div class="position"><img src="/Admin/Style/Images/PositionIcon.png"  alt=""/>试题导入</div>
<div class="add">	
              &nbsp;<asp:DropDownList ID="_CateId" runat="server" OnSelectedIndexChanged="_CateId_SelectedIndexChanged" AutoPostBack="True">
              </asp:DropDownList></li>		
              &nbsp;<asp:DropDownList ID="_CourseId" runat="server">
              </asp:DropDownList></li>
    </ul>
</asp:Content>