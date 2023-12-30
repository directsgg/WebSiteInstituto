<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="Profesor.aspx.cs" Inherits="Admin_Profesor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid my-5">
        <div class="card shadow">
            <div class="card-header">Admin - Profesor</div>
            <div class="card-body">
                <div class="row p-2">
                    <div class="col-md-4">
                        <h4>Ingreso de profesor</h4>
                        <label for="TextBoxDpi" class="form-label">DPI:</label>
                        <asp:TextBox ID="TextBoxDpi" CssClass="form-control form-control-sm mb-3" runat="server" />

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
                        <h4>Listado de profesores</h4>
                        <div class="table-responsive-xxl">
                            <asp:GridView ID="GridViewProfesor" runat="server"
                                EnableTheming="True" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False"
                                OnRowEditing="GridViewProfesor_RowEditing"
                                OnRowDeleting="GridViewProfesor_RowDeleting"
                                OnRowDataBound="GridViewProfesor_RowDataBound" CssClass="table table-bordered table-hover table-sm">

                                <Columns>
                                    <asp:TemplateField HeaderText="DPI">
                                        <ItemTemplate>
                                            <asp:Label ID="labelDPI" Text='<%# Eval("DPI") %>' runat="server" />
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

