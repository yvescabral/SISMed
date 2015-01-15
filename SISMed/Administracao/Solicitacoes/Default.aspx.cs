using SISMed.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SISMed.Administracao.Solicitacoes
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvSolicitacoes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ToggleResolvido")
            {
                int? rowId = int.Parse(e.CommandArgument.ToString());

                if (rowId != null)
                {
                    int solicitacaoId = (int) gvSolicitacoes.DataKeys[(int)rowId].Value;
                    SISMedEntities modelo = new SISMedEntities();
                    Solicitacao solicitacao = modelo.Solicitacoes.Where(c => c.Id == solicitacaoId).First();
                    solicitacao.Resolvido = !solicitacao.Resolvido;
                    modelo.SaveChanges();

                    gvSolicitacoes.DataBind();
                }
            }
        }

        protected void ddlFiltro_SelectedIndexChanged(object sender, EventArgs e)
        {
            cxbFiltrar.Checked = true;
        }
    }
}