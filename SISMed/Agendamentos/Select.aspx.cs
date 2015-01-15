using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SISMed.Agendamentos
{
    public partial class Select : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Calendar.SelectedDate == DateTime.Parse("01/01/0001"))
                Calendar.SelectedDate = DateTime.Today;
        }

        protected void Calendar_SelectionChanged(object sender, EventArgs e)
        {
            gvHorariosDeAtendimento.SelectRow(-1);
            pnlProximo.Visible = false;
        }

        protected void gvHorariosDeAtendimento_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (gvHorariosDeAtendimento.SelectedIndex != -1)
            {
                pnlProximo.Visible = true;
                string medicoId = (gvHorariosDeAtendimento.SelectedRow.FindControl("fvMedico") as FormView).SelectedValue.ToString();
                string date = Calendar.SelectedDate.ToShortDateString();
                string hour = (gvHorariosDeAtendimento.SelectedRow.FindControl("lblHoraInicio") as Label).Text;
                lnkProximo.NavigateUrl = string.Format("~/Agendamentos/New.aspx?medicoId={0}&horario={1} {2}", medicoId, date, hour);
            }
        }

        protected void Calendar_DayRender(object sender, DayRenderEventArgs e)
        {
            DateTime day = e.Day.Date;
            DateTime today = DateTime.Today;
            if (day.CompareTo(today) < 0)
            {
                e.Cell.CssClass = "past-day";
                e.Day.IsSelectable = false;
            }
        }
    }
}