using SISMed.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SISMed.Consultas
{
    public partial class Edit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void edsConsulta_Updated(object sender, EntityDataSourceChangedEventArgs e)
        {
            Consulta c = e.Entity as Consulta;
            Response.Redirect(string.Format("./Show.aspx?id={0}&success=Q29uc3VsdGEgYXR1YWxpemFkYSBjb20gc3VjZXNzby4=", c.Id));
        }
    }
}