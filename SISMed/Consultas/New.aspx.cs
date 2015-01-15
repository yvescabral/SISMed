using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SISMed.Models;

namespace SISMed.Consultas
{
    public partial class New : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void edsConsulta_Inserting(object sender, EntityDataSourceChangingEventArgs e)
        {
            Consulta c = e.Entity as Consulta;
            c.DataHora = DateTime.Now;
        }

        protected void edsConsulta_Inserted(object sender, EntityDataSourceChangedEventArgs e)
        {
            Consulta c = e.Entity as Consulta;

            if(!string.IsNullOrWhiteSpace(Request.QueryString["agendamento"]))
                sdsAgendamento.Update();

            Response.Redirect(string.Format("./Show.aspx?id={0}&success=Q29uc3VsdGEgY2FkYXN0cmFkYSBjb20gc3VjZXNzby4=", c.Id));
        }
    }
}