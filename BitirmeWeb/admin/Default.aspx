<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BitirmeWeb.admin.Default" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="Tarayıcı ile Optik Form Okuma ve Öğrenci Takip Sistemi" />
    <meta name="author" content="" />

    <title>ÖTS | Yönetici Paneli</title>

    <!-- Bootstrap Core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet" />

    <!-- Custom CSS -->
    <link href="../css/agency.css" rel="stylesheet" />

    <!-- Custom Fonts -->
    <link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
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
    </style>

</head>
<body id="page-top" class="index">

    <form id="form1" runat="server">

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <!-- Menü -->
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
                            <a>
                                <asp:Label Text="" ID="lblSession" runat="server" />
                            </a>
                        </li>
                        <li>
                            <asp:LinkButton Text="Çıkış" ID="lnkCikis" OnClick="lnkCikis_Click" OnClientClick="return confirm('Çıkış yapmak istediğine emin misin?');" runat="server" />
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- Yönetici -->
        <asp:Panel runat="server" ID="yonetici_paneli">
            <section id="ogretmen">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 text-center">
                            <h2 class="section-heading">YÖNETİCİ</h2>
                        </div>
                    </div>

                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="well" style="box-shadow: 0 0 30px black;">
                                    <ul class="nav nav-tabs">
                                        <li class="active"><a href="#profil" data-toggle="tab"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;&nbsp;<b>Profil</b></a></li>
                                        <li><a href="#yoneticiler" data-toggle="tab"><span class="glyphicon glyphicon-folder-open" onclick=""></span>&nbsp;&nbsp;&nbsp;<b>Yöneticiler</b></a></li>
                                        <li><a href="#dersekle" data-toggle="tab"><span class="glyphicon glyphicon-plus"></span>&nbsp;&nbsp;&nbsp;<b>Ders Ekle</b></a></li>
                                        <li><a href="#ogretmenler" data-toggle="tab"><span class="glyphicon glyphicon-folder-open"></span>&nbsp;&nbsp;&nbsp;<b>Öğretmenler</b></a></li>
                                        <li><a href="#ogretmenekle" data-toggle="tab"><span class="glyphicon glyphicon-plus-sign"></span>&nbsp;&nbsp;&nbsp;<b>Öğretmen Ekle</b></a></li>
                                        <li><a href="#ayar" onclick="" data-toggle="tab"><span class="glyphicon glyphicon-cog"></span>&nbsp;&nbsp;&nbsp;<b>Ayarlar</b></a></li>
                                    </ul>
                                    <br />
                                    <div id="myTabContent" class="tab-content">
                                        <div class="tab-pane active in" id="profil">
                                            <fieldset>
                                                <br />
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
                                                                <td>ID</td>
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
                                                                <td>Kullanıcı Adı</td>
                                                                <td>
                                                                    <b>
                                                                        <asp:Label Text="" ID="lblKadi" runat="server" />
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
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <br />
                                            </fieldset>
                                        </div>
                                        <div class="tab-pane fade" id="yoneticiler">

                                            <asp:UpdatePanel runat="server">
                                                <ContentTemplate>
                                                    <fieldset>
                                                        <div class="col-lg-10 col-lg-offset-1 table-responsive">
                                                            <br />
                                                            <div class="col-lg-offset-1 col-lg-6">
                                                                <asp:TextBox CssClass="form-control" ID="txtYonAra" runat="server" placeholder="Aranacak kişinin adını/soyadını girin..." />
                                                            </div>
                                                            <div class="col-lg-3">
                                                                <asp:Button Text="ARA" ID="btnYonAra" CssClass="btn btn-success col-lg-6" runat="server" />
                                                            </div>
                                                            <br />
                                                            <br />
                                                            <br />
                                                            <br />
                                                            <table class="table table-hover">
                                                                <thead>
                                                                    <tr>
                                                                        <th>ID</th>
                                                                        <th>Adı</th>
                                                                        <th>Soyadı</th>
                                                                        <th>Kullanıcı Adı</th>
                                                                        <th>E-posta</th>
                                                                        <th>İşlem</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <asp:ListView ID="lstYonetici" runat="server">
                                                                        <ItemTemplate>
                                                                            <tr>
                                                                                <td><%#Eval("yonID") %></td>
                                                                                <td><%#Eval("yonAdi") %></td>
                                                                                <td><%#Eval("yonSoyadi") %></td>
                                                                                <td><%#Eval("yonKadi") %></td>
                                                                                <td><%#Eval("yonMail") %></td>
                                                                                <td>
                                                                                    <asp:Button Text="Mesaj Yaz" ID="btnYonMesaj" OnClientClick="return confirm('Henüz Kodlanmadı!');" CssClass="btn btn-info btnDuzenle" runat="server" />
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
                                                    <asp:AsyncPostBackTrigger ControlID="btnYonAra" EventName="Click" />
                                                </Triggers>
                                            </asp:UpdatePanel>

                                        </div>
                                        <div class="tab-pane fade" id="ogretmenler">
                                            <fieldset>
                                                <div class="col-lg-10 col-lg-offset-1 table-responsive">
                                                    <asp:UpdatePanel runat="server">
                                                        <ContentTemplate>
                                                            <br />
                                                            <div class="col-lg-offset-1 col-lg-6">
                                                                <asp:TextBox CssClass="form-control" ID="txtOgrtAra" runat="server" placeholder="Aranacak kişinin adını/soyadını girin..." />
                                                            </div>
                                                            <div class="col-lg-3">
                                                                <asp:Button Text="ARA" ID="btnOgrtAra" CssClass="btn btn-success col-lg-6" runat="server" />
                                                            </div>
                                                            <br />
                                                            <br />
                                                            <br />
                                                            <br />

                                                            <!-- Ogretmenler Listesi -->
                                                            <asp:GridView ID="GridView1" runat="server" CssClass="col-lg-12 table table-responsive table-hover table-bordered" AutoGenerateColumns="False" DataKeyNames="ogrtID" DataSourceID="OgretmenlerListesi">
                                                                <Columns>
                                                                    <asp:BoundField DataField="ogrtID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ogrtID" />
                                                                    <asp:BoundField DataField="ogrtAdi" HeaderText="Adı" SortExpression="ogrtAdi" />
                                                                    <asp:BoundField DataField="ogrtSoyadi" HeaderText="Soyadı" SortExpression="ogrtSoyadi" />
                                                                    <asp:BoundField DataField="ogrtKadi" HeaderText="Kullanıcı Adı" SortExpression="ogrtKadi" />
                                                                    <asp:BoundField DataField="ogrtMail" HeaderText="E-posta" SortExpression="ogrtMail" />
                                                                    <asp:BoundField DataField="dersID" HeaderText="Ders ID" SortExpression="dersID" />
                                                                    <asp:TemplateField HeaderText="İşlem" ShowHeader="False">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Sil" OnClientClick="return confirm('Silmek istediğine emin misin?');"></asp:LinkButton>
                                                                        </ItemTemplate>
                                                                        <ControlStyle CssClass="btn btn-danger btnSil" />
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>


                                                            <asp:SqlDataSource ID="OgretmenlerListesi" runat="server" ConnectionString="<%$ ConnectionStrings:DB_Bitirme %>" DeleteCommand="DELETE FROM [Ogretmen] WHERE [ogrtID] = @ogrtID" InsertCommand="INSERT INTO [Ogretmen] ([ogrtAdi], [ogrtSoyadi], [ogrtKadi], [ogrtMail], [ogrtParola], [dersID]) VALUES (@ogrtAdi, @ogrtSoyadi, @ogrtKadi, @ogrtMail, @ogrtParola, @dersID)" SelectCommand="SELECT * FROM [Ogretmen]" UpdateCommand="UPDATE [Ogretmen] SET [ogrtAdi] = @ogrtAdi, [ogrtSoyadi] = @ogrtSoyadi, [ogrtKadi] = @ogrtKadi, [ogrtMail] = @ogrtMail, [ogrtParola] = @ogrtParola, [dersID] = @dersID WHERE [ogrtID] = @ogrtID">
                                                                <DeleteParameters>
                                                                    <asp:Parameter Name="ogrtID" Type="Int32" />
                                                                </DeleteParameters>
                                                                <InsertParameters>
                                                                    <asp:Parameter Name="ogrtAdi" Type="String" />
                                                                    <asp:Parameter Name="ogrtSoyadi" Type="String" />
                                                                    <asp:Parameter Name="ogrtKadi" Type="String" />
                                                                    <asp:Parameter Name="ogrtMail" Type="String" />
                                                                    <asp:Parameter Name="ogrtParola" Type="String" />
                                                                    <asp:Parameter Name="dersID" Type="Int32" />
                                                                </InsertParameters>
                                                                <UpdateParameters>
                                                                    <asp:Parameter Name="ogrtAdi" Type="String" />
                                                                    <asp:Parameter Name="ogrtSoyadi" Type="String" />
                                                                    <asp:Parameter Name="ogrtKadi" Type="String" />
                                                                    <asp:Parameter Name="ogrtMail" Type="String" />
                                                                    <asp:Parameter Name="ogrtParola" Type="String" />
                                                                    <asp:Parameter Name="dersID" Type="Int32" />
                                                                    <asp:Parameter Name="ogrtID" Type="Int32" />
                                                                </UpdateParameters>
                                                            </asp:SqlDataSource>
                                                            <!-- /Ogretmenler Listesi -->





                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="btnOgrtKaydet" EventName="Click" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                </div>
                                            </fieldset>
                                        </div>
                                        <div class="tab-pane fade" id="ogretmenekle">
                                            <fieldset>
                                                <div class="col-lg-6 col-lg-offset-3 text-left">

                                                    <asp:UpdatePanel runat="server" ID="UpdatePanelOgrtEkle" UpdateMode="Always">
                                                        <ContentTemplate>
                                                            <asp:TextBox runat="server" ID="txtOgrtAdi" CssClass="form-control" placeholder="Adı" />
                                                            <asp:RequiredFieldValidator ErrorMessage="Bu Alan Boş Geçilemez!" ControlToValidate="txtOgrtAdi" ValidationGroup="ogrtEkle" ForeColor="Red" Font-Bold="true" Font-Size="Small" runat="server" />
                                                            <br />
                                                            <asp:TextBox runat="server" ID="txtOgrtSoyadi" CssClass="form-control" placeholder="Soyadı" />
                                                            <asp:RequiredFieldValidator ErrorMessage="Bu Alan Boş Geçilemez!" ControlToValidate="txtOgrtSoyadi" ValidationGroup="ogrtEkle" ForeColor="Red" Font-Bold="true" Font-Size="Small" runat="server" />
                                                            <br />
                                                            <asp:TextBox runat="server" ID="txtOgrtKadi" CssClass="form-control" placeholder="Kullanıcı Adı" />
                                                            <asp:RequiredFieldValidator ErrorMessage="Bu Alan Boş Geçilemez!" ControlToValidate="txtOgrtKadi" ValidationGroup="ogrtEkle" ForeColor="Red" Font-Bold="true" Font-Size="Small" runat="server" />
                                                            <br />
                                                            <asp:TextBox runat="server" ID="txtOgrtMail" CssClass="form-control" placeholder="E-posta" />
                                                            <asp:RequiredFieldValidator ErrorMessage="Bu Alan Boş Geçilemez!" ControlToValidate="txtOgrtMail" ValidationGroup="ogrtEkle" ForeColor="Red" Font-Bold="true" Font-Size="Small" runat="server" />
                                                            <br />
                                                            <asp:DropDownList runat="server" CssClass="form-control" ID="drOgrtDersID" AppendDataBoundItems="True">
                                                                <asp:ListItem Text="Seçiniz" />
                                                            </asp:DropDownList>
                                                            <br />
                                                            <asp:Button Text="KAYDET" OnClick="btnOgrtKaydet_Click" runat="server" ID="btnOgrtKaydet" CssClass="btn btn-xl btn-lg btn-primary btn-block" ValidationGroup="ogrtEkle" />

                                                            <br />
                                                            <div class="text-center">
                                                                <asp:Label Text="" ForeColor="Green" ID="lblOgrtOK" runat="server" />
                                                                <asp:Label Text="" ForeColor="Red" ID="lblOgrtFAIL" runat="server" />
                                                            </div>

                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="btnOgrtKaydet" EventName="Click" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>

                                                </div>
                                            </fieldset>
                                        </div>
                                        <div class="tab-pane fade" id="dersekle">
                                            <fieldset>
                                                <div class="col-lg-6 col-lg-offset-3">



                                                    <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:GridView ID="GridView2" CssClass="table table-responsive table-hover table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="dersID" DataSourceID="DersListesi">
                                                                <Columns>
                                                                    <asp:BoundField DataField="dersID" HeaderText="Ders ID" InsertVisible="False" ReadOnly="True" SortExpression="dersID" />
                                                                    <asp:BoundField DataField="dersAdi" HeaderText="Ders Adı" SortExpression="dersAdi" />
                                                                    <asp:CommandField HeaderText="Düzenle" ShowEditButton="True" EditText="Düzenle" ControlStyle-CssClass="btn btn-info btnDuzenle" CancelText="İptal" DeleteText="Sil" InsertText="Ekle" UpdateText="Güncelle">
                                                                        <ControlStyle CssClass="btn btn-info btnDuzenle" />
                                                                    </asp:CommandField>
                                                                    <asp:TemplateField HeaderText="Sil" ShowHeader="False">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Sil" OnClientClick="return confirm('Silmek istediğine emin misin?'); "></asp:LinkButton>
                                                                        </ItemTemplate>
                                                                        <ControlStyle CssClass="btn btn-danger btnSil" />
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>
                                                            <asp:SqlDataSource ID="DersListesi" runat="server" ConnectionString="<%$ ConnectionStrings:DB_Bitirme %>" DeleteCommand="DELETE FROM [Ders] WHERE [dersID] = @dersID" InsertCommand="INSERT INTO [Ders] ([dersAdi]) VALUES (@dersAdi)" SelectCommand="SELECT * FROM [Ders]" UpdateCommand="UPDATE [Ders] SET [dersAdi] = @dersAdi WHERE [dersID] = @dersID">
                                                                <DeleteParameters>
                                                                    <asp:Parameter Name="dersID" Type="Int32" />
                                                                </DeleteParameters>
                                                                <InsertParameters>
                                                                    <asp:Parameter Name="dersAdi" Type="String" />
                                                                </InsertParameters>
                                                                <UpdateParameters>
                                                                    <asp:Parameter Name="dersAdi" Type="String" />
                                                                    <asp:Parameter Name="dersID" Type="Int32" />
                                                                </UpdateParameters>
                                                            </asp:SqlDataSource>

                                                            <asp:TextBox runat="server" ID="txtDersAdi" placeholder="Ders Adı" CssClass="form-control" />
                                                            <asp:RequiredFieldValidator ErrorMessage="Bu Alan Boş Geçilemez!" ValidationGroup="dersKayit" ControlToValidate="txtDersAdi" runat="server" ForeColor="Red" Font-Bold="true" Font-Size="Small" />
                                                            <br />
                                                            <asp:Button Text="KAYDET" runat="server" ID="btnDersEkle" OnClick="btnDersEkle_Click" CssClass="btn btn-xl btn-lg btn-primary btn-block" ValidationGroup="dersKayit" />
                                                            <br />

                                                            <div class="text-center">
                                                                <asp:Label Text="" ForeColor="Green" ID="lblDersOK" runat="server" />
                                                                <asp:Label Text="" ForeColor="Red" ID="lblDersFAIL" runat="server" />
                                                            </div>


                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="btnDersEkle" EventName="Click" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>

                                                </div>
                                            </fieldset>
                                        </div>
                                        <div class="tab-pane fade" id="ayar">
                                            <fieldset>
                                                <div class="col-lg-6 col-lg-offset-3 text-left">

                                                    <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:Button Text="Bilgileri Getir" ID="btnBilgiGetir" OnClick="btnBilgiGetir_Click" CssClass="btn btn-default pull-right" runat="server" />
                                                            <br />
                                                            <br />
                                                            <asp:TextBox runat="server" ID="txtAyarID" Enabled="false" CssClass="form-control" placeholder="ID" />
                                                            <br />
                                                            <asp:TextBox runat="server" ID="txtAyarAdi" Enabled="false" CssClass="form-control" placeholder="Adı" />
                                                            <br />
                                                            <asp:TextBox runat="server" ID="txtAyarSoyadi" Enabled="false" CssClass="form-control" placeholder="Soyadı" />
                                                            <br />
                                                            <asp:TextBox runat="server" ID="txtAyarKadi" Enabled="false" CssClass="form-control" placeholder="Kullanıcı Adı" />
                                                            <br />
                                                            <asp:TextBox runat="server" ID="txtAyarEposta" CssClass="form-control" placeholder="E-posta" />
                                                            <asp:RequiredFieldValidator ErrorMessage="Bu Alan Boş Geçilemez!" ControlToValidate="txtAyarEposta" runat="server" ForeColor="Red" Font-Bold="true" Font-Size="Small" ValidationGroup="yonAyar" />
                                                            <br />
                                                            <asp:TextBox runat="server" ID="txtAyarParola" TextMode="Password" CssClass="form-control" placeholder="Parola" />
                                                            <asp:RequiredFieldValidator ErrorMessage="Bu Alan Boş Geçilemez!" ControlToValidate="txtAyarParola" runat="server" ForeColor="Red" Font-Bold="true" Font-Size="Small" ValidationGroup="yonAyar" />
                                                            <br />
                                                            <asp:TextBox runat="server" ID="txtAyarParolaTekrar" TextMode="Password" CssClass="form-control" placeholder="Parola (Tekrar)" />
                                                            <asp:RequiredFieldValidator ErrorMessage="Bu Alan Boş Geçilemez!" ControlToValidate="txtAyarParolaTekrar" runat="server" ForeColor="Red" Font-Bold="true" Font-Size="Small" ValidationGroup="yonAyar" />
                                                            <br />
                                                            <asp:Button Text="GÜNCELLE" runat="server" ID="btnGuncelle" OnClick="btnGuncelle_Click" CssClass="btn btn-xl btn-lg btn-primary btn-block" ValidationGroup="yonAyar" />
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
    <script src="../js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="../js/classie.js"></script>
    <script src="../js/cbpAnimatedHeader.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="../js/jqBootstrapValidation.js"></script>
    <script src="../js/contact_me.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../js/agency.js"></script>

</body>
</html>

