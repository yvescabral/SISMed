using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SISMed
{
    public partial class Site_Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*
            var userId = Session["UsuarioId"] ?? "";
            var userTypeId = Session["TipoDeUsuarioId"] ?? "";

            if (string.IsNullOrWhiteSpace(userId.ToString()))
            {
                Response.Redirect(ResolveUrl("~/Login/Default.aspx?redirect=" + Request.RawUrl));
            }
            else
            {
                if (string.IsNullOrWhiteSpace(userTypeId.ToString()) || userTypeId.ToString() != "4")
                    Response.Redirect(ResolveUrl("~/Dashboard/Default.aspx"));
            }
            */
            Clock.Text = DateTime.Now.ToString("h:mm:ss tt");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            /*
            Session.Remove("UsuarioId");
            Response.Redirect("/Login/Default.aspx");
            */
            System.Web.Security.FormsAuthentication.SignOut();
        }
    }
}