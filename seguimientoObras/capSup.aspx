<%@ Page Title="" Language="C#" MasterPageFile="~/plantilla.Master" AutoEventWireup="true" CodeBehind="capSup.aspx.cs" Inherits="seguimientoObras.capSup" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="col-lg-8">
            <div class="box">
                <div class="box-body">
                    <div class="col-lg-12">
                        <fieldset>
                            <legend>Datos Generales de Obra</legend>
                            <div class="form-group">
                                <asp:Label ID="Label8" CssClass="control-label col-lg-2" runat="server" Text="No. Oficio:"></asp:Label>
                                <div class="col-lg-4">
                                    <asp:TextBox ID="txtNoOfico" placeholder="No. Oficio" CssClass="form-control" runat="server" ReadOnly="True"></asp:TextBox>
                                </div>
                                <asp:Label ID="Label1" CssClass="control-label col-lg-2" runat="server" Text="Fecha:"></asp:Label>
                                <div class="col-lg-4">
                                    <asp:TextBox ID="txtFecha" CssClass="form-control" runat="server" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label2" CssClass="control-label col-lg-2" runat="server" Text="Nombre:"></asp:Label>
                                <div class="col-lg-10">
                                    <asp:TextBox ID="txtNombre" placeholder="Nombre" CssClass="form-control" runat="server" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <h4>Datos de Supervisión</h4>
                                <hr />
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label3" CssClass="control-label col-lg-4" runat="server" Text="Fecha Supervisión:"></asp:Label>
                                <div class="col-lg-4">
                                    <asp:TextBox ID="txtFSup" CssClass="form-control" runat="server"></asp:TextBox>
                                    <cc1:CalendarExtender ID="txtFecha_CalendarExtender" runat="server" BehaviorID="txtFecha_CalendarExtender" TargetControlID="txtFSup"></cc1:CalendarExtender>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label4" CssClass="control-label col-lg-4" runat="server" Text="Observaciones:"></asp:Label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="txtObs" placeholder="Observaciones" Rows="4" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="well">
                                <h4>Anexos</h4>
                                <div class="form-group">
                                    <asp:Label ID="Label5" CssClass="control-label col-lg-4" runat="server" Text="Archivo:"></asp:Label>
                                    <div class="col-lg-7">
                                        <asp:FileUpload ID="fuAnexo" runat="server" CssClass="form-control" />
                                    </div>
                                    <div class="col-lg-1">
                                        <asp:LinkButton ID="addFile" CssClass="btn btn-success" runat="server" ToolTip="Agregar Archivo" OnClick="addFile_Click"><i class="fa fa-plus fa-lg"></i></asp:LinkButton>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-lg-10">
                                        <asp:GridView ID="gvAnexos" CssClass="table table-bordered table-condensed" runat="server" AutoGenerateColumns="False">
                                            <Columns>
                                                <asp:BoundField DataField="titulo" HeaderText="Archivo" SortExpression="titulo" />
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <a href='anexos/<%# Eval("filepath") %>' target="_blank"><i class="fa fa-file"></i></a>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>

                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-lg-2 col-lg-offset-10">
                                    <asp:LinkButton ID="LinkButton1" CssClass="btn btn-success" runat="server" OnClick="LinkButton1_Click"><i class="fa fa-save fa-lg"></i> &nbsp; Guardar</asp:LinkButton>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                </div>
            </div>
            <div class="col-lg-12">
                <asp:Literal ID="lblMsg" runat="server"></asp:Literal>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="pageHeader" ContentPlaceHolderID="pageHeader" runat="server">
    <h1>Captura de Supervisión        
    </h1>
</asp:Content>
