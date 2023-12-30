using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataSetTableAdapters;
using System.Data;

public partial class Profesor_AsignarNotas : System.Web.UI.Page
{
    AsignacionTableAdapter AsignacionTable = new AsignacionTableAdapter();
    ProfesorCursoTableAdapter ProfesorCursoTable = new ProfesorCursoTableAdapter();

    protected bool ZonaEsEditar { get; set; } = false;
    protected bool FinalEsEditar { get; set; } = false;
    protected bool EsValidada { get; set; } = false;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                string dpiProfesor = Session["dpiProfesor"].ToString();
                DataTable tablaCursos = ProfesorCursoTable.GetAsignacionCurso(dpiProfesor);
                if (tablaCursos.Rows.Count == 0)
                {
                    Response.Write("<script>alert('Tiene que asignarse cursos')</script>");
                    DropDownListActualizar.Enabled = false;
                    ButtonListar.Enabled = false;
                }
                else
                {
                    DropDownListCurso.DataSource = tablaCursos;
                    DropDownListCurso.DataValueField = "CodigoCurso";
                    DropDownListCurso.DataTextField = "Curso";
                    DropDownListCurso.DataBind();

                    DropDownListCiclo.DataSource = tablaCursos;
                    DropDownListCiclo.DataValueField = "CodigoCiclo";
                    DropDownListCiclo.DataTextField = "Ciclo";
                    DropDownListCiclo.DataBind();

                    CargarTablaAsignacion();
                }
            }
            catch (Exception)
            {
            }
        }
    }

    protected void CargarTablaAsignacion()
    {
        string dpiProfesor = Session["dpiProfesor"].ToString();
        string codigoCurso = DropDownListCurso.SelectedValue;
        DataTable tablaAsignacion = AsignacionTable.GetAsignacionProfesor(dpiProfesor,codigoCurso);
        if (tablaAsignacion.Rows.Count == 0)
        {
            Response.Write("<script>alert('No hay alumnos')</script>");
        }
        else
        {
            GridViewAsignacion.DataSource = tablaAsignacion;
            GridViewAsignacion.DataBind();
        }
    }

    protected void DropDownListCurso_SelectedIndexChanged(object sender, EventArgs e)
    {
        CargarTablaAsignacion();
    }

    protected void DropDownListCiclo_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void ButtonListar_Click(object sender, EventArgs e)
    {
        string actualizar = DropDownListActualizar.SelectedValue;
        switch (actualizar)
        {
            case "Zona":
                ZonaEsEditar = true;
                FinalEsEditar = false;
                break;

            case "Final":
                ZonaEsEditar = false;
                FinalEsEditar = true;
                break;
        }

        CargarTablaAsignacion();
        ButtonValidar.Visible = true;
        ButtonListar.Enabled = false;
        ButtonCancelarListado.Visible = true;
        DropDownListActualizar.Enabled = false;
        DropDownListCurso.Enabled = false;
        DropDownListCiclo.Enabled = false;
    }

    protected void ButtonValidar_Click(object sender, EventArgs e)
    {
        bool existeString = false, sumaIncorrecta = false;
        foreach (GridViewRow row in GridViewAsignacion.Rows)
        {
            string textoZona = (row.FindControl("textBoxZona") as TextBox).Text;
            string textoFinal = (row.FindControl("textBoxFinal") as TextBox).Text;
            int numeroZona = 0, numeroFinal = 0;
            if (!(int.TryParse(textoZona, out numeroZona) &&
               int.TryParse(textoFinal, out numeroFinal)))
            {
                existeString = true;
                break;
            }
            else if( (numeroZona + numeroFinal) > 100 )
            {
                sumaIncorrecta = true;
                break;
                
            }
        }

        if (existeString) Response.Write("<script>alert('Datos no validos')</script>");
        else if(sumaIncorrecta) Response.Write("<script>alert('Suma incorrecta')</script>");
        else
        {
            ButtonValidar.Visible = false;
            ButtonGuardarListado.Visible = true;
            EsValidada = true;
            string actualizar = DropDownListActualizar.SelectedValue;
            switch (actualizar)
            {
                case "Zona":
                    ZonaEsEditar = true;
                    FinalEsEditar = false;
                    break;

                case "Final":
                    ZonaEsEditar = false;
                    FinalEsEditar = true;
                    break;
            }
        }
    }

    protected void ButtonGuardarListado_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in GridViewAsignacion.Rows)
        {
            int zona = Convert.ToInt32((row.FindControl("textBoxZona") as TextBox).Text);
            int final = Convert.ToInt32((row.FindControl("textBoxFinal") as TextBox).Text);
            int total = zona + final;
            string codigo = (row.FindControl("labelCodigo") as Label).Text;
            string resultado = "";
            if (total > 61) resultado = "Aprobado";
            else resultado = "Reprobado";

            AsignacionTable.ActualizarNota(zona, final, total, resultado, Convert.ToInt32(codigo));
        }
        RestablecerListado();
        Response.Write("<script>alert('Registros actualizados')</script>");
    }

    protected void ButtonCancelarListado_Click(object sender, EventArgs e)
    {
        RestablecerListado();
    }

    protected void RestablecerListado()
    {
        ButtonGuardarListado.Visible = false;
        ButtonCancelarListado.Visible = false;
        ButtonValidar.Visible = false;
        ButtonListar.Enabled = true;
        DropDownListCurso.Enabled = true;
        DropDownListCiclo.Enabled = true;
        DropDownListActualizar.Enabled = true;
        ZonaEsEditar = false;
        FinalEsEditar = false;
        EsValidada = false;
        CargarTablaAsignacion();
    }
}