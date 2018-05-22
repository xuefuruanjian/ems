﻿<%@ Page Language="C#" MasterPageFile="MasterPage.Master" AutoEventWireup="true" CodeBehind="QuestionAdd.aspx.cs" Inherits="XueFuShop.Admin.QuestionAdd" Title="无标题页" %>
<asp:Content ID="MasterContent" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
<div class="position"><img src="/Admin/Style/Images/PositionIcon.png"  alt=""/>试题<%=GetAddUpdate()%></div>
<div class="add">	
            <asp:DropDownList ID="_CateId" runat="server" OnSelectedIndexChanged="_CateId_SelectedIndexChanged" AutoPostBack="True">
            </asp:DropDownList>
		<li class="left">题型：</li>
		<li class="right">
		    <asp:RadioButtonList ID="TestType" name="TestType" runat="server" RepeatDirection="Horizontal" onclick="selectTestType();o(globalIDPrefix+'Quetion').value='';">
		        <asp:ListItem Value="1" Selected="True">单项选择题</asp:ListItem>
		        <asp:ListItem Value="2">多项选择题</asp:ListItem>
		        <asp:ListItem Value="3">判断题</asp:ListItem>
		    </asp:RadioButtonList>
		</li>
	</ul>
            
                <asp:RadioButtonList ID="JudgeAnswer" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="JudgeAnswer_SelectedIndexChanged">
                    <asp:ListItem Value="1">对</asp:ListItem>
                    <asp:ListItem Value="0">错</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="不能为空" ControlToValidate="JudgeAnswer" Display="Dynamic"></asp:RequiredFieldValidator>
            </li>
<script language="javascript" type="text/javascript">
selectTestType();
function selectTestType(){
    var objs=os("name",globalNamePrefix+"TestType");
    var CompanyType=getRadioValue(objs);
    switch(CompanyType){
        case "1":
            o(globalIDPrefix+"singleTest").style.display=""; 
            o(globalIDPrefix+"MultiTest").style.display="none"; 
            o(globalIDPrefix+"PanDuanTest").style.display="none"; 
            break;
        case "2":
            o(globalIDPrefix+"singleTest").style.display="none"; 
            o(globalIDPrefix+"MultiTest").style.display=""; 
            o(globalIDPrefix+"PanDuanTest").style.display="none"; 
            break;
        case "3":
            o(globalIDPrefix+"singleTest").style.display="none"; 
            o(globalIDPrefix+"MultiTest").style.display="none"; 
            o(globalIDPrefix+"PanDuanTest").style.display=""; 
            break;
        default:
            break;
    }    
}
function checkForm()
{
    var objs=os("name",globalNamePrefix+"TestType");
    var CompanyType=getRadioValue(objs);
    var QuestionA,QuestionB,QuestionC,QuestionD,Question,Answer,CateId,CourseId
    Answer="";
    CateId=o(globalIDPrefix+"_CateId").value;
    CourseId=o(globalIDPrefix+"_CourseId").value;
    Question=o(globalIDPrefix+"Quetion").value; 
    switch(CompanyType){
        case "1":
            QuestionA=o(globalIDPrefix+"SingleA").value; 
            QuestionB=o(globalIDPrefix+"SingleB").value; 
            QuestionC=o(globalIDPrefix+"SingleC").value; 
            QuestionD=o(globalIDPrefix+"SingleD").value;             
            Answer=getRadioValue(os("name",globalNamePrefix+"SingleAnswer"));
            break;
        case "2":
            QuestionA=o(globalIDPrefix+"MultiA").value; 
            QuestionB=o(globalIDPrefix+"MultiB").value; 
            QuestionC=o(globalIDPrefix+"MultiC").value; 
            QuestionD=o(globalIDPrefix+"MultiD").value;
            if(o(globalIDPrefix+"MultiAnswerA").checked)
            {
                Answer=o(globalIDPrefix+"MultiAnswerA").value;   
            }
            if(o(globalIDPrefix+"MultiAnswerB").checked)
            {
                Answer=Answer+o(globalIDPrefix+"MultiAnswerB").value;  
            }
            if(o(globalIDPrefix+"MultiAnswerC").checked)
            {
                Answer=Answer+o(globalIDPrefix+"MultiAnswerC").value;
            }
            if(o(globalIDPrefix+"MultiAnswerD").checked)
            {
                Answer=Answer+o(globalIDPrefix+"MultiAnswerD").value;  
            }
            break;
        case "3":
            Answer=getRadioValue(os("name",globalNamePrefix+"JudgeAnswer"));
            break;
        }
        if(CateId=="-1")
        {
            alertMessage("请选择类别！");
            return false;
        }
        if(CourseId=="-1")
        {
            alertMessage("请选择课程！");
            return false;
        }
        if(Question=="")
        {
            alertMessage("题目不能为空！");
            return false;
        }
        if(CompanyType!="3")
        {
            if(QuestionA==""||QuestionB==""||QuestionC==""||QuestionD=="")
            {
                alertMessage("选项不能为空！");
                return false;
            }
            if(QuestionA==QuestionB||QuestionA==QuestionC||QuestionA==QuestionD||QuestionB==QuestionC||QuestionB==QuestionD||QuestionC==QuestionD)
            {
                alertMessage("选项重复！");
                return false;
            }
        }
        else
        {
            if(Answer == "0" && o(globalIDPrefix+"JudgeRightAnswer").value == "")
            {
                alertMessage("请填写正确答案！");
                return false;
            }
        }
        if(Answer=="")
        {
            alertMessage("请选择标准答案！");
            return false;
        }
        if(CompanyType=="2")
        {
            if(Answer.length<=1)
            {
                alertMessage("多项选择题的答案不能为一个！");
                return false;
            }
        }
}
</script>
</asp:Content>