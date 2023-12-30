using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPageAlumno : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["alumno"] == null) Response.Redirect("../Login.aspx");
        else labelUsuario.Text = Session["alumno"].ToString();
    }
}
