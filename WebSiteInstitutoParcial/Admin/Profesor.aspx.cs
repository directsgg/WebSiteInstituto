using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DataSetTableAdapters;

public partial class Admin_Profesor : System.Web.UI.Page
{
    DepartamentoTableAdapter DepartamentoTable = new DepartamentoTableAdapter();
    ProfesorTableAdapter ProfesorTable = new ProfesorTableAdapter();
    MunicipioTableAdapter MunicipioTable = new MunicipioTableAdapter();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DropDownListDepartamento.DataSource = DepartamentoTable.GetDepartamentos();
            DropDownListDepartamento.DataValueField = "Codigo";
            DropDownListDepartamento.DataTextField = "Departamento";
            DropDownListDepartamento.DataBind();
            ActualizarDropDowListMunicipio();

            CargarTablaProfesor();
        }
    }

    protected void CargarTablaProfesor()
    {
        GridViewProfesor.DataSource = ProfesorTable.GetProfesores(); 
        GridViewProfesor.DataBind();
    }

    protected void DropDownListDepartamento_SelectedIndexChanged(object sender, EventArgs e)
    {
        ActualizarDropDowListMunicipio();
    }

    protected void ActualizarDropDowListMunicipio()
    {
        int codDepartamento = int.Parse(DropDownListDepartamento.SelectedValue);
        DropDownListMunicipio.DataSource = MunicipioTable.GetMunicipiosPorCodigoDepartamento(codDepartamento);
        DropDownListMunicipio.DataValueField = "Codigo";
        DropDownListMunicipio.DataTextField = "Municipio";
        DropDownListMunicipio.DataBind();
    }

    protected void Restablecer()
    {
        TextBoxDpi.Text = "";
        TextBoxNombre.Text = "";
        TextBoxApellido.Text = "";
        TextBoxUsuario.Text = "";
        TextBoxContrasenia.Text = "";
        TextBoxDireccion.Text = "";
        TextBoxTelefono.Text = "";
        panelActualizar.Visible = false;
        panelGuardar.Visible = true;
        DropDownListDepartamento.SelectedIndex = 0;
        ActualizarDropDowListMunicipio();
        TextBoxDpi.Enabled = true;
    }

    protected void ButtonGuardar_Click(object sender, EventArgs e)
    {
        string dpi = TextBoxDpi.Text;
        string nombre = TextBoxNombre.Text;
        string apellido = TextBoxApellido.Text;
        string usuario = TextBoxUsuario.Text;
        string contrasenia = TextBoxContrasenia.Text;
        string direccion = TextBoxDireccion.Text;
        string telefono = TextBoxTelefono.Text;
        string codigoMunicipio = DropDownListMunicipio.SelectedValue;
        int numero = 0;
        double numero2 = 0;
        if (dpi.Length == 13 && double.TryParse(dpi, out numero2))
        {
            if (!string.IsNullOrEmpty(nombre))
            {
                if (!string.IsNullOrEmpty(apellido))
                {
                    if (!string.IsNullOrEmpty(usuario))
                    {
                        if (!string.IsNullOrEmpty(contrasenia))
                        {
                            if (!string.IsNullOrEmpty(direccion))
                            {
                                if (telefono.Length == 8 && int.TryParse(telefono,out numero))
                                {
                                    if (!string.IsNullOrEmpty(codigoMunicipio))
                                    {
                                        try
                                        {
                                            ProfesorTable.AgregarProfesor(dpi, nombre, apellido,
                                                direccion, telefono, usuario, contrasenia, Convert.ToInt32(codigoMunicipio));
                                            Restablecer();
                                            CargarTablaProfesor();
                                            Response.Write("<script>alert('Registro ingresado')</script>");
                                        }
                                        catch (Exception)
                                        {
                                            Response.Write("<script>alert('Ocurrio un error, porfavor intente de nuevo')</script>");
                                        }
                                    }
                                    else
                                    {
                                        Response.Write("<script>alert('Ingrese municipio')</script>");
                                    }
                                }
                                else
                                {
                                    Response.Write("<script>alert('Ingrese telefono (8 digitos)')</script>");
                                }
                            }
                            else
                            {
                                Response.Write("<script>alert('Ingrese direccion')</script>");
                            }
                        }
                        else
                        {
                            Response.Write("<script>alert('Ingrese contrasenia')</script>");
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Ingrese usuario')</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Ingrese apellido')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Ingrese nombre')</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('Ingrese dpi (13 digitos)')</script>");
        }
    }

    protected void GridViewProfesor_RowEditing(object sender, GridViewEditEventArgs e)
    {
        string dpi = (GridViewProfesor.Rows[e.NewEditIndex].FindControl("labelDPI") as Label).Text;
        DataTable tablaProfesor = ProfesorTable.GetProfesorPorDpi(dpi);

        if (tablaProfesor.Rows.Count == 1)
        {
            TextBoxDpi.Text = dpi;
            TextBoxNombre.Text = tablaProfesor.Rows[0]["Nombre"].ToString();
            TextBoxApellido.Text = tablaProfesor.Rows[0]["Apellido"].ToString();
            TextBoxUsuario.Text = tablaProfesor.Rows[0]["Usuario"].ToString();
            TextBoxContrasenia.Text = tablaProfesor.Rows[0]["Contrasenia"].ToString();
            TextBoxDireccion.Text = tablaProfesor.Rows[0]["Direccion"].ToString();
            TextBoxTelefono.Text = tablaProfesor.Rows[0]["Telefono"].ToString();
            DropDownListDepartamento.SelectedValue = tablaProfesor.Rows[0]["CodigoDepartamento"].ToString();
            ActualizarDropDowListMunicipio();
            DropDownListMunicipio.SelectedValue = tablaProfesor.Rows[0]["CodigoMunicipio"].ToString();

            panelActualizar.Visible = true;
            panelGuardar.Visible = false;
            ButtonActualizar.Visible = true;
            TextBoxDpi.Enabled = false;
        }
    }

    protected void ButtonActualizar_Click(object sender, EventArgs e)
    {
        string dpi = TextBoxDpi.Text;
        string nombre = TextBoxNombre.Text;
        string apellido = TextBoxApellido.Text;
        string usuario = TextBoxUsuario.Text;
        string contrasenia = TextBoxContrasenia.Text;
        string direccion = TextBoxDireccion.Text;
        string telefono = TextBoxTelefono.Text;
        string codigoMunicipio = DropDownListMunicipio.SelectedValue;
        int numero = 0;
        double numero2 = 0;
        if (dpi.Length == 13 && double.TryParse(dpi, out numero2))
        {
            if (!string.IsNullOrEmpty(nombre))
            {
                if (!string.IsNullOrEmpty(apellido))
                {
                    if (!string.IsNullOrEmpty(usuario))
                    {
                        if (!string.IsNullOrEmpty(contrasenia))
                        {
                            if (!string.IsNullOrEmpty(direccion))
                            {
                                if (telefono.Length == 8 && int.TryParse(telefono, out numero))
                                {
                                    if (!string.IsNullOrEmpty(codigoMunicipio))
                                    {
                                        try
                                        {
                                            ProfesorTable.ActualizarProfesor(nombre, apellido, direccion,
                                                telefono, usuario, contrasenia, Convert.ToInt32(codigoMunicipio), dpi);
                                            Restablecer();
                                            CargarTablaProfesor();
                                            Response.Write("<script>alert('Registro actualizado')</script>");
                                        }
                                        catch (Exception)
                                        {
                                            Response.Write("<script>alert('Ocurrio un error, porfavor intente de nuevo')</script>");
                                        }
                                    }
                                    else
                                    {
                                        Response.Write("<script>alert('Ingrese municipio')</script>");
                                    }
                                }
                                else
                                {
                                    Response.Write("<script>alert('Ingrese telefono (8 digitos)')</script>");
                                }
                            }
                            else
                            {
                                Response.Write("<script>alert('Ingrese direccion')</script>");
                            }
                        }
                        else
                        {
                            Response.Write("<script>alert('Ingrese contrasenia')</script>");
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Ingrese usuario')</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Ingrese apellido')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Ingrese nombre')</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('Ingrese dpi (13 digitos)')</script>");
        }
    }

    protected void GridViewProfesor_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string item = (e.Row.FindControl("labelDPI") as Label).Text + " - " +
                            (e.Row.FindControl("labelNombre") as Label).Text + " " +
                            (e.Row.FindControl("labelApellido") as Label).Text;
            foreach (ImageButton button in e.Row.Cells[9].Controls.OfType<ImageButton>())
            {
                if (button.CommandName == "Delete")
                {
                    button.Attributes["onclick"] = "if(!confirm('¿Desea eliminar el registro: " + item + "?')){ return false; };";
                }
            }
        }
    }

    protected void GridViewProfesor_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string dpi = (GridViewProfesor.Rows[e.RowIndex].FindControl("labelDPI") as Label).Text;
        ProfesorTable.EliminarTempProfesor(dpi);
        CargarTablaProfesor();
    }

    protected void ButtonCancelar_Click(object sender, EventArgs e)
    {
        Restablecer();
    }
}