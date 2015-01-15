using SISMed.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SISMed.Gerenciamento
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void edsSolicitacoes_Inserting(object sender, EntityDataSourceChangingEventArgs e)
        {
            Solicitacao s = e.Entity as Solicitacao;
            s.DataHora = DateTime.Now;
        }

        protected void edsSolicitacoes_Inserted(object sender, EntityDataSourceChangedEventArgs e)
        {
            Response.Redirect(string.Format("./Default.aspx?success=U29saWNpdGHDp8OjbyBjYWRhc3RyYWRhIGNvbSBzdWNlc3NvLg=="));
        }
    }
}