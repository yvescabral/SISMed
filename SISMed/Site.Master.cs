using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SISMed
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*
            var userId = Session["UsuarioId"] ?? "";
            if (string.IsNullOrWhiteSpace(userId.ToString()))
            {
                Response.Redirect(ResolveUrl("~/Login/Default.aspx?redirect=" + Request.RawUrl));
            }
            */
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            /*
            Session.Remove("UsuarioId");
            Response.Redirect("/Login/Default.aspx");
            */
            FormsAuthentication.SignOut();
            Response.Redirect("~/Login.aspx");
        }

        protected void Menu_MenuItemDataBound(object sender, MenuEventArgs e)
        {
            /*
            SiteMapNode item = e.Item.DataItem as SiteMapNode;
            if (item != null && !string.IsNullOrWhiteSpace(Session["TipoDeUsuarioId"].ToString()))
            {
                if (string.IsNullOrEmpty(item["userTypeId"]) || int.Parse(Session["TipoDeUsuarioId"].ToString()) < int.Parse(item["userTypeId"].ToString()))
                {
                    (sender as Menu).Items.Remove(e.Item);
                }
            }
            */
            SiteMapNode item = e.Item.DataItem as SiteMapNode;
            if (item != null && !String.IsNullOrWhiteSpace(item["userRole"]) && !Roles.IsUserInRole(item["userRole"]))
            {
                (sender as Menu).Items.Remove(e.Item);
            }
        }
    }
}