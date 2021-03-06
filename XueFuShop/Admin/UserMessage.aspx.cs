using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using XueFuShop.BLL;

using XueFuShop.Common;
using XueFuShop.Models;
using XueFu.EntLib;
using XueFuShop.Pages;

namespace XueFuShop.Admin
{
    public partial class UserMessage : AdminBasePage
    {
        protected int classID = 0;

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            base.CheckAdminPower("DeleteUserMessage", PowerCheckType.Single);
            string intsForm = RequestHelper.GetIntsForm("SelectID");
            if (intsForm != string.Empty)
            {
                UserMessageBLL.DeleteUserMessage(intsForm, 0);
                AdminLogBLL.AddAdminLog(ShopLanguage.ReadLanguage("DeleteRecord"), ShopLanguage.ReadLanguage("UserMessage"), intsForm);
                ScriptHelper.Alert(ShopLanguage.ReadLanguage("DeleteOK"), RequestHelper.RawUrl);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.Page.IsPostBack)
        {
            base.CheckAdminPower("ReadUserMessage", PowerCheckType.Single);
            this.classID = RequestHelper.GetQueryString<int>("MessageClass");
            UserMessageSeachInfo userMessage = new UserMessageSeachInfo();
            userMessage.MessageClass = RequestHelper.GetQueryString<int>("MessageClass");
            userMessage.Title = RequestHelper.GetQueryString<string>("Title");
            userMessage.StartPostDate = RequestHelper.GetQueryString<DateTime>("StartPostDate");
            userMessage.EndPostDate = ShopCommon.SearchEndDate(RequestHelper.GetQueryString<DateTime>("EndPostDate"));
            userMessage.UserName = RequestHelper.GetQueryString<string>("UserName");
            userMessage.IsHandler = RequestHelper.GetQueryString<int>("IsHandler");
            this.MessageClass.Text = RequestHelper.GetQueryString<string>("MessageClass");
            this.Title.Text = RequestHelper.GetQueryString<string>("Title");
            this.StartPostDate.Text = RequestHelper.GetQueryString<string>("StartPostDate");
            this.EndPostDate.Text = RequestHelper.GetQueryString<string>("EndPostDate");
            this.UserName.Text = RequestHelper.GetQueryString<string>("UserName");
            this.IsHandler.Text = RequestHelper.GetQueryString<string>("IsHandler");
            base.BindControl(UserMessageBLL.SearchUserMessageList(base.CurrentPage, base.PageSize, userMessage, ref this.Count), this.RecordList, this.MyPager);
        }
    }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            ResponseHelper.Redirect(((((("UserMessage.aspx?Action=search&" + "IsHandler=" + this.IsHandler.Text + "&") + "MessageClass=" + this.MessageClass.Text + "&") + "Title=" + this.Title.Text + "&") + "StartPostDate=" + this.StartPostDate.Text + "&") + "EndPostDate=" + this.EndPostDate.Text + "&") + "UserName=" + this.UserName.Text);
        }
    }
}
