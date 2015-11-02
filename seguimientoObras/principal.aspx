<%@ Page Title="" Language="C#" MasterPageFile="~/plantilla.Master" AutoEventWireup="true" CodeBehind="principal.aspx.cs" Inherits="seguimientoObras.principal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="col-md-12">
            <div class="row">
                <div class="col-lg-12">
                    <br />
                    <asp:Literal ID="lblMsg" runat="server"></asp:Literal>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="box">
                        <div class="box-header">
                            <h3 class="page-header">Obras Pendientes de Contratación</h3>
                        </div>
                        <div class="box-body">
                            <asp:GridView ID="GridView1" CssClass="table table-bordered table-condensed" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" PageSize="5">
                                <Columns>
                                    <asp:BoundField DataField="idoficio" HeaderText="No. Oficio" SortExpression="idoficio" />
                                    <asp:BoundField DataField="fecha" HeaderText="Fecha Oficio" SortExpression="fecha" DataFormatString="{0:dd/MM/yyyy}" />
                                    <asp:BoundField DataField="nombre_obra" HeaderText="Nombre" SortExpression="nombre_obra" />
                                    <asp:BoundField DataField="direccion" HeaderText="Direccion" SortExpression="direccion" />
                                    <asp:BoundField DataField="mpio" HeaderText="MPIO" SortExpression="mpio" />
                                    <asp:BoundField DataField="centro" HeaderText="Centro" SortExpression="centro" />
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <a href='oficios/<%# Eval("oficio") %>' target="_blank" title="Oficio"><i class="fa fa-file fa-lg"></i></a>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <a href='capSup.aspx?i=<%# Eval("idobra") %>&' title="Supervisión"><i class="fa fa-user-secret fa-lg"></i></a>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <a href='capContratacion.aspx?i=<%# Eval("idobra") %>' title="Contratación"><i class="fa fa-check-square-o fa-lg"></i></a>&nbsp;                                                             
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <a href='verObra.aspx?i=<%# Eval("idobra") %>' title="Visualizar"><i class="fa fa-search-plus fa-lg"></i></a>&nbsp;                                                             
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <PagerSettings FirstPageText="&amp;nbsp;&lt;i class=&quot;fa fa-fast-backward&quot;&gt;&lt;/i&gt;&amp;nbsp;" LastPageText="&amp;nbsp;&lt;i class=&quot;fa fa-fast-forward&quot;&gt;&lt;/i&gt;&amp;nbsp;" Mode="NextPreviousFirstLast" NextPageText="&amp;nbsp;&lt;i class=&quot;fa fa-forward&quot;&gt;&lt;/i&gt;&amp;nbsp;" PreviousPageText="&amp;nbsp;&lt;i class=&quot;fa fa-backward&quot;&gt;&lt;/i&gt;&amp;nbsp;" />
                                <PagerStyle CssClass="pager" />
                            </asp:GridView>
                            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetStatus" TypeName="seguimientoObras.bdsTableAdapters.c_obrasTableAdapter">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="0" Name="status" Type="Int32" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <div class="box">
                        <div class="box-header">
                            <h3 class="page-header">Obras Pendientes de Supervisión</h3>
                        </div>
                        <div class="box-body">
                            <asp:GridView ID="GridView2" CssClass="table table-bordered table-condensed" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="ObjectDataSource2" PageSize="5">
                                <Columns>
                                    <asp:BoundField DataField="idoficio" HeaderText="No. Oficio" SortExpression="idoficio" />
                                    <asp:BoundField DataField="fecha" HeaderText="Fecha Oficio" SortExpression="fecha" DataFormatString="{0:dd/MM/yyyy}" />
                                    <asp:BoundField DataField="nombre_obra" HeaderText="Nombre" SortExpression="nombre_obra" />
                                    <asp:BoundField DataField="direccion" HeaderText="Direccion" SortExpression="direccion" />
                                    <asp:BoundField DataField="mpio" HeaderText="MPIO" SortExpression="mpio" />
                                    <asp:BoundField DataField="centro" HeaderText="Centro" SortExpression="centro" />
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <a href='oficios/<%# Eval("oficio") %>' target="_blank" title="Oficio"><i class="fa fa-file fa-lg"></i></a>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <a href='listaSup.aspx?i=<%# Eval("idobra") %>' title="Ver Supervisiones"><i class="fa fa-book fa-lg"></i></a>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <a href='capContratacion.aspx?i=<%# Eval("idobra") %>' title="Contratación"><i class="fa fa-check-square-o fa-lg"></i></a>&nbsp;                                                             
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <PagerSettings FirstPageText="&amp;nbsp;&lt;i class=&quot;fa fa-fast-backward&quot;&gt;&lt;/i&gt;&amp;nbsp;" LastPageText="&amp;nbsp;&lt;i class=&quot;fa fa-fast-forward&quot;&gt;&lt;/i&gt;&amp;nbsp;" Mode="NextPreviousFirstLast" NextPageText="&amp;nbsp;&lt;i class=&quot;fa fa-forward&quot;&gt;&lt;/i&gt;&amp;nbsp;" PreviousPageText="&amp;nbsp;&lt;i class=&quot;fa fa-backward&quot;&gt;&lt;/i&gt;&amp;nbsp;" />
                                <PagerStyle CssClass="pager" />
                            </asp:GridView>
                            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetStatus" TypeName="seguimientoObras.bdsTableAdapters.c_obrasTableAdapter">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="1" Name="status" Type="Int32" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="box">
                        <div class="box-header">
                            <h3 class="page-header">Obras Contratadas</h3>
                        </div>
                        <div class="box-body">
                            <asp:GridView ID="GridView3" CssClass="table table-bordered table-condensed" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="ObjectDataSource3" PageSize="5">
                                <Columns>
                                    <asp:BoundField DataField="idoficio" HeaderText="No. Oficio" SortExpression="idoficio" />
                                    <asp:BoundField DataField="fecha" HeaderText="Fecha Oficio" SortExpression="fecha" DataFormatString="{0:dd/MM/yyyy}" />
                                    <asp:BoundField DataField="nombre_obra" HeaderText="Nombre" SortExpression="nombre_obra" />
                                    <asp:BoundField DataField="direccion" HeaderText="Direccion" SortExpression="direccion" />
                                    <asp:BoundField DataField="mpio" HeaderText="MPIO" SortExpression="mpio" />
                                    <asp:BoundField DataField="centro" HeaderText="Centro" SortExpression="centro" />
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <a href='oficios/<%# Eval("oficio") %>' target="_blank" title="Oficio"><i class="fa fa-file fa-lg"></i></a>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <a href='listaSup.aspx?i=<%# Eval("idobra") %>' title="Ver Supervisiones"><i class="fa fa-book fa-lg"></i></a>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <a href='capContratacion.aspx?i=<%# Eval("idobra") %>' title="Contratación"><i class="fa fa-check-square-o fa-lg"></i></a>&nbsp;                                                             
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <PagerSettings FirstPageText="&amp;nbsp;&lt;i class=&quot;fa fa-fast-backward&quot;&gt;&lt;/i&gt;&amp;nbsp;" LastPageText="&amp;nbsp;&lt;i class=&quot;fa fa-fast-forward&quot;&gt;&lt;/i&gt;&amp;nbsp;" Mode="NextPreviousFirstLast" NextPageText="&amp;nbsp;&lt;i class=&quot;fa fa-forward&quot;&gt;&lt;/i&gt;&amp;nbsp;" PreviousPageText="&amp;nbsp;&lt;i class=&quot;fa fa-backward&quot;&gt;&lt;/i&gt;&amp;nbsp;" />
                                <PagerStyle CssClass="pager" />
                            </asp:GridView>
                            <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetStatus" TypeName="seguimientoObras.bdsTableAdapters.c_obrasTableAdapter">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="2" Name="status" Type="Int32" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="pageHeader" ContentPlaceHolderID="pageHeader" runat="server">
    <h1>Sistema de Seguimiento de Obras
        <small> Resumen de Obras</small>
    </h1>
</asp:Content>
