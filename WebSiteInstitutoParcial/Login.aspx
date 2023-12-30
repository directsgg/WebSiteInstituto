<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Login-Instituto</title>
    <link href="imagenes/five-stars200.png" rel="icon" />
    <!-- CSS only Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous"/>
    <!-- CSS personalizado -->
    <link href="css/style1.css" rel="stylesheet" />
    <!-- CSS icons google -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>
    <form id="form1" runat="server">
        <section class="vh-100 bg-warning bg-opacity-10">
            <div class="container-fluid h-custom">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-md-9 col-lg-6 col-xl-5">
                        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp" class="img-fluid" alt="Sample image"/>
                    </div>
                    <div class="col-md-8 col-lg-8 col-xl-4 offset-xl-1">

                        <div class="row">
                            <div class="col-2">
                                <img src="imagenes/five-stars200.png" class="img-fluid" alt="logo" />
                            </div>
                            <div class="col">
                                <h1>Instituto</h1>
                            </div>
                        </div>

                        <div class="divider d-flex align-items-center my-4">
                            <p class="text-center fw-bold mx-2 mb-0">Bienvenido de nuevo</p>
                        </div>

                        <div class="form-floating form-outline mb-4">
                            <asp:TextBox ID="TextBoxUsuario" CssClass="form-control form-control-lg" placeholder="usuario" runat="server" />
                            <label class="form-label" for="TextBoxUsuario"><span class="material-symbols-outlined float-start">person</span>Usuario</label>
                        </div>

                        <div class="form-floating form-outline mb-4">
                            <asp:TextBox ID="TextBoxPassword" CssClass="form-control form-control-lg" placeholder="password" TextMode="Password" runat="server" />
                            <label class="form-label" for="TextBoxPassword"><span class="material-symbols-outlined float-start">lock</span>Contraseña</label>
                        </div>

                        <div id="alertaError" runat="server" class="alert alert-danger alert-dismissible fade show mt-1" Visible="false">
                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                            <strong>¡Acceso Denegado!</strong> Usuario o contraseña incorrectos
                        </div>

                        <div class="text-center text-lg-start mt-4 pt-2">
                            <asp:Button ID="ButtonIniciarSesion" Text="Iniciar Sesión" CssClass="btn btn-primary btn-lg px-3" OnClick="ButtonIniciarSesion_Click" runat="server" />
                            <p class="small mt-2 pt-1 mb-0">Olvido su contraseña <a href="#" class="link-danger">Comuniquese con el administrador</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </form>
    <!-- JavaScript Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    
</body>
</html>
