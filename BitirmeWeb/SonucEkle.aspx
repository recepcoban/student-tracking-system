<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SonucEkle.aspx.cs" Inherits="BitirmeWeb.SonucEkle" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>ÖTS | Sonuç Ekleme</title>

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

        <div class="well container col-lg-6 col-lg-offset-3" style="box-shadow: 0 0 30px black;">
            <asp:UpdatePanel ID="updateFileUpload" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                <ContentTemplate>

                    <asp:Button Text="Geri Git" PostBackUrl="~/Ogretmen.aspx" CssClass="btn btn-info pull-right" runat="server" />
                    <br />
                    <br />
                    <br />
                    <asp:DropDownList runat="server" CssClass="form-control" ID="dropSinavlar" AppendDataBoundItems="True">
                        <asp:ListItem Text="Seçiniz" />
                    </asp:DropDownList>
                    <br />
                    <span class="btn btn-default form-control btn-file">Dosya Seç
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </span>
                    <asp:RegularExpressionValidator ErrorMessage="Lütfen .bitirme uzantılı dosya seçiniz." ValidationExpression="(^.*\.(bitirme)$)" ControlToValidate="FileUpload1" ForeColor="Red" ValidationGroup="SonucEkle" runat="server" />
                    <br />
                    <br />
                    <asp:Button ID="btnSonucEkle" ValidationGroup="SonucEkle" OnClick="btnSonucEkle_Click" runat="server" CssClass="form-control btn btn-success" Text="Sonuç Ekle" />
                    <br />
                    <br />
                    <div class="text-center">
                        <asp:Label ID="lblSonucOk" ForeColor="Green" runat="server" Text="" />
                        <asp:Label ID="lblSonucFail" ForeColor="Red" runat="server" Text="" />
                    </div>

                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnSonucEkle" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </form>
</body>
</html>

