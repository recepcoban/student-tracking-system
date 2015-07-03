<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Giris.aspx.cs" Inherits="BitirmeWeb.admin.Giris" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="Tarayıcı ile Optik Form Okuma ve Öğrenci Takip Sistemi" />
    <meta name="author" content="" />

    <title>ÖTS | Yönetici Girişi</title>

    <!-- Bootstrap Core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet" />

    <!-- Custom CSS -->
    <link href="../css/agency.css" rel="stylesheet" />

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href='http://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css' />
    <link href='http://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css' />
    <link href='http://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css' />

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body id="page-top" class="index" style="background-color: #777;">

    <form id="form1" runat="server">

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <!-- Yönetici Girişi -->
        <asp:Panel runat="server" ID="yonetici_paneli">
            <section id="ogretmen">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 text-center">
                            <h2 class="section-heading">YÖNETİCİ GİRİŞİ</h2>
                        </div>
                    </div>

                    <div class="container">
                        <div class="row">
                            <div class="container">
                                <div class="well">

                                    <fieldset>
                                        <div class="col-lg-8 col-lg-offset-2 text-left">
                                            <br />
                                            <br />
                                            <asp:UpdatePanel runat="server" ID="updateGiris">
                                                <ContentTemplate>
                                                    <asp:TextBox ID="txtKadi" runat="server" CssClass="form-control" placeholder="Kullanıcı Adı" />
                                                    <asp:RequiredFieldValidator ErrorMessage="Bu Alan Boş Geçilemez!" ControlToValidate="txtKadi" runat="server" ValidationGroup="yonGiris" ForeColor="Red" Font-Size="Small" Font-Bold="true" />
                                                    <br />
                                                    <asp:TextBox ID="txtParola" TextMode="Password" runat="server" CssClass="form-control" placeholder="Parola" />
                                                    <asp:RequiredFieldValidator ErrorMessage="Bu Alan Boş Geçilemez!" ControlToValidate="txtParola" runat="server" ValidationGroup="yonGiris" ForeColor="Red" Font-Size="Small" Font-Bold="true" />
                                                    <br />
                                                    <asp:Button Text="GİRİŞ YAP" ID="btnGiris" OnClick="btnGiris_Click" runat="server" CssClass="btn btn-xl btn-lg btn-primary btn-block" ValidationGroup="yonGiris" />
                                                    <br />
                                                    <br />
                                                    <div class="text-center">
                                                        <asp:Label Text="" ID="lblGirisOK" runat="server" Font-Bold="true" ForeColor="Green" Font-Size="Small" />
                                                        <asp:Label Text="" ID="lblGirisFAIL" runat="server" Font-Bold="true" ForeColor="Red" Font-Size="Small" />
                                                    </div>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="btnGiris" EventName="Click" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                            <br />
                                        </div>
                                    </fieldset>

                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </section>
        </asp:Panel>

    </form>

    <!-- jQuery -->
    <script src="../js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../js/bootstrap.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../js/agency.js"></script>

</body>
</html>
