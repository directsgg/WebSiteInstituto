using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DataSetTableAdapters;

public partial class Login : System.Web.UI.Page
{
    AdministradorTableAdapter AdministradorTable = new AdministradorTableAdapter();
    ProfesorTableAdapter ProfesorTable = new ProfesorTableAdapter();
    AlumnoTableAdapter AlumnoTable = new AlumnoTableAdapter();


    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Clear();
        alertaError.Visible = false;
    }

    protected void ButtonIniciarSesion_Click(object sender, EventArgs e)
    {
        string usuario = TextBoxUsuario.Text;
        string contrasenia = TextBoxPassword.Text;

        DataTable tablaAdministrador = AdministradorTable.GetAdministrador(usuario, contrasenia);
        if (tablaAdministrador.Rows.Count == 1)
        {
            Session.Add("admin", usuario);
            Response.Redirect("Admin/Profesor.aspx");
        }
        else{
            DataTable tablaProfesor = ProfesorTable.InicioSesionProfesor(usuario, contrasenia);
            if(tablaProfesor.Rows.Count == 1)
            {
                string profesor = tablaProfesor.Rows[0]["Nombre"].ToString() + " " +
                        tablaProfesor.Rows[0]["Apellido"].ToString();
                Session.Add("profesor", profesor);
                Session.Add("dpiProfesor", tablaProfesor.Rows[0]["Dpi"]);
                Response.Redirect("Profesor/AsignarNotas.aspx");
            }
            else
            {
                DataTable tablaAlumno = AlumnoTable.InicioSesionAlumno(contrasenia, usuario);
                if (tablaAlumno.Rows.Count == 1)
                {
                    string alumno = tablaAlumno.Rows[0]["Nombre"].ToString() + " " +
                        tablaAlumno.Rows[0]["Apellido"].ToString(); 
                    Session.Add("alumno", alumno);
                    Session.Add("codigoAlumno", tablaAlumno.Rows[0]["Codigo"]);
                    Response.Redirect("Alumno/AsignarCurso.aspx");
                }
                else
                {
                    alertaError.Visible = true;
                }
            }
        }

    }
}