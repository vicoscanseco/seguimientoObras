<%@ Page Title="" Language="C#" MasterPageFile="~/plantilla.Master" AutoEventWireup="true" CodeBehind="verObra.aspx.cs" Inherits="seguimientoObras.verObra" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">Captura de Obras</h2>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="col-lg-9 col-lg-offset-1 well">
                    <fieldset>
                        <legend>Datos de la Obra</legend>
                        <div class="form-group">
                            <asp:Label ID="Label8" CssClass="control-label col-lg-2" runat="server" Text="No. Oficio:"></asp:Label>
                            <div class="col-lg-4">
                                <asp:TextBox ID="txtNoOfico" placeholder="No. Oficio" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <asp:Label ID="Label1" CssClass="control-label col-lg-2" runat="server" Text="Fecha:"></asp:Label>
                            <div class="col-lg-4">
                                <asp:TextBox ID="txtFecha" CssClass="form-control" runat="server"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtFecha_CalendarExtender" runat="server" BehaviorID="txtFecha_CalendarExtender" TargetControlID="txtFecha"></cc1:CalendarExtender>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label2" CssClass="control-label col-lg-3" runat="server" Text="Nombre de la Obra:"></asp:Label>
                            <div class="col-lg-9">
                                <asp:TextBox ID="txtNameO" placeholder="Nombre Obra" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label3" CssClass="control-label col-lg-3" runat="server" Text="Dirección:"></asp:Label>
                            <div class="col-lg-9">
                                <asp:TextBox ID="txtDir" placeholder="Dirección Obra" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label4" CssClass="control-label col-lg-3" runat="server" Text="Municipio:"></asp:Label>
                            <div class="col-lg-9">
                                <asp:DropDownList ID="ddlMpio" CssClass="form-control" runat="server" DataSourceID="odsMpios" DataTextField="nompio" DataValueField="mpio"></asp:DropDownList>
                                <asp:ObjectDataSource ID="odsMpios" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="seguimientoObras.bdsTableAdapters.municipiosTableAdapter">
                                    <InsertParameters>
                                        <asp:Parameter Name="mpio" Type="String" />
                                        <asp:Parameter Name="nompio" Type="String" />
                                    </InsertParameters>
                                </asp:ObjectDataSource>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label6" CssClass="control-label col-lg-3" runat="server" Text="Agencia:"></asp:Label>
                            <div class="col-lg-9">
                                <asp:DropDownList ID="ddlAg" CssClass="form-control" runat="server" DataSourceID="ObjectDataSource1" DataTextField="descripcion" DataValueField="centro"></asp:DropDownList>
                                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="seguimientoObras.bdsTableAdapters.c_ofnasTableAdapter">
                                    <InsertParameters>
                                        <asp:Parameter Name="centro" Type="String" />
                                        <asp:Parameter Name="depto" Type="String" />
                                        <asp:Parameter Name="descripcion" Type="String" />
                                        <asp:Parameter Name="foto" Type="String" />
                                    </InsertParameters>
                                </asp:ObjectDataSource>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label5" CssClass="control-label col-lg-3" runat="server" Text="Observaciones:"></asp:Label>
                            <div class="col-lg-9">
                                <asp:TextBox ID="txtObservaciones" placeholder="Observaciones" CssClass="form-control" runat="server" Rows="4" TextMode="MultiLine"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label7" CssClass="control-label col-lg-3" runat="server" Text="Oficio Anexo:"></asp:Label>
                            <div class="col-lg-9">
                                <asp:Literal ID="lblFile" runat="server"></asp:Literal>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-2 col-lg-offset-6">
                                <a class="btn btn-google" href="capContratacion.aspx?i=<%=Request["i"] %>"><i class="fa fa-check-square-o fa-lg"></i>&nbsp; Contratación</a>
                            </div>
                            <div class="col-lg-2">
                                <a class="btn btn-facebook" href="capSup.aspx?i=<%=Request["i"] %>"><i class="fa fa-user-secret fa-lg"></i>&nbsp; Supervisión</a>
                            </div>
                            <div class="col-lg-2">
                                <asp:LinkButton ID="LinkButton1" CssClass="btn btn-success" runat="server" OnClick="LinkButton1_Click"><i class="fa fa-save fa-lg"></i> &nbsp; Guardar</asp:LinkButton>
                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>
            <div class="col-lg-12">
                <asp:Literal ID="lblMsg" runat="server"></asp:Literal>
            </div>
        </div>
    </div>
</asp:Content>
