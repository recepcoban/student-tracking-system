<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResimYukle.aspx.cs" Inherits="BitirmeWeb.ResimYukle" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>ÖTS | Resim Yükleme</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />

    <!-- Custom CSS -->
    <link href="css/agency.css" rel="stylesheet" />
</head>
<body style="background-color: #777;">
    <form id="form1" runat="server">

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div class="jumbotron" style="background-color: #777;">
        </div>

        <div class="well container col-lg-6 col-lg-offset-3 text-center" style="box-shadow: 0 0 30px black;">

            <asp:UpdatePanel ID="updatepanelresim" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <br />
                    <span class="btn btn-default btn-file col-lg-6 col-lg-offset-3">Resim Seç
                         <asp:FileUpload ID="FileProfilResim" runat="server" />
                    </span>
                    <br />
                    <br />
                    <br />
                    <div class="col-lg-6 col-lg-offset-3">
                        <asp:Button Text="Yükle" ID="btnResimYukle" OnClick="btnResimYukle_Click" CssClass="btn btn-success col-lg-6" runat="server" />
                        <asp:Button Text="İptal" ID="btnIptal" CssClass="btn btn-danger col-lg-4 col-lg-offset-2" runat="server" />
                    </div>
                    <br />
                    <br />
                    <div class="text-center">
                        <asp:Label Text="" ID="lblResimHata" ForeColor="Red" runat="server" />
                        <asp:Label Text="" ID="lblResimOK" ForeColor="Green" runat="server" />
                    </div>
                    <br />
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnResimYukle" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </form>
</body>
</html>
