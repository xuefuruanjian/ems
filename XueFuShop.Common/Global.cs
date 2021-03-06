using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace XueFuShop.Common
{
    public sealed class Global
    {
        public static string CopyRight = "Copyright \x00a9 XueFu Shop 2016";
        private static string dataProvider = string.Empty;
        public static string Description = "<span>本系统，开发的语言是net(C#)。无论在功能、操作人性化、运行效率、安全等级和扩展性等方面都在向上追求中。</span><br/><span>1、功能强大：主要分基础设置、商品管理、用户中心、市场营销、订单与统计五大版块，每个版块又做了很细致的深化，满足不同顾客，不同行业的各种不同的需求。</span><br/><span>2、人性化：界面设计和使用习惯都是基于为用户着想这一理念，这使我们的产品达到了极高的易用性。只需轻点鼠标+简单录入即可完成商城管理。 </span><br/><span> 3、高效性：系统采用三层结构，充分利用了缓存技术；对sql语句和相关逻辑的优化；经过多次的反复测试；大大提高了系统的反应速度。<span><br/><span>4、安全：严格的权限控制机制，让您可以精确控制到每一步的操作；操作日志的记录，可以随时查询系统的变化情况；强有力的漏洞检测（Sql注入，地址欺骗等），让系统可以免除安全隐患。</span><br/><span>";
        public static string ProductName = "上海孟特SFOS";
        public static string Version = "V1.0";

        public static string DataProvider
        {
            get
            {
                if (dataProvider == string.Empty)
                {
                    dataProvider = ConfigurationManager.AppSettings["DataProvider"];
                }
                return dataProvider;
            }
        }
    }

}
