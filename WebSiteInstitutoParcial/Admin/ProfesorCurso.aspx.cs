using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DataSetTableAdapters;

public partial class Admin_ProfesorCurso : System.Web.UI.Page
{
    ProfesorTableAdapter ProfesorTable = new ProfesorTableAdapter();
    ProfesorCursoTableAdapter ProfesorCursoTable = new ProfesorCursoTableAdapter();
    CursoTableAdapter CursoTable = new CursoTableAdapter();
    CicloTableAdapter CicloTable = new CicloTableAdapter();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DropDownListCurso.DataSource = CursoTable.GetCursos();
            DropDownListCurso.DataValueField = "Codigo";
            DropDownListCurso.DataTextField = "Curso";
            DropDownListCurso.DataBind();

            DropDownListCiclo.DataSource = CicloTable.GetCiclos();
            DropDownListCiclo.DataValueField = "Codigo";
            DropDownListCiclo.DataTextField = "Ciclo";
            DropDownListCiclo.DataBind();

            CargarTablaProfesor();
            CargarTablaProfesorCurso();
        }
    }

    protected void CargarTablaProfesor()
    {
        GridViewProfesor.DataSource = ProfesorTable.GetProfesores();
        GridViewProfesor.DataBind();
    }

    protected void CargarTablaProfesorCurso()
    {
        GridViewProfesorCurso.DataSource = ProfesorCursoTable.GetProfesorCurso();
        GridViewProfesorCurso.DataBind();
    }

    protected void GridViewProfesor_SelectedIndexChanged(object sender, EventArgs e)
    {
        int indice = GridViewProfesor.SelectedIndex;
        TextBoxProfesor.Text = (GridViewProfesor.Rows[indice].FindControl("labelNombre") as Label).Text + " " +
            (GridViewProfesor.Rows[indice].FindControl("labelApellido") as Label).Text;
    }

    protected void Restablecer()
    {
        TextBoxProfesor.Text = "";
        panelActualizar.Visible = false;
        panelGuardar.Visible = true;
        GridViewProfesor.SelectedIndex = -1;
    }

    protected void ButtonGuardar_Click(object sender, EventArgs e)
    {
        int indice = GridViewProfesor.SelectedIndex;
        if (indice != -1)
        {
            string dpi = (GridViewProfesor.Rows[indice].FindControl("labelDPI") as Label).Text;
            string codigoCurso = DropDownListCurso.SelectedValue;
            string codigoCiclo = DropDownListCiclo.SelectedValue;
            DataTable tabla = ProfesorCursoTable.ExisteAsignacion(Convert.ToInt32(codigoCiclo), codigoCurso);
            if (tabla.Rows.Count == 0)
            {
                try
                {
                    ProfesorCursoTable.AgregarProfesorCurso(DateTime.Now, Convert.ToInt32(codigoCiclo), dpi, codigoCurso);
                    Restablecer();
                    CargarTablaProfesorCurso();
                    Response.Write("<script>alert('Registro ingresado')</script>");
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
            }
            else
            {
                Response.Write("<script>alert('Operacion no valida: Existe profesor asignado al curso en el mismo ciclo')</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('Seleccione profesor')</script>");
        }
    }

    protected void GridViewProfesorCurso_RowEditing(object sender, GridViewEditEventArgs e)
    {
        string codigoProfesorCurso = (GridViewProfesorCurso.Rows[e.NewEditIndex].FindControl("labelCodigo") as Label).Text;
        DataTable tablaProfesorCurso = ProfesorCursoTable.GetProfesorCursoPorCodigo(Convert.ToInt32(codigoProfesorCurso));

        if (tablaProfesorCurso.Rows.Count == 1)
        {
            TextBoxProfesor.Text = tablaProfesorCurso.Rows[0]["Nombre"].ToString() + " " +
                tablaProfesorCurso.Rows[0]["Apellido"].ToString();
            DropDownListCurso.SelectedValue = tablaProfesorCurso.Rows[0]["CodigoCurso"].ToString();
            DropDownListCiclo.SelectedValue = tablaProfesorCurso.Rows[0]["CodigoCiclo"].ToString();

            string dpi = tablaProfesorCurso.Rows[0]["DPI"].ToString();
            int seleccionarIndice = -1;
            foreach (GridViewRow row in GridViewProfesor.Rows)
            {
                if ((row.FindControl("labelDpi") as Label).Text == dpi)
                {
                    seleccionarIndice = row.RowIndex;
                    break;
                }
            }
            GridViewProfesor.SelectedIndex = seleccionarIndice;

            panelActualizar.Visible = true;
            panelGuardar.Visible = false;
        }
    }

    protected void ButtonActualizar_Click(object sender, EventArgs e)
    {
        int indice = GridViewProfesor.SelectedIndex;
        if (indice != -1)
        {
            string dpi = (GridViewProfesor.Rows[indice].FindControl("labelDPI") as Label).Text;
            string codigoCurso = DropDownListCurso.SelectedValue;
            string codigoCiclo = DropDownListCiclo.SelectedValue;
            DataTable tabla = ProfesorCursoTable.ExisteAsignacion(Convert.ToInt32(codigoCiclo), codigoCurso);
            if (tabla.Rows.Count == 0)
            {
                try
                {
                    ProfesorCursoTable.AgregarProfesorCurso(DateTime.Now, Convert.ToInt32(codigoCiclo), dpi, codigoCurso);
                    Restablecer();
                    CargarTablaProfesorCurso();
                    Response.Write("<script>alert('Registro ingresado')</script>");
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
            }
            else
            {
                Response.Write("<script>alert('Operacion no valida: Existe profesor asignado al curso en el mismo ciclo')</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('Seleccione profesor')</script>");
        }
    }

    protected void GridViewProfesorCurso_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string item = (e.Row.FindControl("labelCodigo") as Label).Text + " - " +
                            (e.Row.FindControl("labelCurso") as Label).Text + " - " +
                            (e.Row.FindControl("labelCiclo") as Label).Text + " - " +
                            (e.Row.FindControl("labelNombre") as Label).Text + " " +
                            (e.Row.FindControl("labelApellido") as Label).Text;
            foreach (ImageButton button in e.Row.Cells[7].Controls.OfType<ImageButton>())
            {
                if (button.CommandName == "Delete")
                {
                    button.Attributes["onclick"] = "if(!confirm('¿Desea eliminar el registro: " + item + "?')){ return false; };";
                }
            }
        }
    }

    protected void GridViewProfesorCurso_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string codigo = (GridViewProfesorCurso.Rows[e.RowIndex].FindControl("labelCodigo") as Label).Text;
        ProfesorCursoTable.EliminarTempProfesorCurso(Convert.ToInt32(codigo));
        CargarTablaProfesorCurso();
    }

    protected void ButtonCancelar_Click(object sender, EventArgs e)
    {
        Restablecer();
    }
}