<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ogrenci.aspx.cs" Inherits="BitirmeWeb.Ogrenci" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>ÖTS | Öğrenci Paneli</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />

    <!-- Custom CSS -->
    <link href="css/agency.css" rel="stylesheet" />

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

    <style>
        .copy-left {
            display: inline-block;
            text-align: right;
            margin: 0;
            -moz-transform: scaleX(-1);
            -o-transform: scaleX(-1);
            -webkit-transform: scaleX(-1);
            transform: scaleX(-1);
            filter: FlipH;
            -ms-filter: "FlipH";
        }

        .auto-style1 {
            width: 492px;
        }
    </style>

</head>
<body id="page-top" class="index">

    <form id="form1" runat="server">

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <!-- Navbar -->
        <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand page-scroll" href="#page-top">Öğrenci Takip Sistemi</a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <asp:Label Text="" ID="lblSession" runat="server" CssClass="btn navbar-btn label-session" ForeColor="Gray" />
                        </li>
                        <li>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:Button ID="btnCikis" Text="Çıkış" OnClick="btnCikis_Click" OnClientClick="return confirm('Çıkış yapmak istediğine emin misin?');" CssClass="btn navbar-btn" BackColor="Transparent" ForeColor="DodgerBlue" runat="server" />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="btnCikis" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </li>

                    </ul>

                </div>
            </div>
        </div>

        <!-- Öğrenci Section -->
        <asp:Panel runat="server" ID="ogrenci_paneli">
            <section id="ogrenci">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 text-center">
                            <h2 class="section-heading">ÖĞRENCİ</h2>
                        </div>
                    </div>

                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="well" style="box-shadow: 0 0 30px black;">
                                    <ul class="nav nav-tabs">
                                        <li class="active"><a href="#profil" data-toggle="tab"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;&nbsp;<b>Profil</b></a></li>
                                        <li><a href="#rapor" data-toggle="tab"><span class="glyphicon glyphicon-signal"></span>&nbsp;&nbsp;&nbsp;<b>Raporlama</b></a></li>
                                        <li><a href="#ogretmens" data-toggle="tab"><span class="glyphicon glyphicon-folder-open"></span>&nbsp;&nbsp;&nbsp;<b>Öğretmenler</b></a></li>
                                        <li><a href="#ayar" data-toggle="tab"><span class="glyphicon glyphicon-cog"></span>&nbsp;&nbsp;&nbsp;<b>Ayarlar</b></a></li>
                                    </ul>

                                    <br />
                                    <div id="myTabContent" class="tab-content">
                                        <div class="tab-pane active in" id="profil">
                                            <fieldset>
                                                <div class="col-lg-4 col-lg-offset-1 text-center">

                                                    <asp:Image ID="imgProfilResim" Width="200" Height="200" CssClass="img-circle" AlternateText="Profil Resmi" ToolTip="Profil Resmi" runat="server" />
                                                    <br />
                                                    <br />
                                                    <asp:HyperLink Text="Resim Yükle" CssClass="btn btn-success" NavigateUrl='~/ResimYukle.aspx' Target="_parent" runat="server" />

                                                    <br />
                                                </div>
                                                <div class="col-lg-4">
                                                    <table class="table table-bordered">
                                                        <tbody>
                                                            <tr>
                                                                <td>No</td>
                                                                <td>
                                                                    <b>
                                                                        <asp:Label Text="" ID="lblID" runat="server" />
                                                                    </b>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>Adı</td>
                                                                <td>
                                                                    <b>
                                                                        <asp:Label Text="" ID="lblAdi" runat="server" />
                                                                    </b>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>Soyadı</td>
                                                                <td>
                                                                    <b>
                                                                        <asp:Label Text="" ID="lblSoyadi" runat="server" />
                                                                    </b>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>TC No</td>
                                                                <td>
                                                                    <b>
                                                                        <asp:Label Text="" ID="lblTC" runat="server" />
                                                                    </b>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>Sınıf</td>
                                                                <td>
                                                                    <b>
                                                                        <asp:Label Text="" ID="lblSinif" runat="server" />
                                                                    </b>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>E-posta</td>
                                                                <td>
                                                                    <b>
                                                                        <asp:Label Text="" ID="lblEposta" runat="server" />
                                                                    </b>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>Cinsiyet</td>
                                                                <td>
                                                                    <b>
                                                                        <asp:Label Text="" ID="lblCins" runat="server" />
                                                                    </b>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>Şube</td>
                                                                <td>
                                                                    <b>
                                                                        <asp:Label Text="" ID="lblSube" runat="server" />
                                                                    </b>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </fieldset>
                                        </div>
                                        <div class="tab-pane fade" id="rapor">
                                            <fieldset>
                                                <div class="col-lg-10 col-lg-offset-1">
                                                    <br />
                                                    <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Conditional">
                                                        <ContentTemplate>

                                                            <table class="table table-hover table-bordered table-responsive">
                                                                <tr class="text-center" style="background-color: #d5d5d5;">
                                                                    <td colspan="2">
                                                                        <asp:Label ID="lbl1SinavAdi" Font-Bold="true" ForeColor="DodgerBlue" runat="server" Text="Label"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="text-center">
                                                                        <asp:Chart ID="Chart1" runat="server">
                                                                            <Series>
                                                                                <asp:Series Name="Doğru" BorderColor="Black" Color="Green" Legend="Legend1"></asp:Series>
                                                                                <asp:Series Name="Yanlış" BorderColor="Black" Color="Red" Legend="Legend1"></asp:Series>
                                                                            </Series>
                                                                            <ChartAreas>
                                                                                <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                                                            </ChartAreas>
                                                                            <Legends>
                                                                                <asp:Legend Name="Legend1"></asp:Legend>
                                                                            </Legends>
                                                                        </asp:Chart>
                                                                    </td>
                                                                    <td>
                                                                        <table class="table table-bordered table-responsive" style="font-weight: bold;">
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="Label1" runat="server" Text="Türkçe Doğru"></asp:Label></td>
                                                                                <td>
                                                                                    <asp:Label ID="lbl1trD" runat="server" Text=""></asp:Label></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="Label2" runat="server" Text="Türkçe Yanlış"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label ID="lbl1trY" runat="server" Text=""></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="Label3" runat="server" Text="Sosyal Bilimler Doğru"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label ID="lbl1ssD" runat="server" Text=""></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="Label4" runat="server" Text="Sosyal Bilimler Yanlış"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label ID="lbl1ssY" runat="server" Text=""></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="Label5" runat="server" Text="Matematik Doğru"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label ID="lbl1mtD" runat="server" Text=""></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="Label6" runat="server" Text="Matematik Yanlış"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label ID="lbl1mtY" runat="server" Text=""></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="Label7" runat="server" Text="Fen Bilimleri Doğru"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label ID="lbl1fnD" runat="server" Text=""></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="Label8" runat="server" Text="Fen Bilimleri Yanlış"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label ID="lbl1fnY" runat="server" Text=""></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr class="well">
                                                                    <td colspan="2"></td>
                                                                </tr>
                                                                <tr class="text-center" style="background-color: #d5d5d5;">
                                                                    <td colspan="2">
                                                                        <asp:Label ID="lbl2SinavAdi" Font-Bold="true" ForeColor="DodgerBlue" runat="server" Text="Label"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="text-center">
                                                                        <asp:Chart ID="Chart2" runat="server">
                                                                            <Series>
                                                                                <asp:Series Name="Doğru" BorderColor="Black" Color="Green" Legend="Legend1"></asp:Series>
                                                                                <asp:Series Name="Yanlış" BorderColor="Black" Color="Red" Legend="Legend1"></asp:Series>
                                                                            </Series>
                                                                            <ChartAreas>
                                                                                <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                                                            </ChartAreas>
                                                                            <Legends>
                                                                                <asp:Legend Name="Legend1"></asp:Legend>
                                                                            </Legends>
                                                                        </asp:Chart>

                                                                    </td>
                                                                    <td>

                                                                        <table class="table table-bordered table-responsive" style="font-weight: bold;">
                                                                            <tr>
                                                                                <td>

                                                                                    <asp:Label ID="Label9" runat="server" Text="Türkçe Doğru"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label ID="lbl2trD" runat="server" Text=""></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="Label10" runat="server" Text="Türkçe Yanlış"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label ID="lbl2trY" runat="server" Text=""></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="Label11" runat="server" Text="Sosyal Bilimler Doğru"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label ID="lbl2ssD" runat="server"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="Label12" runat="server" Text="Sosyal Bilimler Yanlış"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label ID="lbl2ssY" runat="server"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="Label13" runat="server" Text="Matematik Doğru"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label ID="lbl2mtD" runat="server"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="Label14" runat="server" Text="Matematik Yanlış"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label ID="lbl2mtY" runat="server"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="Label15" runat="server" Text="Fen Bilimleri Doğru"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label ID="lbl2fnD" runat="server"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="Label16" runat="server" Text="Fen Bilimleri Yanlış"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label ID="lbl2fnY" runat="server"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr class="well">
                                                                    <td colspan="2"></td>
                                                                </tr>
                                                                <tr class="text-center" style="background-color: #d5d5d5;">
                                                                    <td colspan="2">
                                                                        <asp:Label ID="lbl3SinavAdi" runat="server" Font-Bold="true" ForeColor="DodgerBlue" Text="Label"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="text-center">
                                                                        <asp:Chart ID="Chart3" runat="server">
                                                                            <Series>
                                                                                <asp:Series Name="Doğru" BorderColor="Black" Color="Green" Legend="Legend1"></asp:Series>
                                                                                <asp:Series Name="Yanlış" BorderColor="Black" Color="Red" Legend="Legend1"></asp:Series>
                                                                            </Series>
                                                                            <ChartAreas>
                                                                                <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                                                            </ChartAreas>
                                                                            <Legends>
                                                                                <asp:Legend Name="Legend1"></asp:Legend>
                                                                            </Legends>
                                                                        </asp:Chart>

                                                                    </td>
                                                                    <td>
                                                                        <table class="table table-bordered table-responsive" style="font-weight: bold;">
                                                                            <tr>
                                                                                <td>

                                                                                    <asp:Label ID="Label17" runat="server" Text="Türkçe Doğru"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label ID="lbl3trD" runat="server"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="Label18" runat="server" Text="Türkçe Yanlış"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label ID="lbl3trY" runat="server"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="Label19" runat="server" Text="Sosyal Bilimler Doğru"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label ID="lbl3ssD" runat="server"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="Label20" runat="server" Text="Sosyal Bilimler Yanlış"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label ID="lbl3ssY" runat="server"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="auto-style6">
                                                                                    <asp:Label ID="Label21" runat="server" Text="Matematik Doğru"></asp:Label>
                                                                                </td>
                                                                                <td class="auto-style6">
                                                                                    <asp:Label ID="lbl3mtD" runat="server" Text=""></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="Label22" runat="server" Text="Matematik Yanlış"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label ID="lbl3mtY" runat="server" Text=""></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="Label23" runat="server" Text="Fen Bilimleri Doğru"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label ID="lbl3fnD" runat="server" Text=""></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="Label24" runat="server" Text="Fen Bilimleri Yanlış"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label ID="lbl3fnY" runat="server" Text=""></asp:Label>
                                                                                </td>
                                                                            </tr>

                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr class="well">
                                                                    <td colspan="2"></td>
                                                                </tr>
                                                                <tr class="text-center" style="background-color: #d5d5d5;">
                                                                    <td colspan="2">
                                                                        <asp:Label ID="lbl4SinavAdi" runat="server" Font-Bold="true" ForeColor="DodgerBlue" Text="Label"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="text-center">
                                                                        <asp:Chart ID="Chart8" runat="server">
                                                                            <Series>
                                                                                <asp:Series Name="Doğru" BorderColor="Black" Color="Green" Legend="Legend1"></asp:Series>
                                                                                <asp:Series Name="Yanlış" BorderColor="Black" Color="Red" Legend="Legend1"></asp:Series>
                                                                            </Series>
                                                                            <ChartAreas>
                                                                                <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                                                            </ChartAreas>
                                                                            <Legends>
                                                                                <asp:Legend Name="Legend1"></asp:Legend>
                                                                            </Legends>
                                                                        </asp:Chart>

                                                                    </td>
                                                                    <td>
                                                                        <table class="table table-bordered table-responsive" style="font-weight: bold;">
                                                                            <tr>
                                                                                <td>

                                                                                    <asp:Label ID="Label25" runat="server" Text="Türkçe Doğru"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label ID="lbl4trD" runat="server" Text=""></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="Label26" runat="server" Text="Türkçe Yanlış"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label ID="lbl4trY" runat="server" Text=""></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="Label27" runat="server" Text="Sosyal Bilimler Doğru"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label ID="lbl4ssD" runat="server" Text=""></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="Label28" runat="server" Text="Sosyal Bilimler Yanlış"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label ID="lbl4ssY" runat="server" Text=""></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="Label29" runat="server" Text="Matematik Doğru"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label ID="lbl4mtD" runat="server" Text=""></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="Label30" runat="server" Text="Matematik Yanlış"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label ID="lbl4mtY" runat="server" Text=""></asp:Label>

                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="Label31" runat="server" Text="Fen Bilimleri Doğru"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label ID="lbl4fnD" runat="server" Text=""></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="Label32" runat="server" Text="Fen Bilimleri Yanlış"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label ID="lbl4fnY" runat="server" Text=""></asp:Label>
                                                                                </td>
                                                                            </tr>

                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>

                                                            <br />
                                                            <br />

                                                            <table class="table table-hover table-bordered table-responsive">
                                                                <tr class="well text-center" style="background-color: #d5d5d5;">
                                                                    <td colspan="2">
                                                                        <asp:Label Text="Sözel Başarı Durumu" Font-Bold="true" ForeColor="DodgerBlue" runat="server" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="text-center">
                                                                        <asp:Chart ID="Chart4" runat="server">
                                                                            <Series>
                                                                                <asp:Series ChartType="Line" Name="Türkçe">
                                                                                </asp:Series>
                                                                            </Series>
                                                                            <ChartAreas>
                                                                                <asp:ChartArea Name="ChartArea1">
                                                                                </asp:ChartArea>
                                                                            </ChartAreas>
                                                                        </asp:Chart>
                                                                    </td>
                                                                    <td class="text-center">
                                                                        <asp:Chart ID="Chart5" runat="server">
                                                                            <Series>
                                                                                <asp:Series ChartType="Line" Name="Sosyal">
                                                                                </asp:Series>
                                                                            </Series>
                                                                            <ChartAreas>
                                                                                <asp:ChartArea Name="ChartArea1">
                                                                                </asp:ChartArea>
                                                                            </ChartAreas>
                                                                        </asp:Chart>
                                                                    </td>
                                                                </tr>
                                                                <tr class="well">
                                                                    <td colspan="2"></td>
                                                                </tr>
                                                                <tr class="well text-center" style="background-color: #d5d5d5;">
                                                                    <td colspan="2">
                                                                        <asp:Label Text="Sayısal Başarı Durumu" Font-Bold="true" ForeColor="DodgerBlue" runat="server" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="text-center">
                                                                        <asp:Chart ID="Chart6" runat="server">
                                                                            <Series>
                                                                                <asp:Series ChartType="Line" Name="Matematik">
                                                                                </asp:Series>
                                                                            </Series>
                                                                            <ChartAreas>
                                                                                <asp:ChartArea Name="ChartArea1">
                                                                                </asp:ChartArea>
                                                                            </ChartAreas>
                                                                        </asp:Chart>
                                                                    </td>
                                                                    <td class="text-center">
                                                                        <asp:Chart ID="Chart7" runat="server">
                                                                            <Series>
                                                                                <asp:Series ChartType="Line" Name="Fen">
                                                                                </asp:Series>
                                                                            </Series>
                                                                            <ChartAreas>
                                                                                <asp:ChartArea Name="ChartArea1">
                                                                                </asp:ChartArea>
                                                                            </ChartAreas>
                                                                        </asp:Chart>
                                                                    </td>
                                                                </tr>
                                                            </table>

                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>


                                                </div>
                                            </fieldset>
                                        </div>
                                        <div class="tab-pane fade" id="ogretmens">

                                            <asp:UpdatePanel runat="server">
                                                <ContentTemplate>
                                                    <fieldset>
                                                        <div class="col-lg-10 col-lg-offset-1 table-responsive">
                                                            <div class="col-lg-offset-1 col-lg-6">
                                                                <asp:TextBox CssClass="form-control" ID="txtOgrtAra" runat="server" placeholder="Aramak istediğiniz kişinin ADINI girin..." />
                                                            </div>
                                                            <div class="col-lg-3">
                                                                <asp:Button Text="ARA" ID="btnOgrtAra" OnClick="btnOgrtAra_Click" CssClass="btn btn-success col-lg-6" runat="server" />
                                                            </div>
                                                            <br />
                                                            <br />
                                                            <br />
                                                            <table class="table table-hover">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Adı</th>
                                                                        <th>Soyadı</th>
                                                                        <th>E-posta</th>
                                                                        <th>İşlem</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <asp:ListView ID="lstOgretmen" runat="server">
                                                                        <ItemTemplate>
                                                                            <tr>
                                                                                <td><%#Eval("ogrtAdi") %></td>
                                                                                <td><%#Eval("ogrtSoyadi") %></td>
                                                                                <td><%#Eval("ogrtMail") %></td>
                                                                                <td>
                                                                                    <asp:Button Text="Mesaj Yaz" ID="btnOgrtMesaj" OnClientClick="return confirm('Daha Kodlanmadı!');" CssClass="btn btn-info btnDuzenle" runat="server" />
                                                                                </td>
                                                                            </tr>
                                                                        </ItemTemplate>
                                                                    </asp:ListView>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </fieldset>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="btnOgrtAra" EventName="Click" />
                                                </Triggers>
                                            </asp:UpdatePanel>

                                        </div>
                                        <div class="tab-pane fade" id="ayar">
                                            <fieldset>
                                                <div class="col-lg-6 col-lg-offset-3">

                                                    <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:Button Text="Bilgileri Getir" ID="btnBilgiGetir" OnClick="btnBilgiGetir_Click" CssClass="btn btn-default pull-right" runat="server" />
                                                            <br />
                                                            <br />
                                                            <asp:TextBox runat="server" ID="txtAyarID" Enabled="false" CssClass="form-control" placeholder="No" />
                                                            <br />
                                                            <asp:TextBox runat="server" ID="txtAyarAdi" Enabled="false" CssClass="form-control" placeholder="Adı" />
                                                            <br />
                                                            <asp:TextBox runat="server" ID="txtAyarSoyadi" Enabled="false" CssClass="form-control" placeholder="Soyadı" />
                                                            <br />
                                                            <asp:TextBox runat="server" ID="txtAyarTC" Enabled="false" CssClass="form-control" placeholder="TC No" />
                                                            <br />
                                                            <asp:TextBox runat="server" ID="txtAyarSinif" CssClass="form-control" placeholder="Sinif" ToolTip="Sınıf" />
                                                            <asp:RequiredFieldValidator ErrorMessage="Bu Alan Boş Geçilemez!" ControlToValidate="txtAyarSinif" runat="server" Font-Bold="true" Font-Size="Small" ForeColor="Red" ValidationGroup="ogrAyar" />
                                                            <br />
                                                            <asp:DropDownList runat="server" ID="dropAyarCinsiyet" CssClass="form-control">
                                                                <asp:ListItem Text="Seçiniz" />
                                                                <asp:ListItem Text="Bay" />
                                                                <asp:ListItem Text="Bayan" />
                                                            </asp:DropDownList>
                                                            <br />
                                                            <asp:TextBox runat="server" ID="txtAyarSube" CssClass="form-control" placeholder="Sınıf Şubesi" />
                                                            <asp:RequiredFieldValidator ErrorMessage="Bu Alan Boş Geçilemez!" ControlToValidate="txtAyarSube" runat="server" Font-Bold="true" Font-Size="Small" ForeColor="Red" ValidationGroup="ogrAyar" />
                                                            <br />
                                                            <asp:TextBox runat="server" ID="txtAyarEposta" CssClass="form-control" placeholder="E-posta" />
                                                            <asp:RequiredFieldValidator ErrorMessage="Bu Alan Boş Geçilemez!" ControlToValidate="txtAyarEposta" runat="server" Font-Bold="true" Font-Size="Small" ForeColor="Red" ValidationGroup="ogrAyar" />
                                                            <br />
                                                            <asp:TextBox runat="server" ID="txtAyarParola" TextMode="Password" CssClass="form-control" placeholder="Parola" />
                                                            <asp:RequiredFieldValidator ErrorMessage="Bu Alan Boş Geçilemez!" ControlToValidate="txtAyarParola" runat="server" Font-Bold="true" Font-Size="Small" ForeColor="Red" ValidationGroup="ogrAyar" />
                                                            <br />
                                                            <asp:TextBox runat="server" ID="txtAyarParolaTekrar" TextMode="Password" CssClass="form-control" placeholder="Parola (Tekrar)" />
                                                            <asp:RequiredFieldValidator ErrorMessage="Bu Alan Boş Geçilemez!" ControlToValidate="txtAyarParolaTekrar" runat="server" Font-Bold="true" Font-Size="Small" ForeColor="Red" ValidationGroup="ogrAyar" />
                                                            <br />
                                                            <asp:Button Text="GÜNCELLE" runat="server" ID="btnGuncelle" OnClick="btnGuncelle_Click" CssClass="btn btn-xl btn-lg btn-primary btn-block" ValidationGroup="ogrAyar" />
                                                            <br />
                                                            <div class="text-center">
                                                                <asp:Label Text="" ForeColor="Green" ID="lblAyarOK" runat="server" />
                                                                <asp:Label Text="" ForeColor="Red" ID="lblAyarFAIL" runat="server" />
                                                            </div>

                                                            <script type="text/javascript">
                                                                function btnGuncelleEnable() {
                                                                    var p1 = $("#txtAyarParola").val();
                                                                    var p2 = $("#txtAyarParolaTekrar").val();
                                                                    if (p1 == p2) {
                                                                        document.getElementById("btnGuncelle").disabled = false;
                                                                    }
                                                                    else {
                                                                        document.getElementById("btnGuncelle").disabled = true;
                                                                    }
                                                                }
                                                                setInterval("btnGuncelleEnable()", 100);
                                                            </script>

                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="btnGuncelle" EventName="Click" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>

                                                </div>
                                            </fieldset>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </asp:Panel>

        <!-- Footer -->
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <span class="copyright">CopyLEFT <span class="copy-left">&copy;</span> Öğrenci Takip Sistemi 2015</span>
                    </div>
                    <div class="col-md-4">
                        <ul class="list-inline social-buttons">
                            <li><a href="#"><i class="fa fa-twitter"></i></a>
                            </li>
                            <li><a href="#"><i class="fa fa-facebook"></i></a>
                            </li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-4">
                        <ul class="list-inline quicklinks">
                            <li><a href="#PrivacyPolicy" class="portfolio-link" data-toggle="modal">Gizlilik Politikası</a>
                            </li>
                            <li><a href="#TermsOfUse" class="portfolio-link" data-toggle="modal">Kullanım Şartları</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </footer>

        <!-- PrivacyPolicy Modal  -->
        <div class="portfolio-modal modal fade" id="PrivacyPolicy" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-content">
                <div class="close-modal" data-dismiss="modal">
                    <div class="lr">
                        <div class="rl">
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-lg-offset-2">
                            <div class="modal-body">
                                <h2>GİZLİLİK POLİTİKASI</h2>
                                <p>
                                    Ekip olarak kişisel gizlilik haklarınıza saygı duyuyor ve sitemizde geçirdiğiniz süre zarfında bunu sağlamak için çaba sarfediyoruz. Kişisel bilgilerinizin güvenliği ile ilgili açıklamalar aşağıda açıklanmış ve bilginize sunulmuştur.
    <br />
                                    <b>Çerezler (Cookies)</b><br />
                                    “Cookie - Çerez” kelimesi web sayfası sunucusunun sizin bilgisayarınızın hard diskine yerleştirdiği ufak bir text dosyasını tanımlamak için kullanılmaktadır. Sitemizin bazı bölümlerinde kullanıcı kolaylığı sağlamak için çerez kullanılıyor olabilir. Ayrıca sitede mevcut bulunan reklamlar aracılığıyla, reklam verilerinin toplanması için cookie ve web beacon kullanılıyor olabilir. Bu tamamen sizin izninizle gerçekleşiyor olup, isteğiniz dahilinde internet tarayıcınızın ayarlarını değiştirerek bunu engellemeniz mümkündür.
    <br />
                                    <b>Dış Bağlantılar</b><br />
                                    Sitemiz, sayfalarından farklı internet adreslerine bağlantı vermektedir. sitemiz link verdiği, banner tanıtımını yaptığı sitelerin içeriklerinden veya gizlilik prensiplerinden sorumlu değildir. Burada bahsedilen bağlantı verme işlemi, hukuki olarak “atıfta bulunma” olarak değerlendirilmektedir.
    <br />
                                    <b>İletişim</b><br />
                                    Sitemizde uygulanan gizlilik politikası ile ilgili; her türlü soru, görüş ve düşüncelerinizi bize iletişim formundan iletebilirsiniz.
                                </p>
                                <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i>Kapat</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- TermsOfUse Modal  -->
        <div class="portfolio-modal modal fade" id="TermsOfUse" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-content">
                <div class="close-modal" data-dismiss="modal">
                    <div class="lr">
                        <div class="rl">
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-lg-offset-2">
                            <div class="modal-body">
                                <h2>KULLANIM ŞARTLARI</h2>
                                <p>
                                    Siteye erişiminizden veya siteyi kullanımınızdan önce lütfen bu sözleşmeyi dikkatle okuyunuz. Siteye erişmekle veya siteyi kullanmakla, aşağıda belirtilen şartlar ve hükümlerle bağlı olmayı kabul etmektesiniz. Eğer bu şartlar ve hükümlerle bağlı olmak istemezseniz, siteye erişmeyebilir veya siteyi kullanmayabilirsiniz ve böyle bir kullanıma başladıysanız kullanımı derhal durdurmalısınız.
                                <br />
                                    <br />
                                    Sitemiz bu sözleşmede her zaman değişiklik yapabilir ve bu değişiklikler değiştirilmiş sözleşmenin siteye konulmasıyla derhal yürürlük kazanır. Siz bu değişikliklerden haberdar olmak amacıyla periyodik olarak sözleşmeyi gözden geçirmeyi kabul etmektesiniz ve siteye devam eden erişiminiz veya devam eden siteyi kullanımınız değiştirilmiş sözleşmeyi kesin olarak kabul ettiğiniz anlamına gelecektir.
                                </p>
                                <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i>Kapat</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </form>

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="js/classie.js"></script>
    <script src="js/cbpAnimatedHeader.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="js/jqBootstrapValidation.js"></script>
    <script src="js/contact_me.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/agency.js"></script>

</body>
</html>
