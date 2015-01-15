using SISMed.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SISMed.Models;
using System.Data.Objects;
using System.Data.EntityClient;

namespace SISMed.Usuario
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void edsUsuario_Updated(object sender, EntityDataSourceChangedEventArgs e)
        {
            Response.Redirect("./Default.aspx?success=VXN1w6FyaW8gYXR1YWxpemFkbyBjb20gc3VjZXNzby4=");
        }

        protected void edsMudarSenha_Updating(object sender, EntityDataSourceChangingEventArgs e)
        {
            SISMed.Models.Usuario novo = e.Entity as SISMed.Models.Usuario;

            using (var context = new SISMedEntities(e.Context.Connection as EntityConnection))
            {
                var antigo = context.Pessoas.OfType<SISMed.Models.Usuario>().First(c => c.Id == novo.Id);
                TextBox txbSenhaAtual = fvMudarSenha.FindControl("txbSenhaAtual") as TextBox;

                if (antigo.Senha == Password.HashPassword(txbSenhaAtual.Text))
                {
                    novo.Senha = Password.HashPassword(novo.Senha);
                    Response.Redirect("./Default.aspx?successPassword=U2VuaGEgYWx0ZXJhZGEgY29tIHN1Y2Vzc28u");
                }
                else
                {
                    Response.Redirect("./Default.aspx?errorPassword=QSBzZW5oYSBhdHVhbCBlc3TDoSBpbmNvcnJldGEu");
                    e.Cancel = true;
                }
            }
        }

        protected void edsHorariosDeAtendimento_Inserted(object sender, EntityDataSourceChangedEventArgs e)
        {
            gvHorariosDeAtendimento.DataBind();
        }
    }
}