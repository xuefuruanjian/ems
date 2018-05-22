﻿<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.Master" AutoEventWireup="true" CodeBehind="CourseReport.aspx.cs" Inherits="XueFuShop.Admin.CourseReport" Title="无标题页" %>
<%@ Import Namespace="XueFu.EntLib" %>
<asp:Content ID="MasterContent" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
<link rel="stylesheet" href="Style/jquery.bigautocomplete.css" type="text/css" />
<script type="text/javascript" src="http://cdn.bootcss.com/jquery/1.12.1/jquery.min.js"></script>
<script type="text/javascript" src="Js/jquery.bigautocomplete.js"></script>
        <td class="left">公司名称</td>
        <td>
        <td class="left">课程名称</td>
        <td>
        <td class="left">时间段</td>
        <td>
        <td style="text-align:center;">状态</td>
        <td>
            <ul class="multiple" data-action="State">
                <li data-value="<%=(int)UserState.Normal %>"><span>正常</span></li>
                <li data-value="<%=(int)UserState.Free %>"><span>不考核</span></li>
                <li data-value="<%=(int)UserState.Other %>"><span>其他</span></li>
                <li data-value="<%=(int)UserState.Frozen %>"><span>冻结</span></li>
                <li data-value="<%=(int)UserState.Del %>"><span>删除</span></li>
            </ul>
        <td class="left">员工组别</td>
        <td>
            </ul>
        <td class="left">学习岗位  <br><a href="javascript:SelectAll('#StudyPostNameList');">[反选]</a></td>
        <td>
	        <ul id="StudyPostNameList" class="multiple" data-action="StudyPostIdCondition">
            </ul>
        <td class="left">工作岗位 <br><a href="javascript:SelectAll('#PostNameList');">[反选]</a></td>
        <td>
            <ul id="PostNameList" class="multiple" data-action="PostIdCondition">	
            </ul>
        <td class="left" colspan="2">

<div  style="display:none;" id="ShowArea" runat="server">
</div>

<script type="text/javascript">
$(function(){
	$(window).keydown(function (e) {
		if (e.which == 13) {
			return false;
		}
	})
	
    var loadChecked = function(objid){
        var checkedValue = $("#"+objid).val();
        if(checkedValue != "" && checkedValue != null){
            $.each(checkedValue.split(','),function(i,item){
                $("[data-action='"+objid+"']").find("[data-value='"+item+"']").click();
            })
        }
        else{
            $("[data-action='"+objid+"'] li").click();
            $("#"+objid).val('');
        }
    }
    
    var loaddata = function(companyID){
        $.post("Ajax.aspx?Action=GetUserGroupJson",{CompanyID:companyID},function(data){
            $("#GroupList").html('');
		    data=JSON.parse(data);
		    $.each(data.data, function(i, item){
                $("#GroupList").append("<li data-value=\"" + item.ID + "\"><span>" + item.Name + "</span></li>")
            });
            loadChecked("GroupID");
            $("#GroupList").parent().parent().slideDown("slow");
		})
		$.post("Ajax.aspx?Action=GetStudyPostJson",{CompanyID:companyID},function(data){
		    $("#StudyPostNameList,#PostNameList").html('');
		    data=JSON.parse(data);
		    $.each(data.data, function(i, item){
                $("#StudyPostNameList,#PostNameList").append("<li data-value=\"" + item.ID + "\"><span>" + item.Name + "</span></li>")
            });
            loadChecked("StudyPostIdCondition");
            loadChecked("PostIdCondition");
		    $("#StudyPostNameList,#PostNameList").parent().parent().slideDown("slow");
		})
    }
    

	$("#CompanyName").bigAutocomplete({
	    width:"304px",
		url:"Ajax.aspx?Action=SearchCompanyName",
		callback:function(data){
		    var result=data.result;
    		$("#CompanyID").val(result.Id);
    		loaddata(result.Id);
		}
	});
	
	$("#ctl00_ContentPlaceHolder_SearchButton").click(function(){
//	    var startDate = $("#ctl00_ContentPlaceHolder_SearchStartDate").val();
//	    var endDate = $("#ctl00_ContentPlaceHolder_SearchEndDate").val();
	    if(parseInt($("#CompanyID").val()) <= 0) {
	        alert("公司数据有误，请重新选择公司");
	        return false;
	    }
	    return true;
	})
	
	
	$(".checkbox-li").on("click", ".multiple li", function(){
	    if($(this).hasClass("CheckBorder"))
	    {
		    $(this).removeClass("CheckBorder").find("b").remove();
		}
		else
		{
		    $(this).addClass("CheckBorder").append("<b>选中</b>");
		}
		
		var id = $(this).parent().data("action");
		var valueStr="";
		$(this).parent().find(".CheckBorder").each(function(){
		    valueStr = valueStr + "," + $(this).data("value");
		});
		$("#" + id).val(valueStr.substr(1));
	});
	
	if(parseInt($("#CompanyID").val()) > 0){
	    loaddata($("#CompanyID").val());
	}
	loadChecked("State");
})

var SelectAll = function(checkBoxID){
    $(checkBoxID).find("li").click();
}

function ExcelGetCatId()
{
    var url="Ajax.aspx?Action=ReportExcel&<%=RequestHelper.FilterRequestQueryString(new string[] { "Action" }) %>";
    Ajax.requestURL(url,function(data){ window.open('/xml/demo.xls');});
}
function ExcelGetCatId1()
{
    var url="Ajax.aspx?Action=ReportExcel1&<%=RequestHelper.FilterRequestQueryString(new string[] { "Action" }) %>";
    Ajax.requestURL(url,function(data){ window.open('/xml/demo.xls');});
}
    function ExcelGetCatId2() {
        var url = "Ajax.aspx?Action=ReportExcel2&<%=RequestHelper.FilterRequestQueryString(new string[] { "Action" }) %>";
        Ajax.requestURL(url, function (data) { window.open('/xml/demo.xls'); });
    }
</script>
</asp:Content>