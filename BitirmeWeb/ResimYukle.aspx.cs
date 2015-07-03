using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BitirmeWeb
{
    public partial class ResimYukle : System.Web.UI.Page
    {
        SqlConnection baglanti = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["DB_Bitirme"].ConnectionString);

        public object yonetici;
        public object ogretmen;
        public object ogrenci;
        public object veli;

        // page load
        protected void Page_Load(object sender, EventArgs e)
        {
            yonetici = Session["yonetici"];
            ogretmen = Session["ogretmen"];
            ogrenci = Session["ogrenci"];
            veli = Session["veli"];
            // yönetici session
            if (yonetici != null)
            {
                btnIptal.PostBackUrl = "~/admin/Default.aspx";
            }
            else
            {
                // session ogretmen
                if (ogretmen != null)
                {
                    btnIptal.PostBackUrl = "Ogretmen.aspx";
                }
                else
                {
                    // session ogrenci
                    if (ogrenci != null)
                    {
                        btnIptal.PostBackUrl = "Ogrenci.aspx";
                    }
                    else
                    {
                        // session veli
                        if (veli != null)
                        {
                            btnIptal.PostBackUrl = "Veli.aspx";
                        }
                        else
                        {
                            Response.Redirect("Default.aspx");
                        }
                    }
                }
            }
        }

        // resim yükleme
        protected void btnResimYukle_Click(object sender, EventArgs e)
        {
            lblResimHata.Text = "";
            lblResimOK.Text = "";

            if (FileProfilResim.HasFile)
            {
                // session yönetici
                if (yonetici != null)
                {
                    // yönetici resim değişimi
                    try
                    {
                        FileProfilResim.SaveAs(Request.PhysicalApplicationPath + "img\\profil\\" + yonetici + "-yonetici-" + FileProfilResim.FileName);

                        string sorgu2 = "UPDATE Yonetici SET yonResim = @resim WHERE yonKadi = @kadi";
                        SqlCommand komut2 = new SqlCommand(sorgu2, baglanti);
                        komut2.Parameters.AddWithValue("@kadi", yonetici);
                        komut2.Parameters.AddWithValue("@resim", "../img/profil/" + yonetici + "-yonetici-" + FileProfilResim.FileName);

                        baglanti.Open();

                        int durum = komut2.ExecuteNonQuery();
                        if (durum == 1)
                        {
                            lblResimOK.Text = "Dosya Yükleme Başarılı";
                            Response.Redirect("~/admin/Default.aspx");
                        }
                        else
                        {
                            lblResimHata.Text = "Dosya Yükleme Başarısız!";
                        }

                    }
                    catch (Exception ex)
                    {
                        lblResimHata.Text = "Hata : " + ex.Message.ToString();
                    }
                }
                else
                {
                    // session ogretmen
                    if (ogretmen != null)
                    {
                        // öğretmen resim değişimi
                        try
                        {
                            FileProfilResim.SaveAs(Request.PhysicalApplicationPath + "img\\profil\\" + ogretmen + "-ogretmen-" + FileProfilResim.FileName);

                            string sorgu2 = "UPDATE Ogretmen SET ogrtResim = @resim WHERE ogrtKadi = @kadi";
                            SqlCommand komut2 = new SqlCommand(sorgu2, baglanti);
                            komut2.Parameters.AddWithValue("@kadi", ogretmen);
                            komut2.Parameters.AddWithValue("@resim", "../img/profil/" + ogretmen + "-ogretmen-" + FileProfilResim.FileName);

                            baglanti.Open();

                            int durum = komut2.ExecuteNonQuery();
                            if (durum == 1)
                            {
                                lblResimOK.Text = "Dosya Yükleme Başarılı";
                                Response.Redirect("Ogretmen.aspx");
                            }
                            else
                            {
                                lblResimHata.Text = "Dosya Yükleme Başarısız!";
                            }

                        }
                        catch (Exception ex)
                        {
                            lblResimHata.Text = "Hata : " + ex.Message.ToString();
                        }
                    }
                    else
                    {
                        // session ogrenci
                        if (ogrenci != null)
                        {
                            // öğrenci resim değişimi
                            try
                            {
                                FileProfilResim.SaveAs(Request.PhysicalApplicationPath + "img\\profil\\" + ogrenci + "-ogrenci-" + FileProfilResim.FileName);

                                string sorgu2 = "UPDATE Ogrenci SET ogrResim = @resim WHERE ogrNo = @kadi";
                                SqlCommand komut2 = new SqlCommand(sorgu2, baglanti);
                                komut2.Parameters.AddWithValue("@kadi", ogrenci);
                                komut2.Parameters.AddWithValue("@resim", "../img/profil/" + ogrenci + "-ogrenci-" + FileProfilResim.FileName);

                                baglanti.Open();

                                int durum = komut2.ExecuteNonQuery();
                                if (durum == 1)
                                {
                                    lblResimOK.Text = "Dosya Yükleme Başarılı";
                                    Response.Redirect("Ogrenci.aspx");
                                }
                                else
                                {
                                    lblResimHata.Text = "Dosya Yükleme Başarısız!";
                                }

                            }
                            catch (Exception ex)
                            {
                                lblResimHata.Text = "Hata : " + ex.Message.ToString();
                            }
                        }
                        else
                        {
                            // session veli
                            if (veli != null)
                            {
                                // veli resim değişimi
                                try
                                {
                                    FileProfilResim.SaveAs(Request.PhysicalApplicationPath + "img\\profil\\" + veli + "-veli-" + FileProfilResim.FileName);

                                    string sorgu2 = "UPDATE Veli SET veliResim = @resim WHERE veliKadi = @kadi";
                                    SqlCommand komut2 = new SqlCommand(sorgu2, baglanti);
                                    komut2.Parameters.AddWithValue("@kadi", veli);
                                    komut2.Parameters.AddWithValue("@resim", "../img/profil/" + veli + "-veli-" + FileProfilResim.FileName);

                                    baglanti.Open();

                                    int durum = komut2.ExecuteNonQuery();
                                    if (durum == 1)
                                    {
                                        lblResimOK.Text = "Dosya Yükleme Başarılı";
                                        Response.Redirect("Veli.aspx");
                                    }
                                    else
                                    {
                                        lblResimHata.Text = "Dosya Yükleme Başarısız!";
                                    }

                                }
                                catch (Exception ex)
                                {
                                    lblResimHata.Text = "Hata : " + ex.Message.ToString();
                                }
                            }
                            else
                            {
                                lblResimHata.Text = "Oturum Hatası!";
                            }
                        }
                    }
                }
            }
            else
            {
                lblResimHata.Text = "Lütfen Dosya Seçin!";
            }
        }
    }
}