﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SISMed.Consultas
{
    public partial class Show : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void edsMedicacoes_Inserted(object sender, EntityDataSourceChangedEventArgs e)
        {
            gvMedicacoes.DataBind();
        }
    }
}