<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ogretmen.aspx.cs" Inherits="BitirmeWeb.Ogretmen" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>ÖTS | Öðretmen Paneli</title>

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
    </style>

</head>
<body id="page-top" class="index">

    <form id="form1" runat="server" enctype="multipart/form-data">

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <!-- menü   -->
        <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand page-scroll" href="#page-top">Öðrenci Takip Sistemi</a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <asp:Label Text="" ID="lblSession" runat="server" CssClass="btn navbar-btn label-session" ForeColor="Gray" />
                        </li>
                        <li>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:Button ID="btnCikis" Text="Çýkýþ" OnClick="btnCikis_Click" OnClientClick="return confirm('Çýkýþ yapmak istediðine emin misin?');" CssClass="btn navbar-btn" BackColor="Transparent" ForeColor="DodgerBlue" runat="server" />
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

        <!-- Öðretmen Section -->
        <asp:Panel runat="server" ID="ogretmen_paneli">
            <section id="ogretmen">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 text-center">
                            <h2 class="section-heading">ÖÐRETMEN</h2>
                        </div>
                    </div>

                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="well" style="box-shadow: 0 0 30px black;">
                                    <ul class="nav nav-tabs">
                                        <li class="active"><a href="#profil" data-toggle="tab"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;&nbsp;<b>Profil</b></a></li>
                                        <li><a href="#sinavekle" data-toggle="tab"><span class="glyphicon glyphicon-plus"></span>&nbsp;&nbsp;&nbsp;<b>Sinav Ekle</b></a></li>
                                        <li>
                                            <asp:LinkButton PostBackUrl="~/SonucEkle.aspx" runat="server"><span class="glyphicon glyphicon-plus"></span>&nbsp;&nbsp;&nbsp;<b>Sonuç Ekle</b></asp:LinkButton>
                                        </li>
                                        <li><a href="#rapor" data-toggle="tab"><span class="glyphicon glyphicon-signal"></span>&nbsp;&nbsp;&nbsp;<b>Raporlama</b></a></li>
                                        <li><a href="#ogretmens" data-toggle="tab"><span class="glyphicon glyphicon-folder-open"></span>&nbsp;&nbsp;&nbsp;<b>Öðretmenler</b></a></li>
                                        <li><a href="#ogrencis" data-toggle="tab"><span class="glyphicon glyphicon-folder-open"></span>&nbsp;&nbsp;&nbsp;<b>Öðrenciler</b></a></li>
                                        <li><a href="#velis" data-toggle="tab"><span class="glyphicon glyphicon-folder-open"></span>&nbsp;&nbsp;&nbsp;<b>Veliler</b></a></li>
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
                                                                <td>ID</td>
                                                                <td>
                                                                    <b>
                                                                        <asp:Label Text="" ID="lblID" runat="server" />
                                                                    </b>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>Adý</td>
                                                                <td>
                                                                    <b>
                                                                        <asp:Label Text="" ID="lblAdi" runat="server" />
                                                                    </b>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>Soyadý</td>
                                                                <td>
                                                                    <b>
                                                                        <asp:Label Text="" ID="lblSoyadi" runat="server" />
                                                                    </b>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>Kullanýcý Adý</td>
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
                                                            <tr>
                                                                <td>Ders ID</td>
                                                                <td>
                                                                    <b>
                                                                        <asp:Label Text="" ID="lblDersID" runat="server" />
                                                                    </b>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </fieldset>
                                        </div>
                                        <div class="tab-pane fade" id="sinavekle">
                                            <fieldset>
                                                <asp:UpdatePanel runat="server" ID="UpdatePanelSinavEkle" UpdateMode="Always">
                                                    <ContentTemplate>
                                                        <br />

                                                        <div class="col-lg-12">

                                                            <asp:GridView ID="GridView1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="col-lg-12 table table-responsive table-hover table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="sinavID" DataSourceID="SinavListesi" AllowPaging="True">
                                                                <Columns>
                                                                    <asp:BoundField HeaderStyle-Width="50" DataField="sinavID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="sinavID" HeaderStyle-BackColor="#D5D5D5">
                                                                        <HeaderStyle BackColor="#D5D5D5" Width="50px" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField HeaderStyle-Width="150" DataField="sinavAdi" HeaderText="Adý" SortExpression="sinavAdi" HeaderStyle-BackColor="#D5D5D5">
                                                                        <HeaderStyle BackColor="#D5D5D5" Width="150px" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="sinavCevap" HeaderText="Cevap Anahtarý" SortExpression="sinavCevap" HeaderStyle-BackColor="#D5D5D5">
                                                                        <HeaderStyle BackColor="#D5D5D5" />
                                                                    </asp:BoundField>
                                                                    <asp:TemplateField HeaderText="Sil" ShowHeader="False">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" ForeColor="Red" OnClientClick="return confirm('Silmek istediðine emin misin!');" Text="Sil"></asp:LinkButton>
                                                                        </ItemTemplate>
                                                                        <HeaderStyle BackColor="#D5D5D5" Width="50px" />
                                                                    </asp:TemplateField>
                                                                    <asp:ButtonField Text="Düzenle" ControlStyle-ForeColor="Green" HeaderText="Düzenle" HeaderStyle-BackColor="#D5D5D5" HeaderStyle-Width="100px" CommandName="select" />
                                                                </Columns>
                                                            </asp:GridView>

                                                            <asp:SqlDataSource ID="SinavListesi" runat="server" ConnectionString="<%$ ConnectionStrings:DB_Bitirme %>" DeleteCommand="DELETE FROM [Sinav] WHERE [sinavID] = @sinavID" InsertCommand="INSERT INTO [Sinav] ([sinavAdi], [sinavCevap]) VALUES (@sinavAdi, @sinavCevap)" SelectCommand="SELECT [sinavID], [sinavAdi], [sinavCevap] FROM [Sinav]" UpdateCommand="UPDATE [Sinav] SET [sinavAdi] = @sinavAdi, [sinavCevap] = @sinavCevap WHERE [sinavID] = @sinavID">
                                                                <DeleteParameters>
                                                                    <asp:Parameter Name="sinavID" Type="Int32" />
                                                                </DeleteParameters>
                                                                <InsertParameters>
                                                                    <asp:Parameter Name="sinavAdi" Type="String" />
                                                                    <asp:Parameter Name="sinavCevap" Type="String" />
                                                                </InsertParameters>
                                                                <UpdateParameters>
                                                                    <asp:Parameter Name="sinavAdi" Type="String" />
                                                                    <asp:Parameter Name="sinavCevap" Type="String" />
                                                                    <asp:Parameter Name="sinavID" Type="Int32" />
                                                                </UpdateParameters>
                                                            </asp:SqlDataSource>


                                                        </div>


                                                        <asp:Panel Visible="false" ID="panelCevapAnahtariDegisiklik" runat="server">

                                                            <div class="col-lg-8 col-lg-offset-2 text-left">
                                                                <br />
                                                                <div class="col-lg-4">
                                                                    <asp:Label ID="lblsinavId" CssClass="form-control" BackColor="#d5d5d5" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-8">
                                                                    <asp:Label ID="lblsinavAdi" CssClass="form-control" BackColor="#d5d5d5" runat="server"></asp:Label>
                                                                </div>
                                                                <br />
                                                                <br />
                                                                <div class="col-lg-4">
                                                                    <asp:TextBox ID="txtSoruNo" CssClass="form-control" runat="server" placeholder="Soru Numarasý Girin"></asp:TextBox>
                                                                </div>
                                                                <div class="col-lg-4">
                                                                    <asp:DropDownList ID="dropDogruCevap" CssClass="form-control" runat="server">
                                                                        <asp:ListItem Text="Doðru Cevap Seçiniz" />
                                                                        <asp:ListItem Text="A" />
                                                                        <asp:ListItem Text="B" />
                                                                        <asp:ListItem Text="C" />
                                                                        <asp:ListItem Text="D" />
                                                                        <asp:ListItem Text="E" />
                                                                    </asp:DropDownList>
                                                                </div>
                                                                <div class="col-lg-4">
                                                                    <asp:Button ID="btnDegistir" CssClass="btn btn-success col-lg-12" runat="server" OnClick="btnDegistir_Click" Text="Deðiþtir" />
                                                                </div>
                                                                <asp:Label ID="lblgizli" runat="server" Visible="false" Text="Gizli Label"></asp:Label>
                                                                <br />
                                                                <br />
                                                            </div>

                                                        </asp:Panel>

                                                        <br />
                                                        <div class="col-lg-8 col-lg-offset-2 text-left">
                                                            <br />
                                                            <asp:TextBox ID="txtSinavAdi" runat="server" CssClass="form-control" placeholder="Sýnav Adý" />
                                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtSinavAdi" ErrorMessage="Bu Alan Boþ Geçilemez!" Font-Bold="true" Font-Size="Small" ForeColor="Red" ValidationGroup="sinavEkle" />
                                                            <br />
                                                            <asp:TextBox ID="txtSinavCevap" runat="server" CssClass="form-control" placeholder="Cevap Anahtarý" Rows="3" TextMode="MultiLine" />
                                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtSinavCevap" ErrorMessage="Bu Alan Boþ Geçilemez!" Font-Bold="true" Font-Size="Small" ForeColor="Red" ValidationGroup="sinavEkle" />
                                                            <br />
                                                            <asp:Button ID="btnSinavEkle" runat="server" CssClass="btn btn-xl btn-lg btn-primary btn-block" OnClick="btnSinavEkle_Click" Text="KAYDET" ValidationGroup="sinavEkle" />
                                                            <br />
                                                            <div class="text-center">
                                                                <asp:Label ID="lblSinavOK" runat="server" ForeColor="Green" Text="" />
                                                                <asp:Label ID="lblSinavFAIL" runat="server" ForeColor="Red" Text="" />
                                                            </div>
                                                        </div>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="btnSinavEkle" EventName="Click" />
                                                    </Triggers>
                                                </asp:UpdatePanel>

                                            </fieldset>
                                        </div>
                                        <div class="tab-pane fade" id="sonucekle">
                                            <fieldset>
                                                <div class="col-lg-6 col-lg-offset-3">

                                                    <asp:UpdatePanel ID="updateFileUpload" runat="server" ChildrenAsTriggers="true" UpdateMode="Always">
                                                        <ContentTemplate>

                                                            <asp:HyperLink NavigateUrl="http://localhost:49186/SonucEkle.aspx" runat="server">Sonuç eklemek için týklayýnýz.</asp:HyperLink>

                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>

                                                </div>
                                            </fieldset>
                                        </div>
                                        <div class="tab-pane fade" id="rapor">
                                            <fieldset>
                                                <div class="col-lg-10 col-lg-offset-1">
                                                    <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Always">
                                                        <ContentTemplate>



                                                            <asp:GridView ID="GridView2" CssClass="col-lg-12 table table-responsive table-hover table-bordered" runat="server" AutoGenerateColumns="False" DataSourceID="SinavOrtalama">
                                                                <Columns>
                                                                    <asp:BoundField DataField="sinavAdi" HeaderText="Sýnav Adý" SortExpression="sinavAdi" HeaderStyle-BackColor="#d5d5d5" />
                                                                    <asp:BoundField DataField="Column1" HeaderText="Türkçe Doðru" ReadOnly="True" SortExpression="Column1" HeaderStyle-BackColor="#d5d5d5" />
                                                                    <asp:BoundField DataField="Column2" HeaderText="Türkçe Yanlýþ" ReadOnly="True" SortExpression="Column2" HeaderStyle-BackColor="#d5d5d5" />
                                                                    <asp:BoundField DataField="Column3" HeaderText="Sosyal Doðru" ReadOnly="True" SortExpression="Column3" HeaderStyle-BackColor="#d5d5d5" />
                                                                    <asp:BoundField DataField="Column4" HeaderText="Sosyal Yanlýþ" ReadOnly="True" SortExpression="Column4" HeaderStyle-BackColor="#d5d5d5" />
                                                                    <asp:BoundField DataField="Column5" HeaderText="Matematik Doðru" ReadOnly="True" SortExpression="Column5" HeaderStyle-BackColor="#d5d5d5" />
                                                                    <asp:BoundField DataField="Column6" HeaderText="Matematik Yanlýþ" ReadOnly="True" SortExpression="Column6" HeaderStyle-BackColor="#d5d5d5" />
                                                                    <asp:BoundField DataField="Column7" HeaderText="Fen Doðru" ReadOnly="True" SortExpression="Column7" HeaderStyle-BackColor="#d5d5d5" />
                                                                    <asp:BoundField DataField="Column8" HeaderText="Fen Yanlýþ" ReadOnly="True" SortExpression="Column8" HeaderStyle-BackColor="#d5d5d5" />
                                                                </Columns>
                                                            </asp:GridView>
                                                            <asp:SqlDataSource ID="SinavOrtalama" runat="server" ConnectionString="<%$ ConnectionStrings:DB_Bitirme %>" SelectCommand="select Sinav.sinavAdi, avg(trD) , avg(trY), avg(ssD), avg(ssY), avg(mtD), avg(mtY), avg(fnD), avg(fnY) from Ogrenci_Sinav, Sinav where Ogrenci_Sinav.sinavID=Sinav.sinavID group by Sinav.SinavAdi;"></asp:SqlDataSource>

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
                                                                <asp:TextBox CssClass="form-control" ID="txtOgrtAra" runat="server" placeholder="Aramak istediðiniz kiþinin ADINI girin..." />
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
                                                                        <th>Adý</th>
                                                                        <th>Soyadý</th>
                                                                        <th>E-posta</th>
                                                                        <th>Ýþlem</th>
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
                                                                                    <asp:Button Text="Mesaj Yaz" ID="btnOgrtMesaj" OnClientClick="return confirm('Daha Kodlanmadý!');" CssClass="btn btn-info btnDuzenle" runat="server" />
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
                                        <div class="tab-pane fade" id="ogrencis">
                                            <asp:UpdatePanel runat="server">
                                                <ContentTemplate>
                                                    <fieldset>
                                                        <div class="col-lg-offset-1 col-lg-10">


                                                            <asp:GridView ID="GridView3" CssClass="col-lg-12 table table-responsive table-hover table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="ogrNo" DataSourceID="OgrenciListesi" AllowPaging="True" AllowCustomPaging="False" PagerSettings-Mode="Numeric" PagerStyle-HorizontalAlign="Center" PagerStyle-CssClass="GridPager">
                                                                <Columns>
                                                                    <asp:BoundField DataField="ogrNo" HeaderText="Öðrenci No" ReadOnly="True" SortExpression="ogrNo" HeaderStyle-BackColor="#d5d5d5" />
                                                                    <asp:BoundField DataField="ogrAdi" HeaderText="Adý" SortExpression="ogrAdi" HeaderStyle-BackColor="#d5d5d5" />
                                                                    <asp:BoundField DataField="ogrSoyadi" HeaderText="Soyadý" SortExpression="ogrSoyadi" HeaderStyle-BackColor="#d5d5d5" />
                                                                    <asp:BoundField DataField="ogrTC" HeaderText="TC No" SortExpression="ogrTC" HeaderStyle-BackColor="#d5d5d5" />
                                                                    <asp:BoundField DataField="ogrSinif" HeaderText="Sýnýf" SortExpression="ogrSinif" HeaderStyle-BackColor="#d5d5d5" />
                                                                    <asp:BoundField DataField="ogrMail" HeaderText="E-posta" SortExpression="ogrMail" HeaderStyle-BackColor="#d5d5d5" />
                                                                    <asp:HyperLinkField DataNavigateUrlFields="ogrNo" DataNavigateUrlFormatString="Raporlama.aspx?ogrNo={0}" DataTextField="ogrNo" HeaderText="Raporlama" HeaderStyle-BackColor="#d5d5d5" DataTextFormatString="Ýstatistikler" />
                                                                </Columns>
                                                            </asp:GridView>
                                                            <asp:SqlDataSource ID="OgrenciListesi" runat="server" ConnectionString="<%$ ConnectionStrings:DB_Bitirme %>" SelectCommand="SELECT [ogrNo], [ogrAdi], [ogrSoyadi], [ogrTC], [ogrSinif], [ogrMail] FROM [Ogrenci]"></asp:SqlDataSource>


                                                        </div>
                                                    </fieldset>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>
                                        <div class="tab-pane fade" id="velis">
                                            <asp:UpdatePanel runat="server">
                                                <ContentTemplate>
                                                    <fieldset>
                                                        <div class="col-lg-10 col-lg-offset-1 table-responsive">
                                                            <div class="col-lg-offset-1 col-lg-6">
                                                                <asp:TextBox CssClass="form-control" ID="txtVeliAra" runat="server" placeholder="Aramak istediðiniz kiþinin ADINI girin..." />
                                                            </div>
                                                            <div class="col-lg-3">
                                                                <asp:Button Text="ARA" ID="btnVeliAra" OnClick="btnVeliAra_Click" CssClass="btn btn-success col-lg-6" runat="server" />
                                                            </div>
                                                            <br />
                                                            <br />
                                                            <br />
                                                            <table class="table table-hover">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Adý</th>
                                                                        <th>Soyadý</th>
                                                                        <th>Öðrenci No</th>
                                                                        <th>E-posta</th>
                                                                        <th>Ýþlem</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <asp:ListView ID="lstVeliler" runat="server">
                                                                        <ItemTemplate>
                                                                            <tr>
                                                                                <td><%#Eval("veliAdi") %></td>
                                                                                <td><%#Eval("veliSoyadi") %></td>
                                                                                <td><%#Eval("ogrNo") %></td>
                                                                                <td><%#Eval("veliMail") %></td>
                                                                                <td>
                                                                                    <asp:Button Text="Mesaj Yaz" ID="btnVeliMesaj" OnClientClick="return confirm('Daha Kodlanmadý!');" CssClass="btn btn-info btnDuzenle" runat="server" />
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
                                                    <asp:AsyncPostBackTrigger ControlID="btnVeliAra" EventName="Click" />
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
                                                            <asp:TextBox runat="server" ID="txtAyarID" Enabled="false" CssClass="form-control" placeholder="ID" />
                                                            <br />
                                                            <asp:TextBox runat="server" ID="txtAyarAdi" Enabled="false" CssClass="form-control" placeholder="Adý" />
                                                            <br />
                                                            <asp:TextBox runat="server" ID="txtAyarSoyadi" Enabled="false" CssClass="form-control" placeholder="Soyadý" />
                                                            <br />
                                                            <asp:TextBox runat="server" ID="txtAyarKadi" Enabled="false" CssClass="form-control" placeholder="Kullanýcý Adý" />
                                                            <br />
                                                            <asp:TextBox runat="server" ID="txtAyarDersID" CssClass="form-control" placeholder="Ders ID" ToolTip="Ders ID" />
                                                            <asp:RequiredFieldValidator ErrorMessage="Bu Alan Boþ Geçilemez!" ControlToValidate="txtAyarDersID" runat="server" Font-Bold="true" Font-Size="Small" ForeColor="Red" ValidationGroup="ogrtAyar" />
                                                            <br />
                                                            <asp:TextBox runat="server" ID="txtAyarEposta" CssClass="form-control" placeholder="E-posta" />
                                                            <asp:RequiredFieldValidator ErrorMessage="Bu Alan Boþ Geçilemez!" ControlToValidate="txtAyarEposta" runat="server" Font-Bold="true" Font-Size="Small" ForeColor="Red" ValidationGroup="ogrtAyar" />
                                                            <br />
                                                            <asp:TextBox runat="server" ID="txtAyarParola" TextMode="Password" CssClass="form-control" placeholder="Parola" />
                                                            <asp:RequiredFieldValidator ErrorMessage="Bu Alan Boþ Geçilemez!" ControlToValidate="txtAyarParola" runat="server" Font-Bold="true" Font-Size="Small" ForeColor="Red" ValidationGroup="ogrtAyar" />
                                                            <br />
                                                            <asp:TextBox runat="server" ID="txtAyarParolaTekrar" TextMode="Password" CssClass="form-control" placeholder="Parola (Tekrar)" />
                                                            <asp:RequiredFieldValidator ErrorMessage="Bu Alan Boþ Geçilemez!" ControlToValidate="txtAyarParolaTekrar" runat="server" Font-Bold="true" Font-Size="Small" ForeColor="Red" ValidationGroup="ogrtAyar" />
                                                            <br />
                                                            <asp:Button Text="GÜNCELLE" runat="server" ID="btnGuncelle" OnClick="btnGuncelle_Click" CssClass="btn btn-xl btn-lg btn-primary btn-block" ValidationGroup="ogrtAyar" />
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
                        <span class="copyright">CopyLEFT <span class="copy-left">&copy;</span> Öðrenci Takip Sistemi 2015</span>
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
                            <li><a href="#PrivacyPolicy" class="portfolio-link" data-toggle="modal">Gizlilik Politikasý</a>
                            </li>
                            <li><a href="#TermsOfUse" class="portfolio-link" data-toggle="modal">Kullaným Þartlarý</a>
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
                                <h2>GÝZLÝLÝK POLÝTÝKASI</h2>
                                <p>
                                    Ekip olarak kiþisel gizlilik haklarýnýza saygý duyuyor ve sitemizde geçirdiðiniz süre zarfýnda bunu saðlamak için çaba sarfediyoruz. Kiþisel bilgilerinizin güvenliði ile ilgili açýklamalar aþaðýda açýklanmýþ ve bilginize sunulmuþtur.
    <br />
                                    <b>Çerezler (Cookies)</b><br />
                                    “Cookie - Çerez” kelimesi web sayfasý sunucusunun sizin bilgisayarýnýzýn hard diskine yerleþtirdiði ufak bir text dosyasýný tanýmlamak için kullanýlmaktadýr. Sitemizin bazý bölümlerinde kullanýcý kolaylýðý saðlamak için çerez kullanýlýyor olabilir. Ayrýca sitede mevcut bulunan reklamlar aracýlýðýyla, reklam verilerinin toplanmasý için cookie ve web beacon kullanýlýyor olabilir. Bu tamamen sizin izninizle gerçekleþiyor olup, isteðiniz dahilinde internet tarayýcýnýzýn ayarlarýný deðiþtirerek bunu engellemeniz mümkündür.
    <br />
                                    <b>Dýþ Baðlantýlar</b><br />
                                    Sitemiz, sayfalarýndan farklý internet adreslerine baðlantý vermektedir. sitemiz link verdiði, banner tanýtýmýný yaptýðý sitelerin içeriklerinden veya gizlilik prensiplerinden sorumlu deðildir. Burada bahsedilen baðlantý verme iþlemi, hukuki olarak “atýfta bulunma” olarak deðerlendirilmektedir.
    <br />
                                    <b>Ýletiþim</b><br />
                                    Sitemizde uygulanan gizlilik politikasý ile ilgili; her türlü soru, görüþ ve düþüncelerinizi bize iletiþim formundan iletebilirsiniz.
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
                                <h2>KULLANIM ÞARTLARI</h2>
                                <p>
                                    Siteye eriþiminizden veya siteyi kullanýmýnýzdan önce lütfen bu sözleþmeyi dikkatle okuyunuz. Siteye eriþmekle veya siteyi kullanmakla, aþaðýda belirtilen þartlar ve hükümlerle baðlý olmayý kabul etmektesiniz. Eðer bu þartlar ve hükümlerle baðlý olmak istemezseniz, siteye eriþmeyebilir veya siteyi kullanmayabilirsiniz ve böyle bir kullanýma baþladýysanýz kullanýmý derhal durdurmalýsýnýz.
                                <br />
                                    <br />
                                    Sitemiz bu sözleþmede her zaman deðiþiklik yapabilir ve bu deðiþiklikler deðiþtirilmiþ sözleþmenin siteye konulmasýyla derhal yürürlük kazanýr. Siz bu deðiþikliklerden haberdar olmak amacýyla periyodik olarak sözleþmeyi gözden geçirmeyi kabul etmektesiniz ve siteye devam eden eriþiminiz veya devam eden siteyi kullanýmýnýz deðiþtirilmiþ sözleþmeyi kesin olarak kabul ettiðiniz anlamýna gelecektir.
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
