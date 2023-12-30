using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataSetTableAdapters;
using System.Data;

public partial class Admin_Alumno : System.Web.UI.Page
{
    DepartamentoTableAdapter DepartamentoTable = new DepartamentoTableAdapter();
    MunicipioTableAdapter MunicipioTable = new MunicipioTableAdapter();
    AlumnoTableAdapter AlumnoTable = new AlumnoTableAdapter();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DropDownListDepartamento.DataSource = DepartamentoTable.GetDepartamentos();
            DropDownListDepartamento.DataValueField = "Codigo";
            DropDownListDepartamento.DataTextField = "Departamento";
            DropDownListDepartamento.DataBind();
            ActualizarDropDowListMunicipio();

            CargarTablaAlumno();
        }
    }

    protected void CargarTablaAlumno()
    {
        DataTable dataTable = AlumnoTable.GetAlumnos();
        GridViewAlumno.DataSource = dataTable;
        GridViewAlumno.DataBind();
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
        TextBoxCodigo.Text = "";
        TextBoxNombre.Text = "";
        TextBoxApellido.Text = "";
        TextBoxUsuario.Text = "";
        TextBoxContrasenia.Text = "";
        TextBoxDireccion.Text = "";
        TextBoxTelefono.Text = "";
        TextBoxCorreo.Text = "";
        TextBoxFNac.Text = "";
        panelActualizar.Visible = false;
        panelGuardar.Visible = true;
        DropDownListDepartamento.SelectedIndex = 0;
        ActualizarDropDowListMunicipio();
        TextBoxCodigo.Enabled = true;
    }

    protected void ButtonGuardar_Click(object sender, EventArgs e)
    {
        int contador = (int)AlumnoTable.ContarRegistros() + 10000;
        string codigo = contador.ToString();
        string nombre = TextBoxNombre.Text;
        string apellido = TextBoxApellido.Text;
        string usuario = TextBoxUsuario.Text;
        string contrasenia = TextBoxContrasenia.Text;
        string direccion = TextBoxDireccion.Text;
        string telefono = TextBoxTelefono.Text;
        string correo = TextBoxCorreo.Text;
        string fechaNacimiento = TextBoxFNac.Text;
        string codigoMunicipio = DropDownListMunicipio.SelectedValue;
        int numero = 0;
        if (codigo.Length == 5 && int.TryParse(codigo, out numero))
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
                                        if (!string.IsNullOrEmpty(fechaNacimiento))
                                        {
                                            if (!string.IsNullOrEmpty(correo))
                                            {
                                                try
                                                {
                                                    AlumnoTable.AgregarAlumno(codigo, nombre, apellido, fechaNacimiento,
                                                        direccion, correo, telefono, usuario, contrasenia, Convert.ToInt32(codigoMunicipio));
                                                    Restablecer();
                                                    CargarTablaAlumno();
                                                    Response.Write("<script>alert('Registro ingresado')</script>");
                                                }
                                                catch (Exception)
                                                {
                                                    Response.Write("<script>alert('Ocurrio un error, porfavor intente de nuevo')</script>");
                                                }
                                            }
                                            else
                                            {
                                                Response.Write("<script>alert('Ingrese correo')</script>");
                                            }
                                        }
                                        else
                                        {
                                            Response.Write("<script>alert('Ingrese fecha de nacimiento')</script>");
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

    protected void GridViewAlumno_RowEditing(object sender, GridViewEditEventArgs e)
    {
        string codigo = (GridViewAlumno.Rows[e.NewEditIndex].FindControl("labelCodigo") as Label).Text;
        DataTable tablaAlumno = AlumnoTable.GetAlumnoPorCodigo(codigo);

        if (tablaAlumno.Rows.Count == 1)
        {
            TextBoxCodigo.Text = codigo;
            TextBoxNombre.Text = tablaAlumno.Rows[0]["Nombre"].ToString();
            TextBoxApellido.Text = tablaAlumno.Rows[0]["Apellido"].ToString();
            TextBoxUsuario.Text = tablaAlumno.Rows[0]["Usuario"].ToString();
            TextBoxContrasenia.Text = tablaAlumno.Rows[0]["Contrasenia"].ToString();
            TextBoxDireccion.Text = tablaAlumno.Rows[0]["Direccion"].ToString();
            TextBoxTelefono.Text = tablaAlumno.Rows[0]["Telefono"].ToString();
            TextBoxCorreo.Text = tablaAlumno.Rows[0]["Correo"].ToString();
            TextBoxFNac.Text = string.Format("{0:yyyy-MM-dd}", Convert.ToDateTime(tablaAlumno.Rows[0]["FechaNacimiento"]));
            DropDownListDepartamento.SelectedValue = tablaAlumno.Rows[0]["CodigoDepartamento"].ToString();
            ActualizarDropDowListMunicipio();
            DropDownListMunicipio.SelectedValue = tablaAlumno.Rows[0]["CodigoMunicipio"].ToString();

            panelActualizar.Visible = true;
            panelGuardar.Visible = false;
            ButtonActualizar.Visible = true;
            TextBoxCodigo.Enabled = false;
        }
    }

    protected void ButtonActualizar_Click(object sender, EventArgs e)
    {
        
        string codigo = TextBoxCodigo.Text;
        string nombre = TextBoxNombre.Text;
        string apellido = TextBoxApellido.Text;
        string usuario = TextBoxUsuario.Text;
        string contrasenia = TextBoxContrasenia.Text;
        string direccion = TextBoxDireccion.Text;
        string telefono = TextBoxTelefono.Text;
        string correo = TextBoxCorreo.Text;
        string fechaNacimiento = TextBoxFNac.Text;
        string codigoMunicipio = DropDownListMunicipio.SelectedValue;
        int numero = 0;
        if (codigo.Length == 5 && int.TryParse(codigo, out numero))
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
                                        if (!string.IsNullOrEmpty(fechaNacimiento))
                                        {
                                            if (!string.IsNullOrEmpty(correo))
                                            {
                                                try
                                                {
                                                    AlumnoTable.ActualizarAlumno(nombre, apellido, fechaNacimiento,
                                                        direccion, correo, telefono, usuario, contrasenia, Convert.ToInt32(codigoMunicipio), codigo);
                                                    Restablecer();
                                                    CargarTablaAlumno();
                                                    Response.Write("<script>alert('Registro actualizado')</script>");
                                                }
                                                catch (Exception)
                                                {
                                                    Response.Write("<script>alert('Ocurrio un error, porfavor intente de nuevo')</script>");
                                                }
                                            }
                                            else
                                            {
                                                Response.Write("<script>alert('Ingrese correo')</script>");
                                            }
                                        }
                                        else
                                        {
                                            Response.Write("<script>alert('Ingrese fecha de nacimiento')</script>");
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

    protected void GridViewAlumno_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string item = (e.Row.FindControl("labelCodigo") as Label).Text + " - " +
                            (e.Row.FindControl("labelNombre") as Label).Text + " " +
                            (e.Row.FindControl("labelApellido") as Label).Text;
            foreach (ImageButton button in e.Row.Cells[12].Controls.OfType<ImageButton>())
            {
                if (button.CommandName == "Delete")
                {
                    button.Attributes["onclick"] = "if(!confirm('¿Desea eliminar el registro: " + item + "?')){ return false; };";
                }
            }
        }
    }

    protected void GridViewAlumno_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string codigo = (GridViewAlumno.Rows[e.RowIndex].FindControl("labelCodigo") as Label).Text;
        AlumnoTable.EliminarTempAlumno(codigo);
        CargarTablaAlumno();
    }

    protected void ButtonCancelar_Click(object sender, EventArgs e)
    {
        Restablecer();
    }
}