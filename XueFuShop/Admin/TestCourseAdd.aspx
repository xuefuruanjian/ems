﻿<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.Master" AutoEventWireup="true" CodeBehind="TestCourseAdd.aspx.cs" Inherits="XueFuShop.Admin.TestCourseAdd" Title="无标题页" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %><%@ Import Namespace="XueFu.EntLib" %><%@ Import Namespace="XueFuShop.Common" %><%@ Import Namespace="XueFuShop.Models" %><%@ Import Namespace="XueFuShop.BLL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
<link rel="stylesheet" href="Style/jquery.bigautocomplete.css" type="text/css" /><script language="javascript" type="text/javascript" src="/Admin/Js/Color.js"></script><script language="javascript" type="text/javascript" src="/Admin/js/calendar.js"></script><script language="javascript" type="text/javascript" src="/Admin/js/UnlimitClass.js"></script>
<script type="text/javascript" src="Js/jquery.1.12.4.min.js"></script>
<script type="text/javascript" src="Js/jquery.bigautocomplete.js"></script><script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script><div class="position"><img src="/Admin/Style/Images/PositionIcon.png"  alt=""/>课程<%=GetAddUpdate()%></div><div  class="listBlock">    <ul>        <li class="listOn" id="TitleDefault" onclick="switchBlock('Default')">基本设置</li>        <li id="TitleDetail" onclick="switchBlock('Detail')">详细描述</li>        <li id="TitleAttribute" onclick="switchBlock('Attribute')">课程属性</li>        <li id="TitleOther" onclick="switchBlock('Other')">其他信息</li>        <li id="TitleAccessory" onclick="switchBlock('Accessory')">课程题库</li>        <li id="TitlePhoto" onclick="switchBlock('Photo')">课程图片</li>        <li id="TitleTestSetting" onclick="switchBlock('TestSetting')">考试设置</li>        <li id="TitleProduct" onclick="switchBlock('Product')">关联课程</li>        <li id="TitleArticle" onclick="switchBlock('Article')">关联文章</li>    </ul>	</div><input name="testitem" value="111" type="hidden" /><div class="line"></div><input type="hidden" name="RelationArticleID" id="RelationArticleID" /><input type="hidden" name="RelationProductID" id="RelationProductID"/><input type="hidden" name="RelationAccessoryID" id="RelationAccessoryID"/><div class="add" id="ContentDefault">		<ul>		<li class="left">公司名称：</li>		<li class="right">		    <input type="text" name="CompanyName" id="CompanyName" class="input companyname" value="<%=companyName %>" />		    <input type="hidden" name="CompanyId" id="CompanyId" value="<%=companyID %>" />		</li>	</ul>		<ul>		<li class="left">课程名称：</li>		<li class="right"><XueFu:TextBox ID="Name" CssClass="input" runat="server" Width="400px"  CanBeNull="必填"/>		<%--<input id="ProductColor" name="ProductColor" type="hidden" value="<%=color %>"/> <input type="button" value=" 拾色器 " class="button" onclick="colorOpen(this,'','<%=IDPrefix%>Name','ProductColor')"/>		<asp:DropDownList ID="FontStyle" runat="server"><asp:ListItem Value="">正常</asp:ListItem><asp:ListItem Value="font-style:italic">斜体</asp:ListItem><asp:ListItem Value="text-decoration:underline">下划线</asp:ListItem><asp:ListItem Value="text-decoration:line-through">删除线</asp:ListItem></asp:DropDownList>--%>		</li>	</ul>	<ul>		<li class="left">视频编码：</li>		<li class="right"><XueFu:TextBox ID="ProductNumber" CssClass="input" runat="server" Width="600px"/></li>	</ul>	<ul>		<li class="left">课程分类：</li>		<li class="right"><XueFu:MultiUnlimitControl ID="ProductClass" runat="server"></XueFu:MultiUnlimitControl></li>	</ul>		<ul>		<li class="left">授课老师：</li>		<li class="right"><XueFu:TextBox ID="Editor" CssClass="input" runat="server" Width="200px"/></li>	</ul>		<ul>		<li class="left">适用品牌：</li>		<li class="right"><%=CreatBrandCheckBoxHtml(brandIDStr) %></li>	</ul>	<ul>		<li class="left">市场售价：</li>		<li class="right"><XueFu:TextBox ID="MarketPrice" CssClass="input" runat="server" Width="100px" Text="0" CanBeNull="必填" RequiredFieldType="金额"/>（元）</li>			</ul>	<%--<ul>		<li class="left">会员价格：</li>		<li class="right"><%foreach (UserGradeInfo userGrade in userGradeList){%> <%=userGrade.Name%>：<input class="input" style="width:65px;" name="MemberPrice<%=userGrade.ID %>" id="<%=userGrade.ID %>" value="<%=userGrade.MemberPrice.Price %>"  size="10"/> <%} %><br />会员价格为-1时表示会员价格按会员等级折扣率计算。你也可以为每个等级指定一个固定价格<li>	</ul>--%>	<ul>		<li class="left">图片：</li>		<li class="right"><XueFu:TextBox ID="Photo" CssClass="input" runat="server" Width="400px" CanBeNull="必填">/</XueFu:TextBox></li>	</ul>	<ul>		<li class="left">上传图片：</li>		<li class="right"><iframe src="UploadAdd.aspx?Control=Photo&TableID=<%=ProductBLL.TableID%>&FilePath=ProductCoverPhoto/Original" width="400" height="30px" frameborder="0" allowTransparency="true" scrolling="no"></iframe></li>	</ul>	<ul>		<li class="left">排序：</li>		<li class="right"><XueFu:TextBox ID="Sort" CssClass="input" runat="server" Width="100px" CanBeNull="必填" RequiredFieldType="数据校验" HintInfo="数字越小越靠前">0</XueFu:TextBox></li>	</ul></div><div class="add" id="ContentDetail" style="display:none">		<ul>		<li class="left">关键字：</li>		<li class="right"><XueFu:TextBox ID="Keywords" CssClass="input" runat="server" Width="400px" HintInfo="产品页面关键字，供搜索引擎使用" /></li>	</ul>	<ul>		<li class="left">摘要：</li>		<li class="right"><XueFu:TextBox ID="Summary" CssClass="input" runat="server" Width="400px" TextMode="MultiLine" Height="50px" HintInfo="产品页面描述，供搜索引擎使用"  /></li>	</ul>	<ul>		<li class="left">详细介绍：</li>		<li class="right"><FCKeditorV2:FCKeditor ToolbarSet="Basic" id="Introduction" runat="server" Width="600px" Height="330px"/></li>	</ul></div><div class="add" id="ContentOther" style="display:none">		<ul>		<li class="left">是否特价：</li>		<li class="right"><asp:RadioButtonList ID="IsSpecial" runat="server" RepeatDirection="Horizontal"><asp:ListItem Value="1">是</asp:ListItem><asp:ListItem Value="0" Selected="True">否</asp:ListItem></asp:RadioButtonList></li>	</ul>	<ul>		<li class="left">是否新课程：</li>		<li class="right"><asp:RadioButtonList ID="IsNew" runat="server" RepeatDirection="Horizontal"><asp:ListItem Value="1">是</asp:ListItem><asp:ListItem Value="0" Selected="True">否</asp:ListItem></asp:RadioButtonList></li>	</ul>	<ul>		<li class="left">是否热销：</li>		<li class="right"><asp:RadioButtonList ID="IsHot" runat="server" RepeatDirection="Horizontal"><asp:ListItem Value="1">是</asp:ListItem><asp:ListItem Value="0" Selected="True">否</asp:ListItem></asp:RadioButtonList></li>	</ul>	<ul>		<li class="left">是否推荐：</li>		<li class="right"><asp:RadioButtonList ID="IsTop" runat="server" RepeatDirection="Horizontal"><asp:ListItem Value="1">是</asp:ListItem><asp:ListItem Value="0" Selected="True">否</asp:ListItem></asp:RadioButtonList></li>	</ul>	<ul>		<li class="left">容许评论：</li>		<li class="right"><asp:RadioButtonList ID="AllowComment" runat="server" RepeatDirection="Horizontal"><asp:ListItem Value="1"  Selected="True">是</asp:ListItem><asp:ListItem Value="0">否</asp:ListItem></asp:RadioButtonList></li>	</ul>	<ul>		<li class="left">上架情况：</li>		<li class="right"><asp:RadioButtonList ID="IsSale" runat="server" RepeatDirection="Horizontal"><asp:ListItem Value="1">上架</asp:ListItem><asp:ListItem Value="2" Selected="True">待发</asp:ListItem><asp:ListItem Value="0">下架</asp:ListItem></asp:RadioButtonList></li>	</ul>	<ul>		<li class="left">备注：</li>		<li class="right"><XueFu:TextBox ID="Remark" CssClass="input" runat="server" Width="400px" TextMode="MultiLine" Height="80px" HintInfo="后台管理员使用" /></li>	</ul></div><div class="add" id="ContentPhoto" style="display:none">	    <ul class="search" id="ProductPhotoList">        <%foreach (ProductPhotoInfo productPhoto in productPhotoList){ %>				<div class="productPhoto" id="ProductPhoto<%=productPhoto.ID%>">	        <div><img src="<%=productPhoto.Photo.Replace("Original", "340-340")%>" alt=""  title="<%=productPhoto.Name%>" onload="photoLoad(this,90,90)"/></div>	        <%=StringHelper.Substring(productPhoto.Name, 6)%><br />	        <span onclick="deleteProductPhoto(<%=productPhoto.ID %>)" style="cursor:pointer"><img src="style/images/delete.gif" /></span>	    </div>	    <%} %>	</ul>	<ul>		<li style=" padding-left:100px"><iframe src="ProductPhotoAdd.aspx" width="600px" height="30px" frameborder="0" allowTransparency="true" scrolling="no"></iframe></li>	</ul>	</div><div class="add" id="ContentAttribute" style="display:none">		<ul>		<li class="left">课程属性：</li>		<li class="right"><asp:DropDownList ID="AttributeClassID"  runat="server" onchange="readAttribute(this.value)" /></li>	</ul>		<div id="Attribute-Ajax"></div>	</div><div class="add" id="ContentStandard" style="display:none">    <ul>		<li class="left">规格类型：</li>		<li class="right"><asp:DropDownList ID="StandardType"  runat="server" onchange="readStandard(this.value)" />  * 更改规格类型将把的旧的产品规格数据删除，请谨慎操作!</li>	</ul>	<div id="Standard-Ajax"></div>	<script language="javascript" type="text/javascript">var productID=<%=productID%>;</script>	 	<script language="javascript" type="text/javascript" src="/Admin/js/ProductAdd.js"></script>	</div><div class="add" id="ContentAccessory"  style="display:none">	  	<ul class="search">	    <li ><asp:DropDownList ID="AccessoryClassID" runat="server" /> <XueFu:TextBox ID="AccessoryProductName" CssClass="input" runat="server" Height="20px" Width="150px" /> <input id="SearchPAccessory" type="button" value=" 搜 索 " class="button" onclick="searchProductQuestionBank()" /></li>	</ul>	<ul style="overflow:hidden; height:310px;padding-left:40px">	    <li id="CandidateAccessoryBox">            <select id="<%=IDPrefix%>CandidateAccessory" name="<%=NamePrefix %>CandidateAccessory" style="width:350px;height:300px;" multiple="multiple"></select>        </li>        <li style="margin:60px 10px 10px 10px">            <input id="AddAccessoryAll" type="button" class="button" value=">>"  onclick="addProductAccessoryAll('<%=IDPrefix%>CandidateAccessory','<%=IDPrefix%>Accessory')" /><br /><br />            <input id="AddAccessorySingle" type="button" class="button" value=">"  onclick="addProductAccessorySingle('<%=IDPrefix%>CandidateAccessory','<%=IDPrefix%>Accessory')" /><br /><br />            <input id="DropAccessorySingle" type="button" class="button" value="<"  onclick="dropSingle('<%=IDPrefix%>Accessory')" /><br /><br />            <input id="DropAccessoryAll" type="button" class="button" value="<<" onclick="dropAll('<%=IDPrefix%>Accessory')" /><br />        </li>        <li>             <asp:ListBox ID="Accessory" runat="server" SelectionMode="Multiple" Width="350px" Height="300px"></asp:ListBox>        </li>	</ul></div><div class="add" id="ContentTestSetting" style="display:none">		<ul>		<li class="left">考试时间：</li>		<li class="right"><XueFu:TextBox ID="TestStartTime" CssClass="input Wdate" runat="server" Width="140px" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true,maxDate:'#F{$dp.$D(globalIDPrefix+\'TestEndTime\')}'})" RequiredFieldType="日期时间" HintInfo="允许考试的开始时间" /> 至 <XueFu:TextBox ID="TestEndTime" CssClass="input Wdate" runat="server" Width="140px" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true,minDate:'#F{$dp.$D(globalIDPrefix+\'TestStartTime\')}'})" RequiredFieldType="日期时间" HintInfo="允许考试的结束时间" /></li>	</ul>	<ul>		<li class="left">试卷总分：</li>		<li class="right">
		    <XueFu:TextBox ID="PaperScore" CssClass="input" runat="server" Width="100px" RequiredFieldType="数据校验" HintInfo="" />
		    <asp:Literal ID="PaperScorseTips" runat="server"></asp:Literal></li>	</ul>	<ul>		<li class="left">考试时长：</li>		<li class="right">
		    <XueFu:TextBox ID="TestTimeLength" CssClass="input" runat="server" Width="100px" RequiredFieldType="数据校验" HintInfo="" />
		    <asp:Literal ID="TestTimeLengthTips" runat="server"></asp:Literal>		</li>	</ul>	<ul>		<li class="left">试题数量：</li>		<li class="right">
		    <XueFu:TextBox ID="QuestionsNum" CssClass="input" runat="server" Width="100px" RequiredFieldType="数据校验" HintInfo="" />
		    <asp:Literal ID="QuestionsNumTips" runat="server"></asp:Literal>		</li>	</ul>	<ul>		<li class="left">及格分数：</li>		<li class="right">
		    <XueFu:TextBox ID="LowScore" CssClass="input" runat="server" Width="100px" RequiredFieldType="数据校验" HintInfo="" />
		    <asp:Literal ID="LowScoreTips" runat="server"></asp:Literal>		</li>	</ul></div><div class="add" id="ContentProduct"  style="display:none">	    <ul class="search">        <li><asp:DropDownList ID="RelationClassID" runat="server" /> <%--<asp:DropDownList ID="RelationBrandID" runat="server" />--%> <XueFu:TextBox ID="ProductName" CssClass="input" runat="server" Height="20px" Width="150px" /> <input id="SearchRProduct" type="button" class="button" value=" 搜 索 " onclick="searchRelationProduct()" /></li>    </ul>    <ul style="overflow:hidden; height:310px;padding-left:80px">        <li id="CandidateProductBox">            <select id="<%=IDPrefix%>CandidateProduct" name="<%=NamePrefix %>CandidateProduct" style="width:260px;height:300px;" multiple="multiple" ></select>        </li>        <li style="margin:80px 10px 10px 10px">            <input id="AddProductAll" type="button" class="button" value=">>"  onclick="addAll('<%=IDPrefix%>CandidateProduct','<%=IDPrefix%>Product')" /><br /><br />            <input id="AddProductSingle" type="button" class="button" value=">"  onclick="addSingle('<%=IDPrefix%>CandidateProduct','<%=IDPrefix%>Product')" /><br /><br />            <input id="DropProductSingle" type="button" class="button"  value="<" onclick="dropSingle('<%=IDPrefix%>Product')" /><br /><br />            <input id="DropProductAll" type="button" class="button" value="<<"  onclick="dropAll('<%=IDPrefix%>Product')" /><br />        </li>        <li>             <asp:ListBox ID="Product" runat="server" SelectionMode="Multiple" Width="260px" Height="300px"></asp:ListBox>        </li>    </ul></div><div class="add" id="ContentArticle"  style="display:none">		<ul class="search">		<li><asp:DropDownList ID="ArticleClassID" runat="server" /> 标题：<XueFu:TextBox ID="ArticleName" CssClass="input" runat="server" Height="20px" Width="200px" /> <input id="SearchAN" type="button" class="button" value=" 搜 索 " onclick="searchRelationArticle()" /></li>    </ul>	<ul style="overflow:hidden; height:310px;padding-left:80px">	    <li id="CandidateArticleBox">	        <select id="<%=IDPrefix%>CandidateArticle" name="<%=NamePrefix %>CandidateArticle" style="width:260px;height:300px;" multiple="multiple"></select>        </li>        <li style="margin:80px 10px 10px 10px">            <input id="AddArticleAll" type="button" class="button" value=">>" onclick="addAll('<%=IDPrefix%>CandidateArticle','<%=IDPrefix%>Article')" /><br /><br />            <input id="AddArticleSingle" type="button" class="button" value=">" onclick="addSingle('<%=IDPrefix%>CandidateArticle','<%=IDPrefix%>Article')" /><br /><br />            <input id="DropArticleSingle" type="button" class="button" value="<" onclick="dropSingle('<%=IDPrefix%>Article')" /><br /><br />            <input id="DropArticleAll" type="button" class="button" value="<<" onclick="dropAll('<%=IDPrefix%>Article')" /><br />        </li>        <li>            <asp:ListBox ID="Article" runat="server" SelectionMode="Multiple" Width="260px" Height="300px"></asp:ListBox>        </li>	</ul>	</div><ul><XueFu:Hint ID="Hint" runat="server"/></ul><div class="action">    <asp:Button CssClass="button" ID="SubmitButton" Text=" 确 定 " runat="server"  OnClick="SubmitButton_Click" OnClientClick="return checkProduct()"/></div>
<script type="text/javascript">
$("input[name='AllBrandID']").change(function(){
    if($(this).is(":checked")){
	    $("input[data-type='"+$(this).val()+"']").prop("checked",true);
    }else{
	    $("input[data-type='"+$(this).val()+"']").prop("checked",false);
    }
})
$("input[name='BrandID']").change(function(){
    if($(this).is(":checked")){
        if($("input[name='BrandID']:not(:checked)").length <= 0){
	        $("input[name='AllBrandID']").prop("checked",true);
	    }
    }else{
	    $("input[name='AllBrandID']").prop("checked",false);
    }
})
$(function(){
	$("#CompanyName").bigAutocomplete({
	    width:"400px",
		url:"Ajax.aspx?Action=SearchCompanyName",
		callback:function(data){
		    $("#CompanyId").val(data.result.Id);
		}
	});
})
</script>
</asp:Content>
