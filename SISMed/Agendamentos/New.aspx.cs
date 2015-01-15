using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SISMed.Agendamentos
{
    public partial class New : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void fvAgendamento_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            Response.Redirect("./Default.aspx?success=QWdlbmRhbWVudG8gY2FkYXN0cmFkbyBjb20gc3VjZXNzby4=");
        }
    }
}