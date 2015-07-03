<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Raporlama.aspx.cs" Inherits="BitirmeWeb.Raporlama" EnableEventValidation="false" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>ÖTS | Öğrenci İstatiksiği</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />

    <!-- Custom CSS -->
    <link href="css/agency.css" rel="stylesheet" />
</head>
<body style="background-color: #777;">
    <form id="form2" runat="server">

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div class="jumbotron" style="background-color: #777;">
            <div class="well container col-lg-8 col-lg-offset-2" style="box-shadow: 0 0 30px black;">
                <asp:Label ID="lblOgr" Font-Bold="true" ForeColor="DodgerBlue" Font-Size="Medium" runat="server"></asp:Label>
                <asp:Button Text="Geri Git" CssClass="btn btn-danger pull-right" PostBackUrl="~/Ogretmen.aspx" runat="server" />
            </div>
        </div>

        <div class="well container col-lg-8 col-lg-offset-2" style="box-shadow: 0 0 30px black;">

            <table class="table table-hover table-bordered table-responsive">
                <tr class="text-center" style="background-color: #d5d5d5;">
                    <td colspan="2">
                        <asp:Label ID="lbl1SinavAdi" Font-Bold="true" ForeColor="DodgerBlue" runat="server"></asp:Label>
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
                        <asp:Label ID="lbl2SinavAdi" Font-Bold="true" ForeColor="DodgerBlue" runat="server"></asp:Label>
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
                        <asp:Label ID="lbl3SinavAdi" Font-Bold="true" ForeColor="DodgerBlue" runat="server"></asp:Label>
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
                                <td>
                                    <asp:Label ID="Label21" runat="server" Text="Matematik Doğru"></asp:Label>
                                </td>
                                <td>
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
                        <asp:Label ID="lbl4SinavAdi" Font-Bold="true" ForeColor="DodgerBlue" runat="server"></asp:Label>
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


        </div>
    </form>
</body>
</html>

