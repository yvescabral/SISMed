using SISMed.App_Code;
using SISMed.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.EntityClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SISMed.Login
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            DataView dv = (DataView) sdsLogin.Select(new DataSourceSelectArguments());
            DataRow dr = dv.ToTable().Rows.Count > 0 ? dv.ToTable().Rows[0] : null;
            string redirectUrl = Request.QueryString["redirect"] ?? "/Dashboard/Default.aspx";

            if (dr != null && dr["Senha"].ToString().Trim() == Password.HashPassword(txbSenha.Text).Trim())
            {
                Session.Add("UsuarioId", dr["Id"]);
                Session.Add("UsuarioNome", string.Format("{0} {1}", dr["Nome"].ToString(), dr["Sobrenome"].ToString()));
                Session.Add("TipoDeUsuarioId", dr["TipoDeUsuarioId"]);
                Response.Redirect(redirectUrl);
            }

            Response.Redirect(ResolveUrl("~/Login/Default.aspx?error=true"));
        }
    }
}