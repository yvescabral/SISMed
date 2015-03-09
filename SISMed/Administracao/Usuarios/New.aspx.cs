﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SISMed.Models;
using SISMed.App_Code;
using System.Web.Security;

namespace SISMed.Administracao.Usuarios
{
    public partial class New : System.Web.UI.Page
    {
        public bool b = false;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void edsUsuario_Inserting(object sender, EntityDataSourceChangingEventArgs e)
        {
            SISMed.Models.Usuario u = e.Entity as SISMed.Models.Usuario;
            u.Senha = Password.HashPassword(u.Senha);
        }

        protected void edsUsuario_Inserted(object sender, EntityDataSourceChangedEventArgs e)
        {
            SISMed.Models.Usuario u = e.Entity as SISMed.Models.Usuario;
            if (u.TipoDeUsuarioId > 1)
            {
                sdsMedico.InsertParameters.Add(new Parameter("Usuario_Id", TypeCode.String, u.Id.ToString()));
                sdsMedico.Insert();
            }
            Response.Redirect(string.Format("./Show.aspx?id={0}&success=VXN1w6FyaW8gY2FkYXN0cmFkbyBjb20gc3VjZXNzby4=", u.Id));
        }

        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {
            string tipo = ((DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("TipoDeUsuarioDropDown")).SelectedValue;
            string usuario = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("UserName")).Text;
            if (tipo == "Administrador")
            {
                foreach (string s in Roles.GetAllRoles())
                    Roles.AddUserToRole(usuario, s);
            }
            else
            {
                Roles.AddUserToRole(usuario, tipo);
            }
        }

    }
}