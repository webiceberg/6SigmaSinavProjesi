<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Giriş - 6 Sigma Prensibi</title>
    <!-- Bootstrap core CSS-->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom fonts for login-->
    <link href="assets/css/custom.css" rel="stylesheet">
</head>

<body class="bg-dark">
    <div class="container">
        <div class="card card-login mx-auto mt-5">
            <div class="card-header">Giriş</div>
            <div class="card-body">
                <form runat="server" id="formlogin">
                    <asp:Panel ID="pnl_warning" runat="server" Visible="false">
                    <div class="form-group card-header text-center">
                        <div class="alert-danger">
                        <asp:Label ID="lbl_warning" runat="server" Text="Label" CssClass="col-form-label text-center"></asp:Label>
                        </div>
                    </div>
                    </asp:Panel>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Email adresi</label>
                        <asp:TextBox ID="txt_email" runat="server" CssClass="form-control" placeholder="E-mail Giriniz" TextMode="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rqr_emil" runat="server" ErrorMessage="Geçerli E-mail Giriniz" ControlToValidate="txt_email" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rqrexpre_email" runat="server" ErrorMessage="Geçerli E-mail Giriniz" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txt_email" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                    </div>
                    <div class="form-group">
                        <div class="form-row">
                            <div class="col-md-6">
                                <label for="exampleInputPassword1">Şifre</label>
                                <asp:TextBox ID="txt_pass" runat="server" CssClass="form-control" placeholder="Şifrenizi Giriniz" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rqr_pass" runat="server" ErrorMessage="Şifrenizi Giriniz" ControlToValidate="txt_pass" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-check">
                            <label class="form-check-label">
                                <asp:CheckBox ID="chk_remember" runat="server" CssClass="form-check-input remembermecustom" />
                                Şifremi Hatırla</label>
                        </div>
                    </div>
                    <asp:Button ID="btn_login" runat="server" Text="Giriş Yap" CssClass="btn btn-primary btn-block" OnClick="btn_login_Click" />
                    <div class="text-center">
                        <a class="d-block small mt-3" href="register.aspx">Öğrenci Kayıt</a>
                        <a class="d-block small" href="forgotpassword.aspx">Şifremi Unuttum</a>
                        <a class="d-block small" href="admin/login.aspx">Sınav Yöneticisi Girişi</a>

                    </div>
                </form>

            </div>
        </div>
    </div>
</body>

</html>

