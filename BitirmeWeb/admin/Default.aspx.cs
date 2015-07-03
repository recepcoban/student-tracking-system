using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BitirmeWeb.admin
{
    public partial class Default : System.Web.UI.Page
    {
        SqlConnection baglanti = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["DB_Bitirme"].ConnectionString);

        public object yonetici;

        // page load
        protected void Page_Load(object sender, EventArgs e)
        {
            yonetici = Session["yonetici"];

            if (yonetici == null)
            {
                Response.Redirect("Giris.aspx");
            }
            else
            {
                lblSession.Text = "Hoşgeldin, " + yonetici.ToString();

                if (!IsPostBack)
                {
                    try
                    {
                        string sorgu1 = "SELECT * FROM Yonetici WHERE yonKadi = @kadi";
                        SqlCommand komut1 = new SqlCommand(sorgu1, baglanti);
                        komut1.Parameters.AddWithValue("@kadi", yonetici);

                        baglanti.Open();

                        SqlDataReader dr1 = komut1.ExecuteReader();

                        if (dr1.Read())
                        {
                            // profil
                            imgProfilResim.ImageUrl = dr1["yonResim"].ToString();
                            lblID.Text = dr1["yonID"].ToString();
                            lblAdi.Text = dr1["yonAdi"].ToString();
                            lblSoyadi.Text = dr1["yonSoyadi"].ToString();
                            lblKadi.Text = dr1["yonKadi"].ToString();
                            lblEposta.Text = dr1["yonMail"].ToString();
                        }
                        else
                        {
                            lblID.Text = "Hatalı erişim!";
                            lblAdi.Text = "Hatalı erişim!";
                            lblSoyadi.Text = "Hatalı erişim!";
                            lblKadi.Text = "Hatalı erişim!";
                            lblEposta.Text = "Hatalı erişim!";
                        }

                    }
                    catch (Exception)
                    {
                        lblID.Text = "Hatalı erişim!";
                        lblAdi.Text = "Hatalı erişim!";
                        lblSoyadi.Text = "Hatalı erişim!";
                        lblKadi.Text = "Hatalı erişim!";
                        lblEposta.Text = "Hatalı erişim!";

                    }
                    finally
                    {
                        baglanti.Close();
                    }

                    SqlDataAdapter adptr = new SqlDataAdapter("SELECT * FROM Ders", baglanti);
                    DataTable tbl = new DataTable();
                    adptr.Fill(tbl);
                    drOgrtDersID.DataSource = tbl;
                    drOgrtDersID.DataTextField = "dersAdi";
                    drOgrtDersID.DataValueField = "dersID";
                    drOgrtDersID.DataBind();

                    try
                    {
                        // Tüm Yöneticiler
                        string sorgu2 = "SELECT * FROM Yonetici ORDER BY yonID";
                        SqlCommand komut2 = new SqlCommand(sorgu2, baglanti);
                        baglanti.Open();
                        SqlDataReader dr2 = komut2.ExecuteReader();
                        lstYonetici.DataSource = dr2;
                        lstYonetici.DataBind();

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

        // session sonlandırma
        protected void lnkCikis_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Giris.aspx");
        }

        // ders ekleme
        protected void btnDersEkle_Click(object sender, EventArgs e)
        {
            try
            {
                lblDersOK.Text = "";
                lblDersFAIL.Text = "";

                baglanti.Open();
                SqlCommand select = new SqlCommand("SELECT * FROM Ders WHERE dersAdi = '" + txtDersAdi.Text + "'", baglanti);

                int varsa = Convert.ToInt32(select.ExecuteScalar());
                if (varsa == 0)
                {
                    try
                    {
                        string sorgu = "INSERT INTO Ders (dersAdi) VALUES(@dersAdi)";
                        SqlCommand komut = new SqlCommand(sorgu, baglanti);
                        komut.Parameters.AddWithValue("@dersAdi", txtDersAdi.Text);
                        komut.ExecuteNonQuery();
                        baglanti.Close();

                        lblDersOK.Text = "Kayıt Başarıyla Gerçekleştirildi.";
                        GridView2.DataBind();
                        txtDersAdi.Text = "";
                    }
                    catch (Exception)
                    {
                        lblDersFAIL.Text = "Kayıt Ekleme Başarısız!";
                    }
                    finally
                    {
                        baglanti.Close();
                    }
                }
                else
                {
                    lblDersFAIL.Text = "Bu Ders Zaten Kayıtlıdır!";
                }

            }
            catch (Exception)
            {
                lblDersFAIL.Text = "Kayıt Ekleme Başarısız!";
            }
            finally
            {
                baglanti.Close();
            }
        }

        // ayarlar
        protected void btnBilgiGetir_Click(object sender, EventArgs e)
        {
            try
            {
                string sorgu1 = "SELECT * FROM Yonetici WHERE yonKadi = @kadi";
                SqlCommand komut1 = new SqlCommand(sorgu1, baglanti);
                komut1.Parameters.AddWithValue("@kadi", yonetici);

                baglanti.Open();

                SqlDataReader dr1 = komut1.ExecuteReader();

                if (dr1.Read())
                {
                    // ayarlar
                    txtAyarID.Text = dr1["yonID"].ToString();
                    txtAyarAdi.Text = dr1["yonAdi"].ToString();
                    txtAyarSoyadi.Text = dr1["yonSoyadi"].ToString();
                    txtAyarKadi.Text = dr1["yonKadi"].ToString();
                    txtAyarEposta.Text = dr1["yonMail"].ToString();
                }
                else
                {
                    txtAyarID.Text = "Kayıt Bulunamadı!";
                    txtAyarAdi.Text = "Kayıt Bulunamadı!";
                    txtAyarSoyadi.Text = "Kayıt Bulunamadı!";
                    txtAyarKadi.Text = "Kayıt Bulunamadı!";
                    txtAyarEposta.Text = "Kayıt Bulunamadı!";
                }

            }
            catch (Exception)
            {
                txtAyarID.Text = "Hatalı erişim!";
                txtAyarAdi.Text = "Hatalı erişim!";
                txtAyarSoyadi.Text = "Hatalı erişim!";
                txtAyarKadi.Text = "Hatalı erişim!";
                txtAyarEposta.Text = "Hatalı erişim!";


            }
            finally
            {
                baglanti.Close();
            }
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

        // öğretmen ekleme
        protected void btnOgrtKaydet_Click(object sender, EventArgs e)
        {
            Random rnd = new Random();
            string parola = rnd.Next(100000, 999999).ToString();

            try
            {
                lblOgrtOK.Text = "";
                lblOgrtFAIL.Text = "";

                baglanti.Open();
                SqlCommand select = new SqlCommand("SELECT * FROM Ogretmen WHERE ogrtKadi = '" + txtOgrtKadi.Text + "'", baglanti);

                int varsa = Convert.ToInt32(select.ExecuteScalar());
                if (varsa == 0)
                {
                    try
                    {
                        string sorgu = "INSERT INTO Ogretmen (ogrtAdi,ogrtSoyadi,ogrtKadi,ogrtMail,ogrtParola,dersID) VALUES(@ogrtAdi,@ogrtSoyadi,@ogrtKadi,@ogrtMail,@ogrtParola,@dersID)";
                        SqlCommand komut = new SqlCommand(sorgu, baglanti);
                        komut.Parameters.AddWithValue("@ogrtAdi", txtOgrtAdi.Text);
                        komut.Parameters.AddWithValue("@ogrtSoyadi", txtOgrtSoyadi.Text);
                        komut.Parameters.AddWithValue("@ogrtKadi", txtOgrtKadi.Text);
                        komut.Parameters.AddWithValue("@ogrtMail", txtOgrtMail.Text);
                        komut.Parameters.AddWithValue("@ogrtParola", MD5Olustur(parola));
                        komut.Parameters.AddWithValue("@dersID", drOgrtDersID.SelectedValue);
                        komut.ExecuteNonQuery();
                        baglanti.Close();

                        // öğretmene mail atma - baş

                        try
                        {
                            MailMessage mail = new MailMessage(); // mail adında MailMessage nesnesi yaratıyoruz.

                            mail.From = new MailAddress(lblEposta.Text); //Mailin kimden gittiğini belirtiyoruz

                            mail.To.Add(txtOgrtMail.Text); //Mailin kime gideceğini belirtiyoruz

                            mail.Subject = "Hesabınız Oluşturuldu - Öğrenci Takip Sistemi"; //Mail konusu 

                            mail.Body = "Adı : " + txtOgrtAdi.Text + "\nSoyadı : " + txtOgrtSoyadi.Text + "\nKullanıcı Adı : " + txtOgrtKadi.Text + "\nParola : " + parola; //Mailin içeriği

                            SmtpClient sc = new SmtpClient(); //sc adında SmtpClient nesnesi yaratıyoruz.

                            sc.Port = 587; //Gmail için geçerli Portu bildiriyoruz
                            sc.Host = "smtp.gmail.com"; //Gmailin smtp host adresini belirttik

                            sc.EnableSsl = true; //SSL’i etkinleştirdik.

                            sc.Credentials = new NetworkCredential("rcpcoban@gmail.com", "password"); //Gmail hesap kontrolü için bilgilerimizi girdik

                            sc.Send(mail); //Mailinizi gönderiyoruz.

                        }
                        catch (Exception)
                        {
                            lblOgrtFAIL.Text = "E-posta Gönderilemedi!";
                        }
                        // öğretmene mail atma - son

                        lblOgrtOK.Text = "Kayıt Başarıyla Gerçekleştirildi.";

                        txtOgrtAdi.Text = "";
                        txtOgrtSoyadi.Text = "";
                        txtOgrtKadi.Text = "";
                        txtOgrtMail.Text = "";
                        drOgrtDersID.SelectedIndex = 0;
                        GridView1.DataBind();

                    }
                    catch (Exception)
                    {
                        lblOgrtFAIL.Text = "Kayıt Ekleme Başarısız!";
                    }
                    finally
                    {
                        baglanti.Close();
                    }
                }
                else
                {
                    lblOgrtFAIL.Text = "Bu Öğretmen Zaten Kayıtlıdır!";
                }

            }
            catch (Exception)
            {
                lblOgrtFAIL.Text = "Kayıt Ekleme Başarısız!";
            }
            finally
            {
                baglanti.Close();
            }
        }

        // ayarları güncelleme
        protected void btnGuncelle_Click(object sender, EventArgs e)
        {
            try
            {
                string sorgu2 = "UPDATE Yonetici SET yonMail = @yonMail, yonParola = @yonParola WHERE yonKadi = @yonKadi";
                SqlCommand komut2 = new SqlCommand(sorgu2, baglanti);
                komut2.Parameters.AddWithValue("@yonKadi", yonetici);
                komut2.Parameters.AddWithValue("@yonMail", txtAyarEposta.Text);
                komut2.Parameters.AddWithValue("@yonParola", MD5Olustur(txtAyarParola.Text));

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

                txtAyarID.Text = "";
                txtAyarAdi.Text = "";
                txtAyarSoyadi.Text = "";
                txtAyarKadi.Text = "";
                txtAyarEposta.Text = "";
                txtAyarParola.Text = "";
                txtAyarParolaTekrar.Text = "";
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

    }
}