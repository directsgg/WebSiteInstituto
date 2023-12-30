<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="ProfesorCurso.aspx.cs" Inherits="Admin_ProfesorCurso" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid my-5">
        <div class="card shadow">
            <div class="card-header">Admin - Asignar Curso a Profesor</div>
            <div class="card-body">
                <div class="row p-2">
                    <div class="col-md-4">
                        <h4>Asignar Curso</h4>

                        <label for="TextBoxDpi" class="form-label">Profesor:</label>
                        <div class="input-group mb-3">
                            <asp:TextBox ID="TextBoxProfesor" CssClass="form-control form-control-sm" runat="server" Enabled="false" />
                            <button class="btn btn-secondary" type="button" data-bs-toggle="modal" data-bs-target="#modalProfe">
                                <span class="material-symbols-outlined float-start">check_circle</span> Seleccionar
                            </button>
                        </div>

                        <label for="DropDownListCurso" class="form-label">Curso:</label>
                        <asp:DropDownList ID="DropDownListCurso" runat="server" CssClass="form-select form-select-sm mb-3" />

                        <label for="DropDownListCiclo" class="form-label">Ciclo:</label>
                        <asp:DropDownList ID="DropDownListCiclo" runat="server" CssClass="form-select form-select-sm  mb-3" />

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
                        <h4>Listado de asignaciones de cursos a profesores</h4>
                        <div class="table-responsive-xxl">
                            <asp:GridView ID="GridViewProfesorCurso" runat="server"
                                EnableTheming="True" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False"
                                OnRowDeleting="GridViewProfesorCurso_RowDeleting"
                                OnRowDataBound="GridViewProfesorCurso_RowDataBound" CssClass="table table-bordered table-hover table-sm">

                                <Columns>
                                    <asp:TemplateField HeaderText="Codigo">
                                        <ItemTemplate>
                                            <asp:Label ID="labelCodigo" Text='<%# Eval("Codigo") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Fecha asignacion">
                                        <ItemTemplate>
                                            <asp:Label ID="labelFechaAsignacion" Text='<%# Eval("FechaAsignacion") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Curso">
                                        <ItemTemplate>
                                            <asp:Label ID="labelCurso" Text='<%# Eval("Curso") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Ciclo">
                                        <ItemTemplate>
                                            <asp:Label ID="labelCiclo" Text='<%# Eval("Ciclo") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

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

                                    <asp:TemplateField>
                                        <ItemTemplate>
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

    <!--Modal-->
    <div class="modal" id="modalProfe">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">

                 <!--Modal Header-->
                <div class="modal-header">
                    <h4 class="modal-title">Listado de profesores</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <!--Modal Body-->
                <div class="modal-body">
                    Seleccione un profesor:
                    <div class="table-responsive-xxl">
                        <asp:GridView ID="GridViewProfesor" runat="server" DataKeyNames="DPI"
                            EnableTheming="True" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" 
                            OnSelectedIndexChanged="GridViewProfesor_SelectedIndexChanged"
                            CssClass="table table-bordered table-hover table-sm">

                            <Columns>
                                <asp:TemplateField ItemStyle-CssClass="text-center" HeaderText="Seleccionar">
                                    <ItemTemplate>
                                        <asp:ImageButton ImageUrl="../imagenes/accept32.png" runat="server" CommandName="Select" ToolTip="Seleccionar" Width="32px" Height="32px" />
                                    </ItemTemplate>
                                </asp:TemplateField>

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
                            </Columns>
                            <SelectedRowStyle BackColor="#66ff66" />
                        </asp:GridView>
                    </div>
                </div>

                <!--Modal Body-->
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

