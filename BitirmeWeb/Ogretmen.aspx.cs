using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BitirmeWeb
{
    public partial class Ogretmen : System.Web.UI.Page
    {
        SqlConnection baglanti = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["DB_Bitirme"].ConnectionString);

        public object ogretmen;

        // page load
        protected void Page_Load(object sender, EventArgs e)
        {

            GridView1.Attributes.Add("style", "word-break:break-all;word-wrap:break-word");

            ogretmen = Session["ogretmen"];
            if (ogretmen == null)
            {
                Response.Redirect("~/Default.aspx");
            }
            else
            {
                try
                {
                    string sorgu1 = "SELECT * FROM Ogretmen WHERE ogrtKadi = @kadi";
                    SqlCommand komut1 = new SqlCommand(sorgu1, baglanti);
                    komut1.Parameters.AddWithValue("@kadi", ogretmen);

                    baglanti.Open();

                    SqlDataReader dr1 = komut1.ExecuteReader();

                    if (dr1.Read())
                    {
                        // profil
                        imgProfilResim.ImageUrl = dr1["ogrtResim"].ToString();
                        lblID.Text = dr1["ogrtID"].ToString();
                        lblAdi.Text = dr1["ogrtAdi"].ToString();
                        lblSoyadi.Text = dr1["ogrtSoyadi"].ToString();
                        lblKadi.Text = dr1["ogrtKadi"].ToString();
                        lblEposta.Text = dr1["ogrtMail"].ToString();
                        lblDersID.Text = dr1["dersID"].ToString();

                        lblSession.Text = "Hoşgeldin, " + dr1["ogrtAdi"].ToString() + " " + dr1["ogrtSoyadi"].ToString();
                    }
                    else
                    {
                        lblID.Text = "Hatalı erişim!";
                        lblAdi.Text = "Hatalı erişim!";
                        lblSoyadi.Text = "Hatalı erişim!";
                        lblKadi.Text = "Hatalı erişim!";
                        lblEposta.Text = "Hatalı erişim!";
                        lblDersID.Text = "Hatalı erişim!";
                    }
                }
                catch (Exception)
                {
                    lblID.Text = "Hatalı erişim!";
                    lblAdi.Text = "Hatalı erişim!";
                    lblSoyadi.Text = "Hatalı erişim!";
                    lblKadi.Text = "Hatalı erişim!";
                    lblEposta.Text = "Hatalı erişim!";
                    lblDersID.Text = "Hatalı erişim!";
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
                // Tüm Veliler
                string sorgu33 = "SELECT * FROM Veli ORDER BY veliID";
                SqlCommand komut33 = new SqlCommand(sorgu33, baglanti);
                baglanti.Open();
                SqlDataReader dr33 = komut33.ExecuteReader();
                lstVeliler.DataSource = dr33;
                lstVeliler.DataBind();

            }
            catch (Exception)
            {

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
                string sorgu2 = "UPDATE Ogretmen SET ogrtParola = @ogrtParola, ogrtMail = @ogrtMail WHERE ogrtKadi = @ogrtKadi";
                SqlCommand komut2 = new SqlCommand(sorgu2, baglanti);
                komut2.Parameters.AddWithValue("@ogrtKadi", ogretmen);
                komut2.Parameters.AddWithValue("@ogrtMail", txtAyarEposta.Text);
                komut2.Parameters.AddWithValue("@ogrtParola", MD5Olustur(txtAyarParola.Text));

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
                string sorgu1 = "SELECT * FROM Ogretmen WHERE ogrtKadi = @kadi";
                SqlCommand komut1 = new SqlCommand(sorgu1, baglanti);
                komut1.Parameters.AddWithValue("@kadi", ogretmen);

                baglanti.Open();

                SqlDataReader dr1 = komut1.ExecuteReader();

                if (dr1.Read())
                {
                    // ayarlar
                    txtAyarID.Text = dr1["ogrtID"].ToString();
                    txtAyarAdi.Text = dr1["ogrtAdi"].ToString();
                    txtAyarSoyadi.Text = dr1["ogrtSoyadi"].ToString();
                    txtAyarKadi.Text = dr1["ogrtKadi"].ToString();
                    txtAyarEposta.Text = dr1["ogrtMail"].ToString();
                    txtAyarDersID.Text = dr1["dersID"].ToString();
                }
                else
                {
                    txtAyarID.Text = "Kayıt Bulunamadı!";
                    txtAyarAdi.Text = "Kayıt Bulunamadı!";
                    txtAyarSoyadi.Text = "Kayıt Bulunamadı!";
                    txtAyarKadi.Text = "Kayıt Bulunamadı!";
                    txtAyarEposta.Text = "Kayıt Bulunamadı!";
                    txtAyarDersID.Text = "Kayıt Bulunamadı!";
                }

            }
            catch (Exception)
            {
                txtAyarID.Text = "Hatalı erişim!";
                txtAyarAdi.Text = "Hatalı erişim!";
                txtAyarSoyadi.Text = "Hatalı erişim!";
                txtAyarKadi.Text = "Hatalı erişim!";
                txtAyarEposta.Text = "Hatalı erişim!";
                txtAyarDersID.Text = "Hatalı erişim!";

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

        // sinav ekle
        protected void btnSinavEkle_Click(object sender, EventArgs e)
        {

            lblSinavOK.Text = "";
            lblSinavFAIL.Text = "";

            try
            {
                baglanti.Open();
                SqlCommand select = new SqlCommand("SELECT * FROM Sinav WHERE sinavAdi = '" + txtSinavAdi.Text + "'", baglanti);
                int varsa = Convert.ToInt32(select.ExecuteScalar());
                if (varsa == 0)
                {
                    try
                    {
                        string sorgu = "INSERT INTO Sinav VALUES(@sinavAdi,@sinavCevap)";
                        SqlCommand komut = new SqlCommand(sorgu, baglanti);
                        komut.Parameters.AddWithValue("@sinavAdi", txtSinavAdi.Text);
                        komut.Parameters.AddWithValue("@sinavCevap", txtSinavCevap.Text);
                        komut.ExecuteNonQuery();
                        baglanti.Close();
                        lblSinavOK.Text = "Kayıt Başarıyla Gerçekleştirildi.";
                        GridView1.DataBind();
                        txtSinavAdi.Text = "";
                        txtSinavCevap.Text = "";
                    }
                    catch (Exception)
                    {
                        lblSinavFAIL.Text = "Kayıt Ekleme Başarısız!";
                    }
                    finally
                    {
                        baglanti.Close();
                    }
                }
                else
                {
                    lblSinavFAIL.Text = "Bu Sınav Zaten Kayıtlıdır!";
                }
            }
            catch (Exception)
            {
                lblSinavFAIL.Text = "Kayıt Ekleme Başarısız!";
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

        // veli arama
        protected void btnVeliAra_Click(object sender, EventArgs e)
        {
            try
            {
                string sorgu33 = "SELECT * FROM Veli WHERE veliAdi LIKE '%" + txtVeliAra.Text + "%'";
                SqlCommand komut33 = new SqlCommand(sorgu33, baglanti);
                baglanti.Open();
                SqlDataReader dr33 = komut33.ExecuteReader();
                lstVeliler.DataSource = dr33;
                lstVeliler.DataBind();

            }
            catch (Exception)
            {

            }
            finally
            {
                baglanti.Close();
            }
        }

        // sinav secme - duzenleme
        string sinavId;
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            panelCevapAnahtariDegisiklik.Visible = true;

            sinavId = GridView1.SelectedRow.Cells[0].Text;
            string sinavAdi = GridView1.SelectedRow.Cells[1].Text;

            lblgizli.Text = sinavId;
            lblsinavId.Text = "Sınav ID : " + sinavId;
            lblsinavAdi.Text = "Sınav Adı : " + sinavAdi;
        }

        // sınav cevap anahtarı degısıklık
        protected void btnDegistir_Click(object sender, EventArgs e)
        {
            lblSinavOK.Text = "";
            lblSinavFAIL.Text = "";

            if (txtSoruNo.Text.Equals("") || dropDogruCevap.Text.Equals("Doğru Cevap Seçiniz"))
            {
                lblSinavFAIL.Text = "Lütfen Soru Numarası Giriniz ve/veya Doğru Cevap Seçiniz!";
            }
            else
            {
                String cevapAnahtari = "";
                baglanti.Open();
                try
                {
                    string sorguCevapAl = "SELECT sinavCevap FROM Sinav WHERE sinavID =" + lblgizli.Text;
                    SqlCommand komutCevapAl = new SqlCommand(sorguCevapAl, baglanti);

                    SqlDataReader dr1 = komutCevapAl.ExecuteReader();

                    if (dr1.Read())
                    {
                        cevapAnahtari = dr1["sinavCevap"].ToString();
                    }
                    else
                    {
                    }

                }
                catch (Exception)
                {

                }
                finally
                {
                    baglanti.Close();
                }




                // Cevap Anahtarının Değiştirip Vt ye kayıp
                int soruNo = 0;

                soruNo = Convert.ToInt32(txtSoruNo.Text);
                char[] array3 = new char[160];

                array3 = cevapAnahtari.ToCharArray();
                array3[soruNo - 1] = Convert.ToChar(dropDogruCevap.Text);

                String cevapAnahtariGuncel = new String(array3);

                // Vt Ekleme

                try
                {
                    string sorgu2 = "UPDATE Sinav SET sinavCevap = @sinavCevap WHERE sinavID = @sinavID";
                    SqlCommand komut2 = new SqlCommand(sorgu2, baglanti);
                    komut2.Parameters.AddWithValue("@sinavCevap", cevapAnahtariGuncel);
                    komut2.Parameters.AddWithValue("@sinavID", lblgizli.Text);

                    baglanti.Open();

                    int durum = komut2.ExecuteNonQuery();
                    if (durum == 1)
                    {
                        lblSinavOK.Text = "Güncelleme işlemi başarıyla gerçekleştirildi.";
                        GridView1.DataBind();
                        lblsinavId.Text = "";
                        lblsinavAdi.Text = "";
                        txtSoruNo.Text = "";
                        dropDogruCevap.SelectedIndex = 0;
                    }
                    else
                    {
                        lblSinavFAIL.Text = "Güncelleme işlemi başarısız!";
                    }

                }
                catch (Exception ex)
                {
                    lblSinavFAIL.Text = "Hata : " + ex;
                }
                finally
                {
                    baglanti.Close();
                }
            }


        }


    }
}