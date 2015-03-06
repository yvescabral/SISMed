using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SISMed.Pacientes
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txbNome_OnTextChanged(object sender, EventArgs e)
        {
            TextBox txb = (TextBox)sender;
            sdsFiltro.DataBind();
            listaSugerida.DataBind();
            if (listaSugerida.Items.Count > 0)
            {
                listaSugerida.Visible = true;
                listaSugerida.Rows = listaSugerida.Items.Count > 5 ? 5 : listaSugerida.Items.Count;
            }
            else
            {
                listaSugerida.Visible = false;
            }
            Filtro.Update();
        }

        
    }
}