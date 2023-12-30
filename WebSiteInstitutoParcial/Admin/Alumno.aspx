<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="Alumno.aspx.cs" Inherits="Admin_Alumno" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid my-5">
        <div class="card shadow">
            <div class="card-header">Admin - Alumno</div>
            <div class="card-body">
                <div class="row p-2">
                    <div class="col-md-4">
                        <h4>Ingreso de alumno</h4>
                        <div class="d-none">
                        <label for="TextBoxCodigo" class="form-label">Codigo (5 digítos):</label>
                        <asp:TextBox ID="TextBoxCodigo" CssClass="form-control form-control-sm mb-3" runat="server" />
                        </div>
                        <div class="row">
                            <div class="col-xl-6">
                                <label for="TextBoxNombre" class="form-label">Nombres:</label>
                                <asp:TextBox ID="TextBoxNombre" CssClass="form-control form-control-sm mb-3" runat="server" />
                            </div>
                            <div class="col-xl-6">
                                <label for="TextBoxApellido" class="form-label">Apellidos:</label>
                                <asp:TextBox ID="TextBoxApellido" CssClass="form-control form-control-sm mb-3" runat="server" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xl-6">
                                <label for="TextBoxUsuario" class="form-label">Usuario:</label>
                                <asp:TextBox ID="TextBoxUsuario" runat="server" CssClass="form-control form-control-sm mb-3" />
                            </div>
                            <div class="col-xl-6">
                                <label for="TextBoxContrasenia" class="form-label">Contraseña:</label>
                                <asp:TextBox ID="TextBoxContrasenia" runat="server" CssClass="form-control form-control-sm mb-3" />
                            </div>
                        </div>
                     
                        <div class="row">
                            <div class="col-xl-6">
                                <label for="TextBoxFNac" class="form-label">Fecha nacimiento:</label>
                                <asp:TextBox ID="TextBoxFNac" runat="server" CssClass="form-control form-control-sm mb-3" TextMode="Date"/>
                            </div>
                             <div class="col-xl-6">
                                <label for="TextBoxCorreo" class="form-label">Correo:</label>
                                <asp:TextBox ID="TextBoxCorreo" runat="server" CssClass="form-control form-control-sm mb-3" TextMode="Email"/>
                            </div>
                        </div>

                        <label for="DropDownListDep" class="form-label">Departamento:</label>
                        <asp:DropDownList ID="DropDownListDepartamento" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownListDepartamento_SelectedIndexChanged" CssClass="form-select form-select-sm mb-3" />

                        <label for="DropDownListMunicipio" class="form-label">Municipio:</label>
                        <asp:DropDownList ID="DropDownListMunicipio" runat="server" CssClass="form-select form-select-sm  mb-3" />

                        <div class="row">
                            <div class="col-xl-6">
                                <label for="TextBoxDireccion" class="form-label">Dirección:</label>
                                <asp:TextBox ID="TextBoxDireccion" runat="server" CssClass="form-control form-control-sm mb-3" />
                            </div>
                            <div class="col-xl-6">
                                <label for="TextBoxTelefono" class="form-label">Teléfono:</label>
                                <asp:TextBox ID="TextBoxTelefono" runat="server" CssClass="form-control form-control-sm mb-3" TextMode="Phone" />
                            </div>
                        </div>
                        
                        <div class="mb-4 d-grid">
                            <asp:Panel ID="panelGuardar" runat="server" CssClass="d-block">
                                <asp:Button ID="ButtonGuardar" runat="server" Text="GUARDAR" CssClass="btn btn-primary " OnClick="ButtonGuardar_Click" />
                            </asp:Panel>
                            <asp:Panel ID="panelActualizar" runat="server" Visible="False">
                                <asp:Button ID="ButtonActualizar" runat="server" Text="ACTUALIZAR" CssClass="btn btn-warning" OnClick="ButtonActualizar_Click" />
                                <asp:Button ID="ButtonCancelar" runat="server" Text="CANCELAR" CssClass="btn btn-secondary" OnClick="ButtonCancelar_Click" />
                            </asp:Panel>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <h4>Listado de alumnos</h4>
                        <div class="table-responsive-xxl">
                            <asp:GridView ID="GridViewAlumno" runat="server"
                                EnableTheming="True" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False"
                                OnRowEditing="GridViewAlumno_RowEditing"
                                OnRowDeleting="GridViewAlumno_RowDeleting"
                                OnRowDataBound="GridViewAlumno_RowDataBound" CssClass="table table-bordered table-hover table-sm">

                                <Columns>
                                    <asp:TemplateField HeaderText="Codigo">
                                        <ItemTemplate>
                                            <asp:Label ID="labelCodigo" Text='<%# Eval("Codigo") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Nombres">
                                        <ItemTemplate>
                                            <asp:Label ID="labelNombre" Text='<%# Eval("Nombre") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Apellidos">
                                        <ItemTemplate>
                                            <asp:Label ID="labelApellido" Text='<%# Eval("Apellido") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Departamento">
                                        <ItemTemplate>
                                            <asp:Label ID="labelDepartamento" Text='<%# Eval("Departamento") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Municipio">
                                        <ItemTemplate>
                                            <asp:Label ID="labelMunicipio" Text='<%# Eval("Municipio") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Direccion">
                                        <ItemTemplate>
                                            <asp:Label ID="labelDireccion" Text='<%# Eval("Direccion") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Telefono">
                                        <ItemTemplate>
                                            <asp:Label ID="labelTelefono" Text='<%# Eval("Telefono") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Correo">
                                        <ItemTemplate>
                                            <asp:Label ID="labelCorreo" Text='<%# Eval("Correo") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Fecha de Nacimiento">
                                        <ItemTemplate>
                                            <asp:Label ID="labelFechaNacimiento" Text='<%# Eval("FechaNacimiento") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Usuario">
                                        <ItemTemplate>
                                            <asp:Label ID="labelUsuario" Text='<%# Eval("Usuario") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Contraseña">
                                        <ItemTemplate>
                                            <asp:Label ID="labelContrasenia" Text='<%# Eval("Contrasenia") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Asignado a cursos">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="checkBoxAsignado" Checked='<%# Eval("Asignado") %>' Enabled="false" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:ImageButton ImageUrl="../imagenes/pencil32.png" runat="server" CommandName="Edit" ToolTip="Editar" Width="20px" Height="20px" />
                                            <asp:ImageButton ImageUrl="../imagenes/delete32.png" runat="server" CommandName="Delete" ToolTip="Eliminar" Width="20px" Height="20px" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>

                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

