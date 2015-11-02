<%@ Page Title="" Language="C#" MasterPageFile="~/plantilla.Master" AutoEventWireup="true" CodeBehind="listaSup.aspx.cs" Inherits="seguimientoObras.listaSup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">Supervisiones de Obra</h2>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-10">
                <div class="col-lg-9 col-lg-offset-1 well">
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
                    </fieldset>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-2 col-lg-offset-1">
                <a href='capSup.aspx?i=<%=Request["i"] %>' class="btn btn-primary" title="Supervisión"><i class="fa fa-plus-square-o"></i> Nueva Supervisón</a>                
            </div>
        </div>       
        <div class="row">
            <div class="col-lg-12">
                <h4 class="page-header">Supervisiones</h4>
            </div>
        </div>
        
        <div class="row">
            <div class="col-lg-9 col-lg-offset-1">
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-condensed" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1">
                    <Columns>
                        <asp:BoundField DataField="fecha" HeaderText="Fecha" SortExpression="fecha" DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:BoundField DataField="observaciones" HeaderText="Observaciones" SortExpression="observaciones" />
                        <asp:BoundField DataField="rpe" HeaderText="RPE Supervisor" SortExpression="rpe" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <a href='capSup.aspx?i=<%# Eval("idobra") %>&v=r&s=<%# Eval("idsup") %>' title="Supervisión"><i class="fa fa-search-plus"></i></a>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByIDObra" TypeName="seguimientoObras.bdsTableAdapters.c_supcomTableAdapter">
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="0" Name="idobra" QueryStringField="i" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
        </div>
    </div>
</asp:Content>
