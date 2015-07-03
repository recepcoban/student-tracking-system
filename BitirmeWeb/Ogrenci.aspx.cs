using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BitirmeWeb
{
    public partial class Ogrenci : System.Web.UI.Page
    {
        SqlConnection baglanti = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["DB_Bitirme"].ConnectionString);

        public object ogrenci;

        // page load
        protected void Page_Load(object sender, EventArgs e)
        {
            ogrenci = Session["ogrenci"];
            if (ogrenci == null)
            {
                Response.Redirect("~/Default.aspx");
            }
            else
            {

                try
                {
                    string sorguOgr = "SELECT * FROM Ogrenci WHERE ogrNo = @ogrNo";
                    SqlCommand komutOgr = new SqlCommand(sorguOgr, baglanti);
                    komutOgr.Parameters.AddWithValue("@ogrNo", ogrenci);

                    baglanti.Open();

                    SqlDataReader drOgr = komutOgr.ExecuteReader();

                    if (drOgr.Read())
                    {
                        // profil
                        imgProfilResim.ImageUrl = drOgr["ogrResim"].ToString();
                        lblID.Text = drOgr["ogrNo"].ToString();
                        lblAdi.Text = drOgr["ogrAdi"].ToString();
                        lblSoyadi.Text = drOgr["ogrSoyadi"].ToString();
                        lblTC.Text = drOgr["ogrTC"].ToString();
                        lblSinif.Text = drOgr["ogrSinif"].ToString();
                        lblEposta.Text = drOgr["ogrMail"].ToString();
                        lblCins.Text = drOgr["ogrCins"].ToString();
                        lblSube.Text = drOgr["ogrSube"].ToString();

                        lblSession.Text = "Hoşgeldin, " + drOgr["ogrAdi"].ToString() + " " + drOgr["ogrSoyadi"].ToString();
                    }
                    else
                    {
                        lblID.Text = "Hatalı erişim!";
                        lblAdi.Text = "Hatalı erişim!";
                        lblSoyadi.Text = "Hatalı erişim!";
                        lblTC.Text = "Hatalı erişim!";
                        lblSinif.Text = "Hatalı erişim!";
                        lblEposta.Text = "Hatalı erişim!";
                        lblCins.Text = "Hatalı erişim!";
                        lblSube.Text = "Hatalı erişim!";
                    }
                }
                catch (Exception)
                {
                    lblID.Text = "Hatalı erişim!";
                    lblAdi.Text = "Hatalı erişim!";
                    lblSoyadi.Text = "Hatalı erişim!";
                    lblTC.Text = "Hatalı erişim!";
                    lblSinif.Text = "Hatalı erişim!";
                    lblEposta.Text = "Hatalı erişim!";
                    lblCins.Text = "Hatalı erişim!";
                    lblSube.Text = "Hatalı erişim!";
                }
                finally
                {
                    baglanti.Close();
                }
            }

            try
            {
                // Tüm Öğretmenler
                string sorgu33 = "SELECT * FROM Ogretmen ORDER BY ogrtID";
                SqlCommand komut33 = new SqlCommand(sorgu33, baglanti);
                baglanti.Open();
                SqlDataReader dr33 = komut33.ExecuteReader();
                lstOgretmen.DataSource = dr33;
                lstOgretmen.DataBind();

            }
            catch (Exception)
            {

            }
            finally
            {
                baglanti.Close();
            }


            try
            {
                lbl1SinavAdi.Text = "";
                lbl2SinavAdi.Text = "";
                lbl3SinavAdi.Text = "";
                lbl4SinavAdi.Text = "";


                baglanti.Open();
                String[,] sinavlar = new String[4, 11];

                for (int z = 0; z < 4; z++)
                {
                    for (int t = 0; t < 11; t++)
                    {
                        sinavlar[z, t] = "0";
                    }
                }

                string sorgu = "select * from Ogrenci_Sinav, Sinav where Ogrenci_Sinav.sinavID=Sinav.sinavID and ogrNo=" + Convert.ToInt32(ogrenci);
                SqlCommand komut = new SqlCommand(sorgu, baglanti);
                SqlDataReader dr = komut.ExecuteReader();
                int i = 0;

                int ss = 0;
                while (dr.Read())
                {

                    sinavlar[ss, 0] = Convert.ToString(dr["sinavID"]);
                    sinavlar[ss, 1] = Convert.ToString(dr["tarih"]);
                    sinavlar[ss, 2] = Convert.ToString(dr["trD"]);
                    sinavlar[ss, 3] = Convert.ToString(dr["trY"]);
                    sinavlar[ss, 4] = Convert.ToString(dr["ssD"]);
                    sinavlar[ss, 5] = Convert.ToString(dr["ssY"]);
                    sinavlar[ss, 6] = Convert.ToString(dr["mtD"]);
                    sinavlar[ss, 7] = Convert.ToString(dr["mtY"]);
                    sinavlar[ss, 8] = Convert.ToString(dr["fnD"]);
                    sinavlar[ss, 9] = Convert.ToString(dr["fnY"]);
                    sinavlar[ss, 10] = Convert.ToString(dr["SinavAdi"]);

                    ss++;
                    if (ss == 4)
                    {
                        break;
                    }
                }

                dr.Close();

                String[,] ortalama = new String[4, 8];
                for (int k = 0; k < ss; k++)
                {
                    //

                    string sorguOrtalama = "select AVG(trD) as trD, AVG(trY) as trY, AVG(ssD) as ssD, AVG(ssY) as ssY, AVG(mtD) as mtD, AVG(mtY) as mtY, AVG(fnD) as fnD, AVG(fnY) as fnY from Ogrenci_Sinav where sinavID=" + Convert.ToInt32(sinavlar[k, 0]);
                    SqlCommand komutOrtalama = new SqlCommand(sorguOrtalama, baglanti);
                    SqlDataReader drO = komut.ExecuteReader();

                    i = 0;
                    while (drO.Read())
                    {


                        ortalama[i, 0] = Convert.ToString(drO["trD"]);
                        ortalama[i, 1] = Convert.ToString(drO["trY"]);
                        ortalama[i, 2] = Convert.ToString(drO["ssD"]);
                        ortalama[i, 3] = Convert.ToString(drO["ssY"]);
                        ortalama[i, 4] = Convert.ToString(drO["mtD"]);
                        ortalama[i, 5] = Convert.ToString(drO["mtY"]);
                        ortalama[i, 6] = Convert.ToString(drO["fnD"]);
                        ortalama[i, 7] = Convert.ToString(drO["fnY"]);

                        i++;
                        if (i == 4)
                        {
                            break;
                        }
                    }

                    drO.Close();
                }

                lbl1SinavAdi.Text = sinavlar[0, 10] + " " + "Ortalama Netler";
                lbl1trD.Text = ortalama[0, 0];
                lbl1trY.Text = ortalama[0, 1];
                lbl1ssD.Text = ortalama[0, 2];
                lbl1ssY.Text = ortalama[0, 3];
                lbl1mtD.Text = ortalama[0, 4];
                lbl1mtY.Text = ortalama[0, 5];
                lbl1fnD.Text = ortalama[0, 6];
                lbl1fnY.Text = ortalama[0, 7];

                lbl2SinavAdi.Text = sinavlar[1, 10] + " " + "Ortalama Netler";
                lbl2trD.Text = ortalama[1, 0];
                lbl2trY.Text = ortalama[1, 1];
                lbl2ssD.Text = ortalama[1, 2];
                lbl2ssY.Text = ortalama[1, 3];
                lbl2mtD.Text = ortalama[1, 4];
                lbl2mtY.Text = ortalama[1, 5];
                lbl2fnD.Text = ortalama[1, 6];
                lbl2fnY.Text = ortalama[1, 7];

                lbl3SinavAdi.Text = sinavlar[2, 10] + " " + "Ortalama Netler";
                lbl3trD.Text = ortalama[2, 0];
                lbl3trY.Text = ortalama[2, 1];
                lbl3ssD.Text = ortalama[2, 2];
                lbl3ssY.Text = ortalama[2, 3];
                lbl3mtD.Text = ortalama[2, 4];
                lbl3mtY.Text = ortalama[2, 5];
                lbl3fnD.Text = ortalama[2, 6];
                lbl3fnY.Text = ortalama[2, 7];

                lbl4SinavAdi.Text = sinavlar[3, 10] + " " + "Ortalama Netler";
                lbl4trD.Text = ortalama[3, 0];
                lbl4trY.Text = ortalama[3, 1];
                lbl4ssD.Text = ortalama[3, 2];
                lbl4ssY.Text = ortalama[3, 3];
                lbl4mtD.Text = ortalama[3, 4];
                lbl4mtY.Text = ortalama[3, 5];
                lbl4fnD.Text = ortalama[3, 6];
                lbl4fnY.Text = ortalama[3, 7];

                Chart1.Series["Doğru"].Points.AddXY("Türkçe", Convert.ToInt32(sinavlar[0, 2]));
                Chart1.Series["Yanlış"].Points.AddXY("Türkçe", Convert.ToInt32(sinavlar[0, 3]));
                Chart1.Series["Doğru"].Points.AddXY("Sosyal Bilimler", Convert.ToInt32(sinavlar[0, 4]));
                Chart1.Series["Yanlış"].Points.AddXY("Sosyal Bilimler", Convert.ToInt32(sinavlar[0, 5]));
                Chart1.Series["Doğru"].Points.AddXY("Matematik", Convert.ToInt32(sinavlar[0, 6]));
                Chart1.Series["Yanlış"].Points.AddXY("Matematik", Convert.ToInt32(sinavlar[0, 7]));
                Chart1.Series["Doğru"].Points.AddXY("Fen Bilimleri", Convert.ToInt32(sinavlar[0, 8]));
                Chart1.Series["Yanlış"].Points.AddXY("Fen Bilimleri", Convert.ToInt32(sinavlar[0, 9]));
                Chart1.Titles.Add(sinavlar[0, 10]);

                Chart2.Series["Doğru"].Points.AddXY("Türkçe", Convert.ToInt32(sinavlar[1, 2]));
                Chart2.Series["Yanlış"].Points.AddXY("Türkçe", Convert.ToInt32(sinavlar[1, 3]));
                Chart2.Series["Doğru"].Points.AddXY("Sosyal Bilimler", Convert.ToInt32(sinavlar[1, 4]));
                Chart2.Series["Yanlış"].Points.AddXY("Sosyal Bilimler", Convert.ToInt32(sinavlar[1, 5]));
                Chart2.Series["Doğru"].Points.AddXY("Matematik", Convert.ToInt32(sinavlar[1, 6]));
                Chart2.Series["Yanlış"].Points.AddXY("Matematik", Convert.ToInt32(sinavlar[1, 7]));
                Chart2.Series["Doğru"].Points.AddXY("Fen Bilimleri", Convert.ToInt32(sinavlar[1, 8]));
                Chart2.Series["Yanlış"].Points.AddXY("Fen Bilimleri", Convert.ToInt32(sinavlar[1, 9]));
                if (ss == 1)
                {
                    Chart2.Titles.Add("Sınava Girmedi.");
                }
                else
                {
                    Chart2.Titles.Add(sinavlar[1, 10]);
                }

                Chart3.Series["Doğru"].Points.AddXY("Türkçe", Convert.ToInt32(sinavlar[2, 2]));
                Chart3.Series["Yanlış"].Points.AddXY("Türkçe", Convert.ToInt32(sinavlar[2, 3]));
                Chart3.Series["Doğru"].Points.AddXY("Sosyal Bilimler", Convert.ToInt32(sinavlar[2, 4]));
                Chart3.Series["Yanlış"].Points.AddXY("Sosyal Bilimler", Convert.ToInt32(sinavlar[2, 5]));
                Chart3.Series["Doğru"].Points.AddXY("Matematik", Convert.ToInt32(sinavlar[2, 6]));
                Chart3.Series["Yanlış"].Points.AddXY("Matematik", Convert.ToInt32(sinavlar[2, 7]));
                Chart3.Series["Doğru"].Points.AddXY("Fen Bilimleri", Convert.ToInt32(sinavlar[2, 8]));
                Chart3.Series["Yanlış"].Points.AddXY("Fen Bilimleri", Convert.ToInt32(sinavlar[2, 9]));
                if (ss == 1 || ss == 2)
                {
                    Chart3.Titles.Add("Sınava Girmedi.");
                }
                else
                {
                    Chart3.Titles.Add(sinavlar[2, 10]);
                }


                Chart8.Series["Doğru"].Points.AddXY("Türkçe", Convert.ToInt32(sinavlar[3, 2]));
                Chart8.Series["Yanlış"].Points.AddXY("Türkçe", Convert.ToInt32(sinavlar[3, 3]));
                Chart8.Series["Doğru"].Points.AddXY("Sosyal Bilimler", Convert.ToInt32(sinavlar[3, 4]));
                Chart8.Series["Yanlış"].Points.AddXY("Sosyal Bilimler", Convert.ToInt32(sinavlar[3, 5]));
                Chart8.Series["Doğru"].Points.AddXY("Matematik", Convert.ToInt32(sinavlar[3, 6]));
                Chart8.Series["Yanlış"].Points.AddXY("Matematik", Convert.ToInt32(sinavlar[3, 7]));
                Chart8.Series["Doğru"].Points.AddXY("Fen Bilimleri", Convert.ToInt32(sinavlar[3, 8]));
                Chart8.Series["Yanlış"].Points.AddXY("Fen Bilimleri", Convert.ToInt32(sinavlar[3, 9]));

                if (ss == 1 || ss == 2 || ss == 3)
                {
                    Chart8.Titles.Add("Sınava Girmedi.");
                }
                else
                {
                    Chart8.Titles.Add(sinavlar[3, 10]);
                }



                if (ss == 1)
                {
                    lbl2SinavAdi.Text = "Sınava Girmedi.";
                    lbl3SinavAdi.Text = "Sınava Girmedi.";
                    lbl4SinavAdi.Text = "Sınava Girmedi.";
                }
                else if (ss == 2)
                {
                    lbl3SinavAdi.Text = "Sınava Girmedi.";
                    lbl4SinavAdi.Text = "Sınava Girmedi.";
                }
                else
                {
                    lbl4SinavAdi.Text = "Sınava Girmedi.";
                }



                //select TOP(5) * from Ogrenci_Sinav, Sinav where Ogrenci_Sinav.sinavID=Sinav.sinavID and ogrNo=57321  Order By tarih DESC;

                String[,] basari = new String[5, 10];
                string sorgu1 = "select TOP(5) * from Ogrenci_Sinav, Sinav where Ogrenci_Sinav.sinavID=Sinav.sinavID and ogrNo=" + Request.QueryString["ogrNo"] + "  Order By tarih DESC;";
                SqlCommand komut1 = new SqlCommand(sorgu1, baglanti);
                SqlDataReader dr1 = komut.ExecuteReader();

                i = 0;

                while (dr1.Read())
                {
                    basari[i, 0] = Convert.ToString(dr1["trD"]);
                    basari[i, 1] = Convert.ToString(dr1["trY"]);
                    basari[i, 2] = Convert.ToString(dr1["ssD"]);
                    basari[i, 3] = Convert.ToString(dr1["ssY"]);
                    basari[i, 4] = Convert.ToString(dr1["mtD"]);
                    basari[i, 5] = Convert.ToString(dr1["mtY"]);
                    basari[i, 6] = Convert.ToString(dr1["fnD"]);
                    basari[i, 7] = Convert.ToString(dr1["fnY"]);
                    basari[i, 9] = Convert.ToString(dr1["sinavAdi"]);

                    i++;
                    if (i == 5)
                    {
                        break;
                    }
                }
                dr1.Close();

                if (i == 1)
                {

                    Chart4.Series["Türkçe"].Points.AddXY(basari[0, 9], Convert.ToInt32(basari[0, 0]) - Convert.ToInt32(basari[0, 1]) / 4);
                    Chart4.Series["Türkçe"].Points.AddXY(basari[0, 9], Convert.ToInt32(basari[0, 0]) - Convert.ToInt32(basari[0, 1]) / 4);
                    Chart4.Series["Türkçe"].Points.AddXY(basari[0, 9], Convert.ToInt32(basari[0, 0]) - Convert.ToInt32(basari[0, 1]) / 4);
                    Chart4.Series["Türkçe"].Points.AddXY(basari[0, 9], Convert.ToInt32(basari[0, 0]) - Convert.ToInt32(basari[0, 1]) / 4);
                    Chart4.Series["Türkçe"].Points.AddXY(basari[0, 9], Convert.ToInt32(basari[0, 0]) - Convert.ToInt32(basari[0, 1]) / 4);
                    Chart4.Titles.Add("Türkçe Net Başarısı");

                    Chart5.Series["Sosyal"].Points.AddXY(basari[0, 9], Convert.ToInt32(basari[0, 2]) - Convert.ToInt32(basari[0, 3]) / 4);
                    Chart5.Series["Sosyal"].Points.AddXY(basari[0, 9], Convert.ToInt32(basari[0, 2]) - Convert.ToInt32(basari[0, 3]) / 4);
                    Chart5.Series["Sosyal"].Points.AddXY(basari[0, 9], Convert.ToInt32(basari[0, 2]) - Convert.ToInt32(basari[0, 3]) / 4);
                    Chart5.Series["Sosyal"].Points.AddXY(basari[0, 9], Convert.ToInt32(basari[0, 2]) - Convert.ToInt32(basari[0, 3]) / 4);
                    Chart5.Series["Sosyal"].Points.AddXY(basari[0, 9], Convert.ToInt32(basari[0, 2]) - Convert.ToInt32(basari[0, 3]) / 4);
                    Chart5.Titles.Add("Sosyal Bilimler Net Başarısı");

                    Chart6.Series["Matematik"].Points.AddXY(basari[0, 9], Convert.ToInt32(basari[0, 4]) - Convert.ToInt32(basari[0, 5]) / 4);
                    Chart6.Series["Matematik"].Points.AddXY(basari[0, 9], Convert.ToInt32(basari[0, 4]) - Convert.ToInt32(basari[0, 5]) / 4);
                    Chart6.Series["Matematik"].Points.AddXY(basari[0, 9], Convert.ToInt32(basari[0, 4]) - Convert.ToInt32(basari[0, 5]) / 4);
                    Chart6.Series["Matematik"].Points.AddXY(basari[0, 9], Convert.ToInt32(basari[0, 4]) - Convert.ToInt32(basari[0, 5]) / 4);
                    Chart6.Series["Matematik"].Points.AddXY(basari[0, 9], Convert.ToInt32(basari[0, 4]) - Convert.ToInt32(basari[0, 5]) / 4);
                    Chart6.Titles.Add("Matematik Net Başarısı");

                    Chart7.Series["Fen"].Points.AddXY(basari[0, 9], Convert.ToInt32(basari[0, 6]) - Convert.ToInt32(basari[0, 7]) / 4);
                    Chart7.Series["Fen"].Points.AddXY(basari[0, 9], Convert.ToInt32(basari[0, 6]) - Convert.ToInt32(basari[0, 7]) / 4);
                    Chart7.Series["Fen"].Points.AddXY(basari[0, 9], Convert.ToInt32(basari[0, 6]) - Convert.ToInt32(basari[0, 7]) / 4);
                    Chart7.Series["Fen"].Points.AddXY(basari[0, 9], Convert.ToInt32(basari[0, 6]) - Convert.ToInt32(basari[0, 7]) / 4);
                    Chart7.Series["Fen"].Points.AddXY(basari[0, 9], Convert.ToInt32(basari[0, 6]) - Convert.ToInt32(basari[0, 7]) / 4);
                    Chart7.Titles.Add("Fen Bilimleri Net Başarısı");

                }
                else if (i == 2)
                {
                    Chart4.Series["Türkçe"].Points.AddXY(basari[0, 9], Convert.ToInt32(basari[0, 0]) - Convert.ToInt32(basari[0, 1]) / 4);
                    Chart4.Series["Türkçe"].Points.AddXY(basari[1, 9], Convert.ToInt32(basari[1, 0]) - Convert.ToInt32(basari[1, 1]) / 4);
                    Chart4.Series["Türkçe"].Points.AddXY(basari[1, 9], Convert.ToInt32(basari[1, 0]) - Convert.ToInt32(basari[1, 1]) / 4);
                    Chart4.Series["Türkçe"].Points.AddXY(basari[1, 9], Convert.ToInt32(basari[1, 0]) - Convert.ToInt32(basari[1, 1]) / 4);
                    Chart4.Series["Türkçe"].Points.AddXY(basari[1, 9], Convert.ToInt32(basari[1, 0]) - Convert.ToInt32(basari[1, 1]) / 4);
                    Chart4.Titles.Add("Türkçe Net Başarısı");

                    Chart5.Series["Sosyal"].Points.AddXY(basari[0, 9], Convert.ToInt32(basari[0, 2]) - Convert.ToInt32(basari[0, 3]) / 4);
                    Chart5.Series["Sosyal"].Points.AddXY(basari[1, 9], Convert.ToInt32(basari[1, 2]) - Convert.ToInt32(basari[1, 3]) / 4);
                    Chart5.Series["Sosyal"].Points.AddXY(basari[1, 9], Convert.ToInt32(basari[1, 2]) - Convert.ToInt32(basari[1, 3]) / 4);
                    Chart5.Series["Sosyal"].Points.AddXY(basari[1, 9], Convert.ToInt32(basari[1, 2]) - Convert.ToInt32(basari[1, 3]) / 4);
                    Chart5.Series["Sosyal"].Points.AddXY(basari[1, 9], Convert.ToInt32(basari[1, 2]) - Convert.ToInt32(basari[1, 3]) / 4);
                    Chart5.Titles.Add("Sosyal Bilimler Net Başarısı");

                    Chart6.Series["Matematik"].Points.AddXY(basari[0, 9], Convert.ToInt32(basari[0, 4]) - Convert.ToInt32(basari[0, 5]) / 4);
                    Chart6.Series["Matematik"].Points.AddXY(basari[1, 9], Convert.ToInt32(basari[1, 4]) - Convert.ToInt32(basari[1, 5]) / 4);
                    Chart6.Series["Matematik"].Points.AddXY(basari[1, 9], Convert.ToInt32(basari[1, 4]) - Convert.ToInt32(basari[1, 5]) / 4);
                    Chart6.Series["Matematik"].Points.AddXY(basari[1, 9], Convert.ToInt32(basari[1, 4]) - Convert.ToInt32(basari[1, 5]) / 4);
                    Chart6.Series["Matematik"].Points.AddXY(basari[1, 9], Convert.ToInt32(basari[1, 4]) - Convert.ToInt32(basari[1, 5]) / 4);
                    Chart6.Titles.Add("Matematik Net Başarısı");

                    Chart7.Series["Fen"].Points.AddXY(basari[0, 9], Convert.ToInt32(basari[0, 6]) - Convert.ToInt32(basari[0, 7]) / 4);
                    Chart7.Series["Fen"].Points.AddXY(basari[1, 9], Convert.ToInt32(basari[1, 6]) - Convert.ToInt32(basari[1, 7]) / 4);
                    Chart7.Series["Fen"].Points.AddXY(basari[1, 9], Convert.ToInt32(basari[1, 6]) - Convert.ToInt32(basari[1, 7]) / 4);
                    Chart7.Series["Fen"].Points.AddXY(basari[1, 9], Convert.ToInt32(basari[1, 6]) - Convert.ToInt32(basari[1, 7]) / 4);
                    Chart7.Series["Fen"].Points.AddXY(basari[1, 9], Convert.ToInt32(basari[1, 6]) - Convert.ToInt32(basari[1, 7]) / 4);
                    Chart7.Titles.Add("Fen Bilimleri Net Başarısı");
                }
                else if (i == 3)
                {
                    Chart4.Series["Türkçe"].Points.AddXY(basari[0, 9], Convert.ToInt32(basari[0, 0]) - Convert.ToInt32(basari[0, 1]) / 4);
                    Chart4.Series["Türkçe"].Points.AddXY(basari[1, 9], Convert.ToInt32(basari[1, 0]) - Convert.ToInt32(basari[1, 1]) / 4);
                    Chart4.Series["Türkçe"].Points.AddXY(basari[2, 9], Convert.ToInt32(basari[2, 0]) - Convert.ToInt32(basari[2, 1]) / 4);
                    Chart4.Series["Türkçe"].Points.AddXY(basari[2, 9], Convert.ToInt32(basari[2, 0]) - Convert.ToInt32(basari[2, 1]) / 4);
                    Chart4.Series["Türkçe"].Points.AddXY(basari[2, 9], Convert.ToInt32(basari[2, 0]) - Convert.ToInt32(basari[2, 1]) / 4);
                    Chart4.Titles.Add("Türkçe Net Başarısı");

                    Chart5.Series["Sosyal"].Points.AddXY(basari[0, 9], Convert.ToInt32(basari[0, 2]) - Convert.ToInt32(basari[0, 3]) / 4);
                    Chart5.Series["Sosyal"].Points.AddXY(basari[1, 9], Convert.ToInt32(basari[1, 2]) - Convert.ToInt32(basari[1, 3]) / 4);
                    Chart5.Series["Sosyal"].Points.AddXY(basari[2, 9], Convert.ToInt32(basari[2, 2]) - Convert.ToInt32(basari[2, 3]) / 4);
                    Chart5.Series["Sosyal"].Points.AddXY(basari[2, 9], Convert.ToInt32(basari[2, 2]) - Convert.ToInt32(basari[2, 3]) / 4);
                    Chart5.Series["Sosyal"].Points.AddXY(basari[2, 9], Convert.ToInt32(basari[2, 2]) - Convert.ToInt32(basari[2, 3]) / 4);
                    Chart5.Titles.Add("Sosyal Bilimler Net Başarısı");

                    Chart6.Series["Matematik"].Points.AddXY(basari[0, 9], Convert.ToInt32(basari[0, 4]) - Convert.ToInt32(basari[0, 5]) / 4);
                    Chart6.Series["Matematik"].Points.AddXY(basari[1, 9], Convert.ToInt32(basari[1, 4]) - Convert.ToInt32(basari[1, 5]) / 4);
                    Chart6.Series["Matematik"].Points.AddXY(basari[2, 9], Convert.ToInt32(basari[2, 4]) - Convert.ToInt32(basari[2, 5]) / 4);
                    Chart6.Series["Matematik"].Points.AddXY(basari[2, 9], Convert.ToInt32(basari[2, 4]) - Convert.ToInt32(basari[2, 5]) / 4);
                    Chart6.Series["Matematik"].Points.AddXY(basari[2, 9], Convert.ToInt32(basari[2, 4]) - Convert.ToInt32(basari[2, 5]) / 4);
                    Chart6.Titles.Add("Matematik Net Başarısı");

                    Chart7.Series["Fen"].Points.AddXY(basari[0, 9], Convert.ToInt32(basari[0, 6]) - Convert.ToInt32(basari[0, 7]) / 4);
                    Chart7.Series["Fen"].Points.AddXY(basari[1, 9], Convert.ToInt32(basari[1, 6]) - Convert.ToInt32(basari[1, 7]) / 4);
                    Chart7.Series["Fen"].Points.AddXY(basari[2, 9], Convert.ToInt32(basari[2, 6]) - Convert.ToInt32(basari[2, 7]) / 4);
                    Chart7.Series["Fen"].Points.AddXY(basari[2, 9], Convert.ToInt32(basari[2, 6]) - Convert.ToInt32(basari[2, 7]) / 4);
                    Chart7.Series["Fen"].Points.AddXY(basari[2, 9], Convert.ToInt32(basari[2, 6]) - Convert.ToInt32(basari[2, 7]) / 4);
                    Chart7.Titles.Add("Fen Bilimleri Net Başarısı");

                }
                else if (i == 4)
                {
                    Chart4.Series["Türkçe"].Points.AddXY(basari[0, 9], Convert.ToInt32(basari[0, 0]) - Convert.ToInt32(basari[0, 1]) / 4);
                    Chart4.Series["Türkçe"].Points.AddXY(basari[1, 9], Convert.ToInt32(basari[1, 0]) - Convert.ToInt32(basari[1, 1]) / 4);
                    Chart4.Series["Türkçe"].Points.AddXY(basari[2, 9], Convert.ToInt32(basari[2, 0]) - Convert.ToInt32(basari[2, 1]) / 4);
                    Chart4.Series["Türkçe"].Points.AddXY(basari[3, 9], Convert.ToInt32(basari[3, 0]) - Convert.ToInt32(basari[3, 1]) / 4);
                    Chart4.Series["Türkçe"].Points.AddXY(basari[3, 9], Convert.ToInt32(basari[3, 0]) - Convert.ToInt32(basari[3, 1]) / 4);
                    Chart4.Titles.Add("Türkçe Net Başarısı");

                    Chart5.Series["Sosyal"].Points.AddXY(basari[0, 9], Convert.ToInt32(basari[0, 2]) - Convert.ToInt32(basari[0, 3]) / 4);
                    Chart5.Series["Sosyal"].Points.AddXY(basari[1, 9], Convert.ToInt32(basari[1, 2]) - Convert.ToInt32(basari[1, 3]) / 4);
                    Chart5.Series["Sosyal"].Points.AddXY(basari[2, 9], Convert.ToInt32(basari[2, 2]) - Convert.ToInt32(basari[2, 3]) / 4);
                    Chart5.Series["Sosyal"].Points.AddXY(basari[3, 9], Convert.ToInt32(basari[3, 2]) - Convert.ToInt32(basari[3, 3]) / 4);
                    Chart5.Series["Sosyal"].Points.AddXY(basari[3, 9], Convert.ToInt32(basari[3, 2]) - Convert.ToInt32(basari[3, 3]) / 4);
                    Chart5.Titles.Add("Sosyal Bilimler Net Başarısı");

                    Chart6.Series["Matematik"].Points.AddXY(basari[0, 9], Convert.ToInt32(basari[0, 4]) - Convert.ToInt32(basari[0, 5]) / 4);
                    Chart6.Series["Matematik"].Points.AddXY(basari[1, 9], Convert.ToInt32(basari[1, 4]) - Convert.ToInt32(basari[1, 5]) / 4);
                    Chart6.Series["Matematik"].Points.AddXY(basari[2, 9], Convert.ToInt32(basari[2, 4]) - Convert.ToInt32(basari[2, 5]) / 4);
                    Chart6.Series["Matematik"].Points.AddXY(basari[3, 9], Convert.ToInt32(basari[3, 4]) - Convert.ToInt32(basari[3, 5]) / 4);
                    Chart6.Series["Matematik"].Points.AddXY(basari[3, 9], Convert.ToInt32(basari[3, 4]) - Convert.ToInt32(basari[3, 5]) / 4);
                    Chart6.Titles.Add("Matematik Net Başarısı");

                    Chart7.Series["Fen"].Points.AddXY(basari[0, 9], Convert.ToInt32(basari[0, 6]) - Convert.ToInt32(basari[0, 7]) / 4);
                    Chart7.Series["Fen"].Points.AddXY(basari[1, 9], Convert.ToInt32(basari[1, 6]) - Convert.ToInt32(basari[1, 7]) / 4);
                    Chart7.Series["Fen"].Points.AddXY(basari[2, 9], Convert.ToInt32(basari[2, 6]) - Convert.ToInt32(basari[2, 7]) / 4);
                    Chart7.Series["Fen"].Points.AddXY(basari[3, 9], Convert.ToInt32(basari[3, 6]) - Convert.ToInt32(basari[3, 7]) / 4);
                    Chart7.Series["Fen"].Points.AddXY(basari[3, 9], Convert.ToInt32(basari[3, 6]) - Convert.ToInt32(basari[3, 7]) / 4);
                    Chart7.Titles.Add("Fen Bilimleri Net Başarısı");

                }
                else if (i == 5)
                {

                    Chart4.Series["Türkçe"].Points.AddXY(basari[0, 9], Convert.ToInt32(basari[0, 0]) - Convert.ToInt32(basari[0, 1]) / 4);
                    Chart4.Series["Türkçe"].Points.AddXY(basari[1, 9], Convert.ToInt32(basari[1, 0]) - Convert.ToInt32(basari[1, 1]) / 4);
                    Chart4.Series["Türkçe"].Points.AddXY(basari[2, 9], Convert.ToInt32(basari[2, 0]) - Convert.ToInt32(basari[2, 1]) / 4);
                    Chart4.Series["Türkçe"].Points.AddXY(basari[3, 9], Convert.ToInt32(basari[3, 0]) - Convert.ToInt32(basari[3, 1]) / 4);
                    Chart4.Series["Türkçe"].Points.AddXY(basari[4, 9], Convert.ToInt32(basari[4, 0]) - Convert.ToInt32(basari[4, 1]) / 4);
                    Chart4.Titles.Add("Türkçe Net Başarısı");

                    Chart5.Series["Sosyal"].Points.AddXY(basari[0, 9], Convert.ToInt32(basari[0, 2]) - Convert.ToInt32(basari[0, 3]) / 4);
                    Chart5.Series["Sosyal"].Points.AddXY(basari[1, 9], Convert.ToInt32(basari[1, 2]) - Convert.ToInt32(basari[1, 3]) / 4);
                    Chart5.Series["Sosyal"].Points.AddXY(basari[2, 9], Convert.ToInt32(basari[2, 2]) - Convert.ToInt32(basari[2, 3]) / 4);
                    Chart5.Series["Sosyal"].Points.AddXY(basari[3, 9], Convert.ToInt32(basari[3, 2]) - Convert.ToInt32(basari[3, 3]) / 4);
                    Chart5.Series["Sosyal"].Points.AddXY(basari[4, 9], Convert.ToInt32(basari[4, 2]) - Convert.ToInt32(basari[4, 3]) / 4);
                    Chart5.Titles.Add("Sosyal Bilimler Net Başarısı");

                    Chart6.Series["Matematik"].Points.AddXY(basari[0, 9], Convert.ToInt32(basari[0, 4]) - Convert.ToInt32(basari[0, 5]) / 4);
                    Chart6.Series["Matematik"].Points.AddXY(basari[1, 9], Convert.ToInt32(basari[1, 4]) - Convert.ToInt32(basari[1, 5]) / 4);
                    Chart6.Series["Matematik"].Points.AddXY(basari[2, 9], Convert.ToInt32(basari[2, 4]) - Convert.ToInt32(basari[2, 5]) / 4);
                    Chart6.Series["Matematik"].Points.AddXY(basari[3, 9], Convert.ToInt32(basari[3, 4]) - Convert.ToInt32(basari[3, 5]) / 4);
                    Chart6.Series["Matematik"].Points.AddXY(basari[4, 9], Convert.ToInt32(basari[4, 4]) - Convert.ToInt32(basari[4, 5]) / 4);
                    Chart6.Titles.Add("Matematik Net Başarısı");

                    Chart7.Series["Fen"].Points.AddXY(basari[0, 9], Convert.ToInt32(basari[0, 6]) - Convert.ToInt32(basari[0, 7]) / 4);
                    Chart7.Series["Fen"].Points.AddXY(basari[1, 9], Convert.ToInt32(basari[1, 6]) - Convert.ToInt32(basari[1, 7]) / 4);
                    Chart7.Series["Fen"].Points.AddXY(basari[2, 9], Convert.ToInt32(basari[2, 6]) - Convert.ToInt32(basari[2, 7]) / 4);
                    Chart7.Series["Fen"].Points.AddXY(basari[3, 9], Convert.ToInt32(basari[3, 6]) - Convert.ToInt32(basari[3, 7]) / 4);
                    Chart7.Series["Fen"].Points.AddXY(basari[4, 9], Convert.ToInt32(basari[4, 6]) - Convert.ToInt32(basari[4, 7]) / 4);
                    Chart7.Titles.Add("Fen Bilimleri Net Başarısı");

                }
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                baglanti.Close();
            }

        }

        // ayarlar - güncelleme
        protected void btnGuncelle_Click(object sender, EventArgs e)
        {
            try
            {
                string sorgu2 = "UPDATE Ogrenci SET ogrParola = @ogrParola, ogrMail = @ogrMail, ogrCins = @ogrCins, ogrSube = @ogrSube WHERE ogrNo = @ogrNo";
                SqlCommand komut2 = new SqlCommand(sorgu2, baglanti);
                komut2.Parameters.AddWithValue("@ogrNo", ogrenci);
                komut2.Parameters.AddWithValue("@ogrMail", txtAyarEposta.Text);
                komut2.Parameters.AddWithValue("@ogrParola", MD5Olustur(txtAyarParola.Text));
                komut2.Parameters.AddWithValue("@ogrSube", txtAyarSube.Text);
                komut2.Parameters.AddWithValue("@ogrCins", dropAyarCinsiyet.Text);

                baglanti.Open();

                int durum = komut2.ExecuteNonQuery();
                if (durum == 1)
                {
                    lblAyarOK.Text = "Güncelleme işlemi başarıyla gerçekleştirildi.";
                }
                else
                {
                    lblAyarFAIL.Text = "Güncelleme işlemi başarısız!";
                }

            }
            catch (Exception ex)
            {
                lblAyarFAIL.Text = "Hata : " + ex;
            }
            finally
            {
                baglanti.Close();
            }
        }

        // ayarlar - bilgi getirme
        protected void btnBilgiGetir_Click(object sender, EventArgs e)
        {
            try
            {
                string sorgu1 = "SELECT * FROM Ogrenci WHERE ogrNo = @ogrNo";
                SqlCommand komut1 = new SqlCommand(sorgu1, baglanti);
                komut1.Parameters.AddWithValue("@ogrNo", ogrenci);

                baglanti.Open();

                SqlDataReader dr1 = komut1.ExecuteReader();

                if (dr1.Read())
                {
                    // ayarlar
                    txtAyarID.Text = dr1["ogrNo"].ToString();
                    txtAyarAdi.Text = dr1["ogrAdi"].ToString();
                    txtAyarSoyadi.Text = dr1["ogrSoyadi"].ToString();
                    txtAyarTC.Text = dr1["ogrTC"].ToString();
                    txtAyarEposta.Text = dr1["ogrMail"].ToString();
                    dropAyarCinsiyet.Text = dr1["ogrCins"].ToString();
                    txtAyarSinif.Text = dr1["ogrSinif"].ToString();
                    txtAyarSube.Text = dr1["ogrSube"].ToString();
                }
                else
                {
                    txtAyarID.Text = "Kayıt Bulunamadı!";
                    txtAyarAdi.Text = "Kayıt Bulunamadı!";
                    txtAyarSoyadi.Text = "Kayıt Bulunamadı!";
                    txtAyarTC.Text = "Kayıt Bulunamadı!";
                    txtAyarEposta.Text = "Kayıt Bulunamadı!";
                    dropAyarCinsiyet.Text = "Kayıt Bulunamadı!";
                    txtAyarSinif.Text = "Kayıt Bulunamadı!";
                    txtAyarSube.Text = "Kayıt Bulunamadı!";
                }

            }
            catch (Exception ex)
            {
                txtAyarID.Text = "Hatalı erişim!" + ex;
                txtAyarAdi.Text = "Hatalı erişim!";
                txtAyarSoyadi.Text = "Hatalı erişim!";
                txtAyarTC.Text = "Hatalı erişim!";
                txtAyarEposta.Text = "Hatalı erişim!";
                dropAyarCinsiyet.Text = "Hatalı erişim!";
                txtAyarSinif.Text = "Hatalı erişim!";
                txtAyarSube.Text = "Hatalı erişim!";
            }
            finally
            {
                baglanti.Close();
            }
        }

        // session çıkış
        protected void btnCikis_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Default.aspx");
        }

        // md5 şifreleme
        public string MD5Olustur(string input)
        {
            MD5 md5Hasher = MD5.Create();
            byte[] data = md5Hasher.ComputeHash(Encoding.Default.GetBytes(input));
            StringBuilder sBuilder = new StringBuilder();
            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }
            return sBuilder.ToString();
        }

        // öğretmen arama
        protected void btnOgrtAra_Click(object sender, EventArgs e)
        {
            try
            {
                string sorgu33 = "SELECT * FROM Ogretmen WHERE ogrtAdi LIKE '%" + txtOgrtAra.Text + "%'";
                SqlCommand komut33 = new SqlCommand(sorgu33, baglanti);
                baglanti.Open();
                SqlDataReader dr33 = komut33.ExecuteReader();
                lstOgretmen.DataSource = dr33;
                lstOgretmen.DataBind();

            }
            catch (Exception)
            {

            }
            finally
            {
                baglanti.Close();
            }
        }
               
    }
}