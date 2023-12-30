<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAlumno.master" AutoEventWireup="true" CodeFile="Notas.aspx.cs" Inherits="Alumno_Notas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid my-5">
        <div class="card shadow">
            <div class="card-header">Alumno - Ver Notas</div>
            <div class="card-body">
                <div class="row p-2">
                    <div class="col">
                        <h4>Cursos Asignados</h4>
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

                                    <asp:TemplateField HeaderText="Fecha Asignacion">
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

                                    <asp:TemplateField HeaderText="Nombre Profesor">
                                        <ItemTemplate>
                                            <asp:Label ID="labelNombre" Text='<%# Eval("NombreProfesor") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Apellido Profesor">
                                        <ItemTemplate>
                                            <asp:Label ID="labelApellido" Text='<%# Eval("ApellidoProfesor") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Zona">
                                        <ItemTemplate>
                                            <asp:Label ID="labelZona" Text='<%# Eval("Zona") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Final">
                                        <ItemTemplate>
                                            <asp:Label ID="labelFinal" Text='<%# Eval("Final") %>' runat="server" />
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
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

