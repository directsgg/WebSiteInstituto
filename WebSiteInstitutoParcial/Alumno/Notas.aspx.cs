using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataSetTableAdapters;
using System.Data;

public partial class Alumno_Notas : System.Web.UI.Page
{
    AsignacionTableAdapter AsignacionTable = new AsignacionTableAdapter();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CargarTablaAsignacion();
        }
    }

    protected void CargarTablaAsignacion()
    {
        try
        {
            string codigoAlumno = Session["codigoAlumno"].ToString();
            DataTable tablaAsignacion = AsignacionTable.GetAsignacionAlumno(codigoAlumno);
            if (tablaAsignacion.Rows.Count == 0)
            {
                Response.Write("<script>alert('Tiene que asignarse cursos')</script>");
                Response.Redirect("AsignarCurso.aspx");
            }
            else
            {
                GridViewAsignacion.DataSource = tablaAsignacion;
                GridViewAsignacion.DataBind();
            }
        }
        catch (Exception)
        {
        }
    }
}