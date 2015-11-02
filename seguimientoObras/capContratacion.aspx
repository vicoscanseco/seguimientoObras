<%@ Page Title="" Language="C#" MasterPageFile="~/plantilla.Master" AutoEventWireup="true" CodeBehind="capContratacion.aspx.cs" Inherits="seguimientoObras.capContratacion" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
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
                                    <asp:Label ID="Label1" CssClass="control-label col-lg-3" runat="server" Text="Fecha:"></asp:Label>
                                    <div class="col-lg-3">
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
                                    <hr />
                                    <h4>Datos del Servicio</h4>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="Label3" CssClass="control-label col-lg-2" runat="server" Text="RPU:"></asp:Label>
                                    <div class="col-lg-4">
                                        <asp:TextBox ID="txtRPU" placeholder="RPU" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <asp:Label ID="Label4" CssClass="control-label col-lg-3" runat="server" Text="Fecha Contratación:"></asp:Label>
                                    <div class="col-lg-3">
                                        <asp:TextBox ID="txtFCont" placeholder="Fecha" CssClass="form-control" runat="server"></asp:TextBox>
                                        <cc1:CalendarExtender ID="CalendarExtender1" runat="server" BehaviorID="txtFCont_CalendarExtender" TargetControlID="txtFCont"></cc1:CalendarExtender>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="Label5" CssClass="control-label col-lg-2" runat="server" Text="Observaciones:"></asp:Label>
                                    <div class="col-lg-10">
                                        <asp:TextBox ID="txtObs" placeholder="Observaciones" TextMode="MultiLine" Rows="4" CssClass="form-control" runat="server"></asp:TextBox>
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
            </div>
            <div class="col-lg-12">
                <asp:Literal ID="lblMsg" runat="server"></asp:Literal>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="pageHeader" ContentPlaceHolderID="pageHeader" runat="server">
    <h1>Contratación de Obra        
    </h1>
</asp:Content>
