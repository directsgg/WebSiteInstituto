<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAlumno.master" AutoEventWireup="true" CodeFile="AsignarCurso.aspx.cs" Inherits="Alumno_AsignarCurso" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid my-5">
        <div class="card shadow">
            <div class="card-header">Alumno - Asignarse cursos</div>
            <div class="card-body">
                <div class="row p-2">
                    <div class="col">
                        <h4>Asignacion</h4>
                        <p>Instrucciones:</p>
                        <p>Por favor seleccione el curso que se desea asignar ubicando la respectiva fila con los detalles del curso, ciclo y profesor (nombres y apellidos).</p>
                        <div class="table-responsive-xxl">
                            <asp:GridView ID="GridViewProfesorCurso" runat="server"
                                EnableTheming="True" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False"
                                CssClass="table table-bordered table-hover table-sm">
                                <Columns>
                                    <asp:TemplateField HeaderText="Seleccionar">
                                        <ItemTemplate>
                                            <asp:checkbox ID="checkBoxSeleccion" text="Seleccion" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Codigo">
                                        <ItemTemplate>
                                            <asp:Label ID="labelCodigo" Text='<%# Eval("Codigo") %>' runat="server" />
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
                                </Columns>
                            </asp:GridView>
                        </div>

                        <div class="mb-4 ">
                            <asp:Button ID="ButtonGuardar" runat="server" Text="GUARDAR" CssClass="btn btn-primary " OnClick="ButtonGuardar_Click" />
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
</asp:Content>

