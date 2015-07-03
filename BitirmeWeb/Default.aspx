<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BitirmeWeb.Default" EnableEventValidation="false" %>

<!DOCTYPE html>
<html lang="en">

<head runat="server">

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Öğrenci Takip Sistemi</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/agency.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='http://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

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

    <form runat="server">

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <div class="navbar-header page-scroll">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand page-scroll" href="#page-top">Öğrenci Takip Sistemi</a>
                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="hidden">
                            <a href="#page-top"></a>
                        </li>
                        <li>
                            <a class="page-scroll" href="#services">PROJEMİZ</a>
                        </li>
                        <li>
                            <a class="page-scroll" href="#about">SÜREÇLER</a>
                        </li>
                        <li>
                            <a class="page-scroll" href="#team">EKİBİMİZ</a>
                        </li>
                        <li>
                            <a class="page-scroll" href="#contact">İLETİŞİM</a>
                        </li>
                        <li>
                            <asp:Label ID="btnSessionGiris" CssClass="btn navbar-btn" runat="server">
                                <a href="#Giris" id="giris" class="portfolio-link" data-toggle="modal" style="color: #fed136;">GİRİŞ</a>
                            </asp:Label>
                        </li>
                        <li>
                            <asp:HyperLink ID="hyperSession" Text="" runat="server" CssClass="label-session" Style="color: #fed136;" />
                        </li>
                        <li>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:Button ID="btnCikis" Text="Çıkış" OnClick="btnCikis_Click" OnClientClick="return confirm('Çıkış yapmak istediğine emin misin?');" ForeColor="#fed136" BackColor="Transparent" Visible="false" runat="server" CssClass="btn navbar-btn" />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="btnCikis" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Header -->
        <header>
            <div class="container">
                <div class="intro-text">
                    <div class="intro-lead-in">Tarayıcı ile Optik Form Okuma</div>
                    <div class="intro-heading">ÖĞRENCİ TAKİP SİSTEMİ</div>
                    <a href="#services" class="page-scroll btn btn-xl">Daha fazlası...</a>
                </div>
            </div>
        </header>

        <!-- Project Section -->
        <section id="services">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <h2 class="section-heading">PROJEMİZ</h2>
                        <h3 class="section-subheading text-muted">Tarayıcı ile Optik Form Okuma ve Öğrenci Takip Sistemi</h3>
                    </div>
                </div>
                <div class="row text-center">
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fa fa-circle fa-stack-2x text-primary"></i>
                            <i class="fa fa-clock-o fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="service-heading">Zamandan Kazanç</h4>
                        <p class="text-muted">Eğitim ile ilgili problemlerden biri yapılan sınav kağıtlarının okunması için gereken sürenin uzun olmasıdır. Bununla birlikte gelişen bir çok problem vardır. Bunlardan bazıları çok fazla enerji harcanması, öğrencilerin hangi konuda eksiklerinin olduğunun belirlenememesi, kapsamlı analizlerin yapılamaması, problemin kaynağı hakkında fikir yürütülememesi vb dir. </p>
                    </div>
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fa fa-circle fa-stack-2x text-primary"></i>
                            <i class="fa fa-print fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="service-heading">Hızlı Sonuç Alma</h4>
                        <p class="text-muted">Geliştirilecek olan program ile işlemler hızlı ve güvenilir biçimde yapılırken, sonuçların da öğrenci takip sistemimizle izleniyor ve yorumlanıyor olması bu problemlerin çözümüne katkı sunacaktır.</p>
                    </div>
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fa fa-circle fa-stack-2x text-primary"></i>
                            <i class="fa fa-bar-chart fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="service-heading">Başarı Durumu Kontrolü</h4>
                        <p class="text-muted">Türkiye’de yaklaşık 900 bin öğretmen bulunmaktadır. Değerli öğretmenlerimizin daha kısa bir zamanda ve daha verimli bir şekilde öğrencilerin sınav sonuçların okuması, sonuçların raporlanması, başarı durumların takibi ve öğrencinin etkin bir şekilde takip edilmesi için birbiriyle entegre iki uygulama yapılmıştır.</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- About Section -->
        <section id="about">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <h2 class="section-heading">PROJE SÜREÇLERİ</h2>
                        <h3 class="section-subheading text-muted">Tarayıcı ile Optik Form Okuma ve Öğrenci Takip Sistemi</h3>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <ul class="timeline">
                            <li>
                                <div class="timeline-image">
                                    <img class="img-circle img-responsive" src="img/about/1.jpg" alt="">
                                </div>
                                <div class="timeline-panel">
                                    <div class="timeline-heading">
                                        <h4>Eylül 2014</h4>
                                        <h4 class="subheading">Projenin Belirlenmesi</h4>
                                    </div>
                                    <div class="timeline-body">
                                        <p class="text-muted">Proje belirlenirken öncelikle yarışmalara katılma şartına göre belirlendi ve tabi ki gündelik hayatı kolaylaştıran bir proje olmasına dikkat edildi. Yoğun bir çalışmanın sonucunda tarayıcı yardımıyla okunan optik formdan bilgileri alıp veritabanına kaydetmek ve daha sonrasında bu verileri raporlamak ve neticeler elde ederek ona göre çalışma yapılmasını sağlayacak olan proje belirlendi.</p>
                                    </div>
                                </div>
                            </li>
                            <li class="timeline-inverted">
                                <div class="timeline-image">
                                    <img class="img-circle img-responsive" src="img/about/2.jpg" alt="">
                                </div>
                                <div class="timeline-panel">
                                    <div class="timeline-heading">
                                        <h4>Kasım 2014</h4>
                                        <h4 class="subheading">Teklif Formunun Verilmesi</h4>
                                    </div>
                                    <div class="timeline-body">
                                        <p class="text-muted">Belirlenen proje (Tarayıcı ile Optik Form Okuma ve Öğrenci Takip Sistemi) tübitak kuralları gereği düzenlenen bitirme projesi teklif formu şartları çerçevesinde, proje hakkında detaylı bir şekilde bilgi verilerek, teklif formu dolduruldu ve proje danışman hocasına ve jüri üyelerine teslim edildi.</p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="timeline-image">
                                    <img class="img-circle img-responsive" src="img/about/3.jpg" alt="">
                                </div>
                                <div class="timeline-panel">
                                    <div class="timeline-heading">
                                        <h4>Aralık 2014</h4>
                                        <h4 class="subheading">Gereksinimler ve Ara Raporlar</h4>
                                    </div>
                                    <div class="timeline-body">
                                        <p class="text-muted">Ön aşamalardan sonra gereksinimleri belirleme aşamasına gelindi ve bu aşama neticesinde kullanılacak teknolojiler, araç & gereçler, IDE'ler, programlama dili/dilleri, veritabanı servisleri/sunucuları vs. belirlendi. Daha sonra rapor haline getirilerek teslim edildi.</p>
                                    </div>
                                </div>
                            </li>
                            <li class="timeline-inverted">
                                <div class="timeline-image">
                                    <img class="img-circle img-responsive" src="img/about/4.jpg" alt="">
                                </div>
                                <div class="timeline-panel">
                                    <div class="timeline-heading">
                                        <h4>Ocak 2015</h4>
                                        <h4 class="subheading">Bitirme 1 Tezi Teslimi</h4>
                                    </div>
                                    <div class="timeline-body">
                                        <p class="text-muted">Dönem sonuna gelindiğinde, dönem boyunca yapılanları içerecek şekilde detaylı bir anlatım ile önceki raporlarda da anlatılanlar detaylandırılarak Bitirme 1 Tezi oluşturuldu ve danışman hocaya teslim edildi.</p>
                                    </div>
                                </div>
                            </li>
                            <li class="timeline-inverted">
                                <div class="timeline-image">
                                    <h4>HİKAYEMİZ
                                    <br>
                                        DEVAM
                                    <br>
                                        EDİYOR!</h4>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>

        <!-- Team Section -->
        <section id="team" class="bg-light-gray">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <h2 class="section-heading">EKİBİMİZ</h2>
                        <h3 class="section-subheading text-muted">"Tarayıcı ile Optik Form Okuma ve Öğrenci Takip Sistemi" bitirme projesi ekibi.</h3>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-3">
                        <div class="team-member">
                            <img src="img/team/1.jpg" class="img-responsive img-circle" alt="">
                            <h4>Recep Çoban</h4>
                            <p class="text-muted">Yazılımcı</p>
                            <ul class="list-inline social-buttons">
                                <li><a href="#" target="_blank"><i class="fa fa-twitter"></i></a>
                                </li>
                                <li><a href="https://www.facebook.com/cbnrcp" target="_blank"><i class="fa fa-facebook"></i></a>
                                </li>
                                <li><a href="#" target="_blank"><i class="fa fa-linkedin"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="team-member">
                            <img src="img/team/2.jpg" class="img-responsive img-circle" alt="">
                            <h4>Ahmet Aslan</h4>
                            <p class="text-muted">Yazılımcı</p>
                            <ul class="list-inline social-buttons">
                                <li><a href="#" target="_blank"><i class="fa fa-twitter"></i></a>
                                </li>
                                <li><a href="https://www.facebook.com/abdullahahmet.aslan" target="_blank"><i class="fa fa-facebook"></i></a>
                                </li>
                                <li><a href="#" target="_blank"><i class="fa fa-linkedin"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="team-member">
                            <img src="img/team/3.jpg" class="img-responsive img-circle" alt="">
                            <h4>Güldestan Yalçınkaya</h4>
                            <p class="text-muted">Yazılımcı</p>
                            <ul class="list-inline social-buttons">
                                <li><a href="#" target="_blank"><i class="fa fa-twitter"></i></a>
                                </li>
                                <li><a href="https://www.facebook.com/guldestn" target="_blank"><i class="fa fa-facebook"></i></a>
                                </li>
                                <li><a href="#" target="_blank"><i class="fa fa-linkedin"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="team-member">
                            <img src="img/team/4.jpg" class="img-responsive img-circle" alt="">
                            <h4>Sercan Oran</h4>
                            <p class="text-muted">Yazılımcı</p>
                            <ul class="list-inline social-buttons">
                                <li><a href="#" target="_blank"><i class="fa fa-twitter"></i></a>
                                </li>
                                <li><a href="https://www.facebook.com/sercan.oran1" target="_blank"><i class="fa fa-facebook"></i></a>
                                </li>
                                <li><a href="#" target="_blank"><i class="fa fa-linkedin"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2 text-center">
                        <p class="large text-muted">Ekibimizle ilgili detaylı bilgileri sosyal medya hesaplarından edinebilir, kendileriyle iletişim kurabilir ve proje hakkında detaylı bilgilere ulaşabilirsiniz.</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Clients Aside -->
        <aside class="clients">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-sm-6">
                        <a href="#">
                            <img src="img/logos/istuni.png" class="img-responsive img-centered" alt="">
                        </a>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <a href="#">
                            <img src="img/logos/yazinca.png" class="img-responsive img-centered" alt="">
                        </a>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <a href="#">
                            <img src="img/logos/yd.png" class="img-responsive img-centered" alt="">
                        </a>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <a href="#">
                            <img src="img/logos/tw.png" class="img-responsive img-centered" alt="">
                        </a>
                    </div>
                </div>
            </div>
        </aside>

        <!-- Contact Section -->
        <section id="contact">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <h2 class="section-heading">İLETİŞİM</h2>
                        <h3 class="section-subheading text-muted">Merak ettiklerinizi bize sorabilirsiniz.</h3>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">

                        <asp:UpdatePanel runat="server" ID="iletisim" UpdateMode="Conditional">
                            <ContentTemplate>

                                <div id="contactForm">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group" style="margin-bottom: 5px;">
                                                <asp:TextBox runat="server" CssClass="form-control" ID="fullname" placeholder="Adınız & Soyadınız *" />
                                                <asp:RequiredFieldValidator ErrorMessage="Bu Alan Boş Geçilemez!" ControlToValidate="fullname" runat="server" ValidationGroup="contact" ForeColor="Red" Font-Size="Small" Font-Bold="true" />
                                            </div>
                                            <div class="form-group" style="margin-bottom: 5px;">
                                                <asp:TextBox runat="server" CssClass="form-control" ID="email" TextMode="Email" placeholder="E-posta adresiniz *" />
                                                <asp:RequiredFieldValidator ErrorMessage="Bu Alan Boş Geçilemez!" ControlToValidate="email" runat="server" ValidationGroup="contact" ForeColor="Red" Font-Size="Small" Font-Bold="true" />
                                            </div>
                                            <div class="form-group" style="margin-bottom: 5px;">
                                                <asp:TextBox runat="server" CssClass="form-control" ID="website" placeholder="Web siteniz *" />
                                                <asp:RequiredFieldValidator ErrorMessage="Bu Alan Boş Geçilemez!" ControlToValidate="website" runat="server" ValidationGroup="contact" ForeColor="Red" Font-Size="Small" Font-Bold="true" />
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <asp:TextBox runat="server" CssClass="form-control" ID="message" placeholder="Mesajınız *" TextMode="MultiLine" />
                                                <asp:RequiredFieldValidator ErrorMessage="Bu Alan Boş Geçilemez!" ControlToValidate="message" runat="server" ValidationGroup="contact" ForeColor="Red" Font-Size="Small" Font-Bold="true" />
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-lg-12 text-center">
                                            <asp:Button Text="GÖNDER" runat="server" CssClass="btn btn-xl" ID="btnContact" ValidationGroup="contact" OnClick="btnContact_Click" />
                                            <br />
                                            <br />
                                            <asp:Label Text="" ForeColor="Green" ID="contactOK" Font-Bold="true" runat="server" />
                                            <asp:Label Text="" ForeColor="Red" ID="contactFAIL" Font-Bold="true" runat="server" />
                                        </div>
                                    </div>
                                </div>

                            </ContentTemplate>
                            <Triggers>
                                <%--<asp:AsyncPostBackTrigger ControlID="" EventName="Click" />--%>
                            </Triggers>
                        </asp:UpdatePanel>


                    </div>
                </div>
            </div>
        </section>

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

        <!-- Giris Modal  -->
        <div class="portfolio-modal modal fade" id="Giris" tabindex="-1" role="dialog" aria-hidden="true">
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
                                <h2>KULLANICI İŞLEMLERİ</h2>
                                <div class="well">

                                    <ul class="nav nav-tabs">
                                        <li class="active"><a href="#login" data-toggle="tab"><span class="glyphicon glyphicon-log-in"></span>&nbsp;&nbsp;&nbsp;<b>Giriş Yap</b></a></li>
                                        <li><a href="#create" data-toggle="tab"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;&nbsp;<b>Hesap Oluştur</b></a></li>
                                    </ul>
                                    <br />
                                    <div id="myTabContent" class="tab-content">
                                        <div class="tab-pane active in" id="login">
                                            <fieldset>
                                                <div class="col-lg-8 col-lg-offset-2">

                                                    <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Always">
                                                        <ContentTemplate>
                                                            <asp:TextBox runat="server" ID="username_giris" placeholder="Kullanıcı Adı / No" CssClass="form-control" />
                                                            <asp:RequiredFieldValidator ErrorMessage="Bu Alan Boş Geçilemez!" ValidationGroup="giris" ControlToValidate="username_giris" runat="server" ForeColor="Red" Font-Size="Small" Font-Bold="true" />
                                                            <br />
                                                            <asp:TextBox runat="server" TextMode="Password" ID="parola_giris" placeholder="Parola" CssClass="form-control" />
                                                            <asp:RequiredFieldValidator ErrorMessage="Bu Alan Boş Geçilemez!" ValidationGroup="giris" ControlToValidate="parola_giris" runat="server" ForeColor="Red" Font-Size="Small" Font-Bold="true" />
                                                            <br />
                                                            <asp:RadioButton ID="rbOgrt" Text="Öğretmen" CssClass="radio-inline" runat="server" GroupName="giris_turu" />
                                                            <asp:RadioButton ID="rbOgr" Text="Öğrenci" CssClass="radio-inline" runat="server" GroupName="giris_turu" />
                                                            <asp:RadioButton ID="rbVeli" Text="Veli" CssClass="radio-inline" runat="server" GroupName="giris_turu" />
                                                            <br />
                                                            <br />
                                                            <asp:Button Text="GİRİŞ" runat="server" ID="btnGiris" CssClass="btn btn-xl btn-lg btn-primary btn-block" OnClick="btnGiris_Click" ValidationGroup="giris" />
                                                            <br />
                                                            <asp:Label Text="" ForeColor="Green" ID="giris_ok" runat="server" />
                                                            <asp:Label Text="" ForeColor="Red" ID="giris_fail" runat="server" />
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="btnGiris" EventName="Click" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                </div>
                                            </fieldset>
                                        </div>
                                        <div class="tab-pane fade" id="create">
                                            <fieldset>
                                                <div class="col-lg-8 col-lg-offset-2">


                                                    <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Always">
                                                        <ContentTemplate>
                                                            <asp:TextBox runat="server" ID="kayit_username" placeholder="Kullanıcı Adı" CssClass="form-control" />
                                                            <asp:RequiredFieldValidator ErrorMessage="Bu Alan Boş Geçilemez!" ControlToValidate="kayit_username" runat="server" ValidationGroup="kayit" ForeColor="Red" Font-Bold="true" Font-Size="Small" />
                                                            <br />
                                                            <asp:TextBox runat="server" ID="kayit_adi" placeholder="Adı" CssClass="form-control" />
                                                            <asp:RequiredFieldValidator ErrorMessage="Bu Alan Boş Geçilemez!" ControlToValidate="kayit_adi" runat="server" ValidationGroup="kayit" ForeColor="Red" Font-Bold="true" Font-Size="Small" />
                                                            <br />
                                                            <asp:TextBox runat="server" ID="kayit_soyadi" placeholder="Soyadı" CssClass="form-control" />
                                                            <asp:RequiredFieldValidator ErrorMessage="Bu Alan Boş Geçilemez!" ControlToValidate="kayit_soyadi" runat="server" ValidationGroup="kayit" ForeColor="Red" Font-Bold="true" Font-Size="Small" />
                                                            <br />
                                                            <asp:TextBox runat="server" TextMode="Email" ID="kayit_eposta" CssClass="form-control" placeholder="E-posta Adresi" />
                                                            <asp:RequiredFieldValidator ErrorMessage="Bu Alan Boş Geçilemez!" ControlToValidate="kayit_eposta" runat="server" ValidationGroup="kayit" ForeColor="Red" Font-Bold="true" Font-Size="Small" />
                                                            <br />
                                                            <asp:TextBox runat="server" ID="kayit_ogrTC" placeholder="Öğrenci No" CssClass="form-control" />
                                                            <asp:RequiredFieldValidator ErrorMessage="Bu Alan Boş Geçilemez!" ControlToValidate="kayit_ogrTC" runat="server" ValidationGroup="kayit" ForeColor="Red" Font-Bold="true" Font-Size="Small" />
                                                            <br />
                                                            <asp:TextBox runat="server" TextMode="Password" ID="kayit_parola" CssClass="form-control" placeholder="Parola" />
                                                            <asp:RequiredFieldValidator ErrorMessage="Bu Alan Boş Geçilemez!" ControlToValidate="kayit_parola" runat="server" ValidationGroup="kayit" ForeColor="Red" Font-Bold="true" Font-Size="Small" />
                                                            <br />
                                                            <asp:TextBox runat="server" TextMode="Password" ID="kayit_parola_tekrar" CssClass="form-control" placeholder="Parola (Tekrar)" />
                                                            <asp:RequiredFieldValidator ErrorMessage="Bu Alan Boş Geçilemez!" ControlToValidate="kayit_parola_tekrar" runat="server" ValidationGroup="kayit" ForeColor="Red" Font-Bold="true" Font-Size="Small" />
                                                            <br />
                                                            <script type="text/javascript">
                                                                function btnKaydetEnable() {
                                                                    var p1 = $("#kayit_parola").val();
                                                                    var p2 = $("#kayit_parola_tekrar").val();
                                                                    if (p1 != "" && p2 != "") {
                                                                        if (p1 == p2) {
                                                                            document.getElementById("btnKaydet").disabled = false;
                                                                        }
                                                                        else {
                                                                            document.getElementById("btnKaydet").disabled = true;
                                                                        }
                                                                    }
                                                                }
                                                                setInterval("btnKaydetEnable()", 100);
                                                            </script>

                                                            <asp:Panel ID="panelKaydet" runat="server">
                                                                <asp:Button Text="KAYDET" runat="server" ID="btnKaydet" CssClass="btn btn-xl btn-lg btn-primary btn-block" OnClick="btnKaydet_Click" ValidationGroup="kayit" />
                                                            </asp:Panel>
                                                            <asp:Panel ID="panelEvetHayir" CssClass="text-center" Visible="false" runat="server">
                                                                <asp:Label Text="" ID="lblEvetHayir" ForeColor="Blue" Font-Bold="true" Font-Size="Large" runat="server" />
                                                                <br />
                                                                <br />
                                                                <asp:Button Text="EVET" runat="server" ID="btnEvet" CssClass="btn btn-success" OnClick="btnEvet_Click" ValidationGroup="kayit"/>
                                                                <asp:Button Text="HAYIR" runat="server" ID="btnHayir" CssClass="btn btn-danger" OnClick="btnHayir_Click"/>
                                                            </asp:Panel>

                                                            <br />
                                                            <div class="text-center">
                                                                <asp:Label Text="" ForeColor="Green" ID="kayit_ok" runat="server" />
                                                                <asp:Label Text="" ForeColor="Red" ID="kayit_fail" runat="server" />
                                                            </div>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>

                                                </div>


                                            </fieldset>
                                        </div>
                                    </div>

                                </div>
                                <div class="clearfix"></div>
                                <br />
                                <div class="text-center">
                                    <button type="button" class="btn btn-primary " data-dismiss="modal"><i class="fa fa-times"></i>Kapat</button>
                                </div>
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

