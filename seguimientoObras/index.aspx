<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="seguimientoObras.index" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Sistema de Seguimiento de Obras</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport" />
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
    <!-- Font Awesome -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" />

    <!-- Theme style -->
    <link rel="stylesheet" href="dist/css/AdminLTE.min.css" />
    <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
          page. However, you can choose any other skin. Make sure you
          apply the skin class to the body tag so the changes take effect.
    -->
    <link rel="stylesheet" href="dist/css/skins/skin-blue.min.css" />

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="hold-transition login-page">
    <form id="Form1" role="form" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-lg-11 col-lg-offset-1">
                    <img src="img/fondo.jpg" />
                </div>
            </div>
            <div class="row">
                <div class="login-box">
                    <div class="login-box-body">
                        <h4 class="login-box-msg">Acceso</h4>
                        <div class="panel-body">
                            <asp:ScriptManager ID="ScriptManager1" EnableScriptLocalization="true" runat="server" EnableScriptGlobalization="True">
                                <Scripts>
                                    <asp:ScriptReference Name="jquery" />
                                </Scripts>
                            </asp:ScriptManager>
                            <fieldset>
                                <legend>Datos de Usuario</legend>
                                <div class="form-group">
                                    <asp:TextBox ID="txtUser" CssClass="form-control" placeholder="Usuario" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Falta el Usuario" ControlToValidate="txtUser">*</asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="txtClave" CssClass="form-control" placeholder="Contraseña" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfClave" runat="server" ErrorMessage="Falta la Contraseña" ControlToValidate="txtClave">*</asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-7">
                                        <asp:CheckBox ID="CheckBox1" CssClass="checkbox" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox1_CheckedChanged" Text="Acceso Consulta" />
                                    </div>
                                    <div class="col-xs-5">
                                        <asp:Button ID="Button1" CssClass="btn btn-primary btn-block btn-flat" runat="server" Text="Entrar" OnClick="Button1_Click" />
                                    </div>
                                </div>

                            </fieldset>
                        </div>
                    </div>
                    <asp:ValidationSummary ID="ValidationSummary1" CssClass="alert alert-danger" runat="server" />
                    <asp:Literal ID="lblMsg" runat="server"></asp:Literal>
                </div>

            </div>
        </div>
    </form>

    <!-- REQUIRED JS SCRIPTS -->

    <!-- jQuery 2.1.4 -->
    <script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <!-- AdminLTE App -->
    <script src="dist/js/app.min.js"></script>

    <!-- Optionally, you can add Slimscroll and FastClick plugins.
         Both of these plugins are recommended to enhance the
         user experience. Slimscroll is required when using the
         fixed layout. -->
</body>
</html>
