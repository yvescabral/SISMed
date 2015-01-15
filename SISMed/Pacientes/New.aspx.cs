using SISMed.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SISMed.Pacientes
{
    public partial class New : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void edsPaciente_Inserted(object sender, EntityDataSourceChangedEventArgs e)
        {
            Paciente p = e.Entity as Paciente;
            Response.Redirect(string.Format("./Show.aspx?id={0}&success=UGFjaWVudGUgY2FkYXN0cmFkbyBjb20gc3VjZXNzby4=", p.Id));
        }
    }
}