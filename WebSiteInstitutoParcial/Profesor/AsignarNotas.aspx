<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageProfesor.master" AutoEventWireup="true" CodeFile="AsignarNotas.aspx.cs" Inherits="Profesor_AsignarNotas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid my-5">
        <div class="card shadow">
            <div class="card-header">Profesor - Asignar Notas</div>

            <div class="card-body">
                <div class="row my-3">
                    <div class="col-md-6">
                        <div class="input-group  mb-3">
                            <span class="input-group-text">Seleccione curso:</span>
                            <asp:DropDownList ID="DropDownListCurso" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownListCurso_SelectedIndexChanged" CssClass="form-select" />
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <div class="input-group">
                            <span class="input-group-text">Seleccione ciclo:</span>
                            <asp:DropDownList ID="DropDownListCiclo" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownListCiclo_SelectedIndexChanged" CssClass="form-select" />
                        </div>
                    </div>
                </div>

                <div class="row p-2">
                    <div class="col">
                        <h4>Listado de alumnos</h4>
                        <hr />
                        <div class="row my-5 d-md-flex">
                            <div class="col-md-6 ms-auto">
                                <div class="input-group">
                                    <span class="input-group-text">Actualizar por:</span>
                                    <asp:DropDownList ID="DropDownListActualizar" runat="server" CssClass="form-select form-select-lg">
                                        <asp:ListItem Value="Zona">Zona</asp:ListItem>
                                        <asp:ListItem Value="Final">Final</asp:ListItem>
                                    </asp:DropDownList>
                            
                                    <asp:Button ID="ButtonListar" CssClass="btn btn-outline-primary" Text="Listar" OnClick="ButtonListar_Click" runat="server" />
                                </div>
                            </div>
                        </div>
                        <div class="table-responsive-xxl">
                            <asp:GridView ID="GridViewAsignacion" runat="server"
                                EnableTheming="True" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False"
                                CssClass="table table-bordered table-hover table-sm">
                                <Columns>
                                    <asp:TemplateField HeaderText="Codigo">
                                        <ItemTemplate>
                                            <asp:Label ID="labelCodigo" Text='<%# Eval("CodigoAsignacion") %>' runat="server" />
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

                                    <asp:TemplateField HeaderText="Codigo Alumno">
                                        <ItemTemplate>
                                            <asp:Label ID="labelCodigoAlumno" Text='<%# Eval("CodigoAlumno") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Nombre Alumno">
                                        <ItemTemplate>
                                            <asp:Label ID="labelNombreAlumno" Text='<%# Eval("NombreAlumno") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Apellido Alumno">
                                        <ItemTemplate>
                                            <asp:Label ID="labelApellidoAlumno" Text='<%# Eval("ApellidoAlumno") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Zona">
                                        <ItemTemplate>
                                            <asp:Label ID="labelZona" Text='<%# Eval("Zona") %>' Visible='<%# !(bool) ZonaEsEditar %>' runat="server"/>
                                            <asp:TextBox ID="textBoxZona" Text='<%# Eval("Zona") %>' Visible='<%# ZonaEsEditar %>' Enabled='<%# !(bool) EsValidada %>' AutoPostBack="true" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Final">
                                        <ItemTemplate>
                                            <asp:Label ID="labelFinal" Text='<%# Eval("Final") %>' Visible='<%# !(bool) FinalEsEditar %>' runat="server"/>
                                            <asp:TextBox ID="textBoxFinal" Text='<%# Eval("Final") %>' Visible='<%# FinalEsEditar %>' Enabled='<%# !(bool) EsValidada %>' AutoPostBack="true" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Total">
                                        <ItemTemplate>
                                            <asp:Label ID="labelTotal" Text='<%# Eval("Total") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Resultado">
                                        <ItemTemplate>
                                            <asp:Label ID="labelResultado" Text='<%# Eval("Resultado") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Fecha Asignacion">
                                        <ItemTemplate>
                                            <asp:Label ID="labelFechaAsignacion" Text='<%# Eval("FechaAsignacion") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                </Columns>
                            </asp:GridView>
                        </div>

                        <div >
                            <asp:Button ID="ButtonValidar" CssClass="btn btn-warning" Text="Validar" OnClick="ButtonValidar_Click" runat="server" Visible="false"/>
                            <asp:Button ID="ButtonGuardarListado" CssClass="btn btn-primary" Text="Guardar" OnClick="ButtonGuardarListado_Click" runat="server" Visible="false"/>
                            <asp:Button ID="ButtonCancelarListado" CssClass="btn btn-secondary" Text="Cancelar" OnClick="ButtonCancelarListado_Click" runat="server" Visible="false"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

