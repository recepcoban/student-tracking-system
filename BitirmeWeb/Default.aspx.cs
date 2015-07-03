using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BitirmeWeb
{
    public partial class Default : System.Web.UI.Page
    {
        SqlConnection baglanti = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["DB_Bitirme"].ConnectionString);

        public object ogretmen;
        public object ogrenci;
        public object veli;

        // Page Load
        protected void Page_Load(object sender, EventArgs e)
        {
            ogretmen = Session["ogretmen"];
            ogrenci = Session["ogrenci"];
            veli = Session["veli"];
            // session ogretmen
            if (ogretmen != null)
            {
                hyperSession.Text = "Hoşgeldin, " + ogretmen.ToString();
                hyperSession.NavigateUrl = "Ogretmen.aspx";
                btnSessionGiris.Visible = false;
                btnCikis.Visible = true;
            }
            else
            {
                // session ogrenci
                if (ogrenci != null)
                {
                    hyperSession.Text = "Hoşgeldin, " + ogrenci.ToString();
                    hyperSession.NavigateUrl = "Ogrenci.aspx";
                    btnSessionGiris.Visible = false;
                    btnCikis.Visible = true;
                }
                else
                {
                    // session veli
                    if (veli != null)
                    {
                        hyperSession.Text = "Hoşgeldin, " + veli.ToString();
                        hyperSession.NavigateUrl = "Veli.aspx";
                        btnSessionGiris.Visible = false;
                        btnCikis.Visible = true;
                    }
                    else
                    {
                        hyperSession.Text = "";
                        btnSessionGiris.Visible = true;
                        btnCikis.Visible = false;
                    }
                }
            }
        }

        // Öğrenci no sorgulama - veli kayıt
        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            lblEvetHayir.Text = "";
            kayit_ok.Text = "";
            kayit_fail.Text = "";

            if (kayit_username.Text.Equals("") || kayit_adi.Text.Equals("") || kayit_soyadi.Text.Equals("") || kayit_eposta.Text.Equals("") || kayit_parola.Text.Equals("") || kayit_parola_tekrar.Text.Equals(""))
            {
                kayit_fail.Text = "Boş Alan Bırakmayınız!";
            }
            else
            {
                try
                {
                    String sorgu = "SELECT * FROM Ogrenci WHERE ogrNo = @ogrNo";
                    SqlCommand komut = new SqlCommand(sorgu, baglanti);
                    komut.Parameters.AddWithValue("@ogrNo", Convert.ToInt32(kayit_ogrTC.Text));

                    baglanti.Open();

                    SqlDataReader dr = komut.ExecuteReader();
                    if (dr.Read())
                    {
                        lblEvetHayir.Text = "Bu numara : " + dr["ogrAdi"].ToString() + " " + dr["ogrSoyadi"].ToString() + " adlı öğrenciye aittir. DOĞRU MU?";
                        panelKaydet.Visible = false;
                        panelEvetHayir.Visible = true;
                    }
                    else
                    {
                        kayit_fail.Text = "Bu Numaraya Sahip Bir Öğrenci Kaydı Sistemde Bulunmamaktadır! Lütfen Numarayı Yeniden Giriniz";
                        kayit_ogrTC.Text = "";
                        panelKaydet.Visible = true;
                        panelEvetHayir.Visible = false;
                    }

                }
                catch (Exception ex)
                {
                    kayit_fail.Text = "Hata : " + ex;
                }
                finally
                {
                    baglanti.Close();
                }
            }

        }

        // Giriş Yap
        protected void btnGiris_Click(object sender, EventArgs e)
        {

            giris_ok.Text = "";
            giris_fail.Text = "";

            if (username_giris.Text.Equals("") || parola_giris.Text.Equals(""))
            {
                giris_fail.Text = "Boş Alan Bırakmayınız!";
            }
            else
            {
                try
                {
                    String sorgu = "";

                    if (rbOgrt.Checked)
                    {
                        sorgu = "SELECT * FROM Ogretmen WHERE ogrtKadi = @kadi AND ogrtParola = @parola";
                    }
                    else if (rbOgr.Checked)
                    {
                        sorgu = "SELECT * FROM Ogrenci WHERE ogrNo = @kadi AND ogrParola = @parola";
                    }
                    else if (rbVeli.Checked)
                    {
                        sorgu = "SELECT * FROM Veli WHERE veliKadi = @kadi AND veliParola = @parola";
                    }
                    else
                    {
                        giris_fail.Text = "Hatalı giriş, lütfen bilgileri kontrol ediniz!";
                    }

                    SqlCommand komut = new SqlCommand(sorgu, baglanti);
                    komut.Parameters.AddWithValue("@kadi", username_giris.Text);
                    komut.Parameters.AddWithValue("@parola", MD5Olustur(parola_giris.Text));

                    baglanti.Open();

                    SqlDataReader dr = komut.ExecuteReader();
                    if (dr.Read())
                    {
                        Session.Timeout = 20;

                        if (rbOgrt.Checked)
                        {
                            Session.Add("ogretmen", dr["ogrtKadi"].ToString());
                            Response.Redirect("~/Ogretmen.aspx");
                        }
                        else if (rbOgr.Checked)
                        {
                            Session.Add("ogrenci", dr["ogrNo"].ToString());
                            Response.Redirect("~/Ogrenci.aspx");
                        }
                        else if (rbVeli.Checked)
                        {
                            Session.Add("veli", dr["veliKadi"].ToString());
                            Response.Redirect("~/Veli.aspx");
                        }
                        else
                        {
                            giris_fail.Text = "Yönlendirme Hatası!";
                        }

                        giris_ok.Text = "Giriş Başarılı, Yönlendiriliyorsunuz...";

                        username_giris.Text = "";
                        parola_giris.Text = "";

                    }
                    else
                    {
                        giris_fail.Text = "Hatalı giriş, lütfen bilgileri kontrol ediniz!";
                    }

                }
                catch (Exception)
                {
                    giris_fail.Text = "Hatalı giriş, lütfen bilgileri kontrol ediniz!";
                }
                finally
                {
                    baglanti.Close();
                }

            }


        }

        // iletişim - mail gönderme
        protected void btnContact_Click(object sender, EventArgs e)
        {
            try
            {
                MailMessage mail = new MailMessage(); // mail adında MailMessage nesnesi yaratıyoruz.

                mail.From = new MailAddress(email.Text); //Mailin kimden gittiğini belirtiyoruz

                mail.To.Add("rcpcoban@gmail.com"); //Mailin kime gideceğini belirtiyoruz

                mail.Subject = "Öğrenci Takip Sisteminden Bir E-posta Aldınız"; //Mail konusu 

                mail.Body = message.Text + "\n\nGönderen : " + fullname.Text + "\nE-posta Adresi : " + email.Text + "\nWeb Sitesi : " + website.Text; //Mailin içeriği

                SmtpClient sc = new SmtpClient(); //sc adında SmtpClient nesnesi yaratıyoruz.

                sc.Port = 587; //Gmail için geçerli Portu bildiriyoruz
                sc.Host = "smtp.gmail.com"; //Gmailin smtp host adresini belirttik

                sc.EnableSsl = true; //SSL’i etkinleştirdik.

                sc.Credentials = new NetworkCredential("rcpcoban@gmail.com", "password"); //Gmail hesap kontrolü için bilgilerimizi girdik

                sc.Send(mail); //Mailinizi gönderiyoruz.

                contactOK.Text = "Mesajınız Başarıyla Gönderilmiştir.";

                fullname.Text = "";
                email.Text = "";
                website.Text = "";
                message.Text = "";

            }
            catch (Exception)
            {
                contactFAIL.Text = "Mesaj Gönderme Hatası!";
            }
        }

        // session çıkış
        protected void btnCikis_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect(Request.RawUrl);
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

        // Kayıt Ol - evet
        protected void btnEvet_Click(object sender, EventArgs e)
        {
            lblEvetHayir.Text = "";
            kayit_ok.Text = "";
            kayit_fail.Text = "";

            try
            {
                baglanti.Open();
                SqlCommand select = new SqlCommand("SELECT * FROM Veli WHERE veliKadi = '" + kayit_username.Text + "'", baglanti);

                int varsa = Convert.ToInt32(select.ExecuteScalar());
                if (varsa == 0)
                {
                    try
                    {
                        string sorgu = "INSERT INTO Veli VALUES(@veliAdi,@veliSoyadi,@veliKadi,@veliParola,@veliMail,@ogrNo,@veliResim)";
                        SqlCommand komut = new SqlCommand(sorgu, baglanti);
                        komut.Parameters.AddWithValue("@veliAdi", kayit_adi.Text);
                        komut.Parameters.AddWithValue("@veliSoyadi", kayit_soyadi.Text);
                        komut.Parameters.AddWithValue("@veliKadi", kayit_username.Text);
                        komut.Parameters.AddWithValue("@veliParola", MD5Olustur(kayit_parola.Text));
                        komut.Parameters.AddWithValue("@veliMail", kayit_eposta.Text);
                        komut.Parameters.AddWithValue("@ogrNo", kayit_ogrTC.Text);
                        komut.Parameters.AddWithValue("@veliResim", "../img/profil/userfoto.jpg");
                        komut.ExecuteNonQuery();
                        baglanti.Close();

                        kayit_ok.Text = "Kayıt Başarıyla Gerçekleştirildi.";

                        kayit_username.Text = "";
                        kayit_adi.Text = "";
                        kayit_soyadi.Text = "";
                        kayit_eposta.Text = "";
                        kayit_ogrTC.Text = "";
                        kayit_parola.Text = "";
                        kayit_parola_tekrar.Text = "";

                        panelEvetHayir.Visible = false;
                        panelKaydet.Visible = true;

                    }
                    catch (Exception)
                    {
                        kayit_fail.Text = "Kayıt Ekleme Başarısız!";
                    }
                }
                else
                {
                    kayit_fail.Text = "Bu Kullanıcı Adı Zaten Kullanılmaktadır!";
                }

            }
            catch (Exception)
            {
                kayit_fail.Text = "Kayıt Ekleme Başarısız!";
            }
            finally
            {
                baglanti.Close();
            }
        }

        // Kayıt Ol - hayır
        protected void btnHayir_Click(object sender, EventArgs e)
        {
            panelKaydet.Visible = true;
            panelEvetHayir.Visible = false;
            kayit_ogrTC.Text = "";
            kayit_ok.Text = "";
            lblEvetHayir.Text = "";
            kayit_fail.Text = "Lütfen Öğrenci Numarasını Yeniden Giriniz!";

        }

    }
}