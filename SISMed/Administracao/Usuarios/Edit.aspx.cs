using SISMed.App_Code;
using SISMed.Models;
using System;
using System.Collections.Generic;
using System.Data.EntityClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SISMed.Administracao.Usuarios
{
    public partial class Edit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void edsUsuario_Updating(object sender, EntityDataSourceChangingEventArgs e)
        {
            SISMed.Models.Usuario u = e.Entity as SISMed.Models.Usuario;

            using (var context = new SISMedEntities(e.Context.Connection as EntityConnection))
            {
                var antigo = context.Pessoas.OfType<SISMed.Models.Usuario>().First(c => c.Id == u.Id);
                TextBox txbSenha = fvUsuario.FindControl("SenhaTextBox") as TextBox;

                if (string.IsNullOrWhiteSpace(txbSenha.Text))
                    u.Senha = antigo.Senha;
                else
                    u.Senha = Password.HashPassword(u.Senha);
            }
        }

        protected void edsUsuario_Updated(object sender, EntityDataSourceChangedEventArgs e)
        {
            SISMed.Models.Usuario u = e.Entity as SISMed.Models.Usuario;
            Response.Redirect(string.Format("./Show.aspx?id={0}&success=VXN1w6FyaW8gYXR1YWxpemFkbyBjb20gc3VjZXNzby4=", u.Id));
        }
    }
}