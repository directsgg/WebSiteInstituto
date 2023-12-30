using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataSetTableAdapters;
using System.Data;
public partial class Alumno_AsignarCurso : System.Web.UI.Page
{
    ProfesorCursoTableAdapter ProfesorCursoTable = new ProfesorCursoTableAdapter();
    AsignacionTableAdapter AsignacionTable = new AsignacionTableAdapter();
    AlumnoTableAdapter AlumnoTable = new AlumnoTableAdapter();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                string codigoAlumno = Session["codigoAlumno"].ToString();
                DataTable tablaAlumnoAsignado = AlumnoTable.GetAlumnoAsignado(codigoAlumno);
                if (tablaAlumnoAsignado.Rows.Count == 1)
                {
                    Response.Write("<script>alert('Ya se asigno cursos')</script>");
                    GridViewProfesorCurso.Visible = false;
                    ButtonGuardar.Visible = false;
                }
                else
                {
                    CargarTablaProfesorCurso();
                }
            }
            catch (Exception)
            {
            }
        }
    }

    protected void CargarTablaProfesorCurso()
    {
        GridViewProfesorCurso.DataSource = ProfesorCursoTable.GetProfesorCurso();
        GridViewProfesorCurso.DataBind();
    }

    protected void ButtonGuardar_Click(object sender, EventArgs e)
    {
        string codigoAlumno = Session["codigoAlumno"].ToString();
        bool asignoCurso = false;
        foreach (GridViewRow row in GridViewProfesorCurso.Rows)
        {
            if((row.FindControl("checkBoxSeleccion") as CheckBox).Checked)
            {
                int codigoProfesorCurso = Convert.ToInt32((row.FindControl("labelCodigo") as Label).Text);
                AsignacionTable.AgregarAsignacion(DateTime.Now, codigoAlumno, codigoProfesorCurso);
                asignoCurso = true;
            }
        }

        if (asignoCurso)
        {
            AlumnoTable.ActualizarAlumnoAsignado(codigoAlumno);
            GridViewProfesorCurso.Visible = false;
            ButtonGuardar.Visible = false;
            Response.Write("<script>alert('Curso(s) asignado(s) con exito')</script>");
        }
        else
        {
            Response.Write("<script>alert('Operacion no valida: debe seleccionar curso(s) para asignarse')</script>");
        }
    }
}