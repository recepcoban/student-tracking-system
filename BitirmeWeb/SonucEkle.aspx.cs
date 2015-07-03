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
    public partial class SonucEkle : System.Web.UI.Page
    {
        SqlConnection baglanti = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["DB_Bitirme"].ConnectionString);

        public object ogretmen;

        // page load
        protected void Page_Load(object sender, EventArgs e)
        {
            ogretmen = Session["ogretmen"];
            if (ogretmen == null)
            {
                Response.Redirect("~/Ogretmen.aspx");
            }


            try
            {
                SqlDataAdapter adptr = new SqlDataAdapter("SELECT * FROM Sinav", baglanti);
                DataTable tbl = new DataTable();
                adptr.Fill(tbl);
                dropSinavlar.DataSource = tbl;
                dropSinavlar.DataTextField = "sinavAdi";
                dropSinavlar.DataValueField = "sinavID";
                dropSinavlar.DataBind();
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

        // sonuc ekleme
        protected void btnSonucEkle_Click(object sender, EventArgs e)
        {
            String ogrCevap = "";
            lblSonucFail.Text = "";
            if (dropSinavlar.Text.Equals("Seçiniz"))
            {
                lblSonucFail.Text = "Lütfen Sınav Seçiniz!";
            }
            else
            {
                string tarih = DateTime.Now.ToString("yyyyMMddHHmmss");
                FileUpload1.SaveAs(Request.PhysicalApplicationPath + "sinav-dosya\\" + ogretmen + "-" + tarih + "-"  +FileUpload1.FileName);

                if (FileUpload1.HasFile)
                {

                    StreamReader objReader = new StreamReader(Request.PhysicalApplicationPath + "sinav-dosya\\" + ogretmen + "-" + tarih +  "-" + FileUpload1.FileName, Encoding.GetEncoding("utf-8"));
                    string sLine = "";
                    ArrayList arrText = new ArrayList();

                    while (sLine != null)
                    {
                        sLine = objReader.ReadLine();
                        if (sLine != null)
                            arrText.Add(sLine);
                    }
                    objReader.Close();

                    for (int i = 0; i < arrText.Count / 6; i++)
                    {

                        //Dogru Yanlıs Sayısının Hesaplanması
                        baglanti.Open();
                        String cevapAnahtari = "";
                        ogrCevap = Convert.ToString(arrText[5 + i * 6]);
                        int trD = 0, trY = 0, ssD = 0, ssY = 0, mtD = 0, mtY = 0, fnD = 0, fnY = 0;
                        char[] durum = new char[160];

                        SqlCommand ca = new SqlCommand("select sinavCevap from Sinav where sinavID=" + dropSinavlar.SelectedValue, baglanti);
                        SqlDataReader mySqlResultSet = ca.ExecuteReader();

                        if (mySqlResultSet.Read())
                        {
                            cevapAnahtari = mySqlResultSet.GetString(0);
                        }
                        baglanti.Close();

                        for (int t = 0; t < 40; t++)
                        {
                            if (ogrCevap[t].Equals("N"))
                            {
                                durum[t] = 'B';
                            }
                            else
                            {
                                if (ogrCevap[t] == cevapAnahtari[t])
                                {
                                    durum[t] = 'D';
                                    trD++;
                                }
                                else
                                {
                                    durum[t] = 'Y';
                                    trY++;
                                }

                            }
                        }
                        for (int s = 40; s < 80; s++)
                        {
                            if (ogrCevap[s].Equals("N"))
                            {
                                durum[s] = 'B';
                            }
                            else
                            {
                                if (ogrCevap[s] == cevapAnahtari[s])
                                {
                                    ssD++;
                                    durum[s] = 'D';
                                }
                                else
                                {
                                    ssY++;
                                    durum[s] = 'Y';
                                }

                            }
                        }
                        for (int m = 80; m < 120; m++)
                        {
                            if (ogrCevap[m].Equals("N"))
                            {
                                durum[m] = 'B';
                            }
                            else
                            {
                                if (ogrCevap[m] == cevapAnahtari[m])
                                {
                                    mtD++;
                                    durum[m] = 'D';
                                }
                                else
                                {
                                    mtY++;
                                    durum[m] = 'Y';
                                }
                            }
                        }
                        for (int f = 120; f < 160; f++)
                        {
                            if (ogrCevap[f].Equals("N"))
                            {
                                durum[f] = 'B';
                            }
                            else
                            {
                                if (ogrCevap[f] == cevapAnahtari[f])
                                {
                                    fnD++;
                                    durum[f] = 'D';
                                }
                                else
                                {
                                    fnY++;
                                    durum[f] = 'Y';
                                }
                            }
                        }

                        float toplamNT = trD + ssD + mtD + fnD - (trY + ssY + mtY + fnY) / 4;

                        //Öğrenci ve Sınav Eklenmesi
                        try
                        {
                            baglanti.Open();
                            SqlCommand select = new SqlCommand("SELECT * FROM Ogrenci WHERE ogrNo = '" + Convert.ToInt32(arrText[0 + i * 6]) + "'", baglanti);


                            int varsa = Convert.ToInt32(select.ExecuteScalar());

                            if (varsa == 0)
                            {
                                // burası kayıt yoksa kayıt yapılacak ve sonuc eklenecek 
                                try
                                {
                                    string sorgu = "INSERT INTO Ogrenci VALUES(@ogrNo,@ogrAdi,@ogrSoyadi,@ogrTC,@ogrSinif,@ogrParola,@ogrMail,@ogrCins,@ogrSube,@ogrResim)";
                                    SqlCommand komut = new SqlCommand(sorgu, baglanti);
                                    komut.Parameters.AddWithValue("@ogrNo", Convert.ToInt32(arrText[0 + i * 6]));
                                    komut.Parameters.AddWithValue("@ogrAdi", Convert.ToString(arrText[3 + i * 6]));
                                    komut.Parameters.AddWithValue("@ogrSoyadi", Convert.ToString(arrText[4 + i * 6]));
                                    komut.Parameters.AddWithValue("@ogrTC", arrText[1 + i * 6]);
                                    komut.Parameters.AddWithValue("@ogrSinif", Convert.ToInt32(arrText[2 + i * 6]));
                                    komut.Parameters.AddWithValue("@ogrParola", MD5Olustur(Convert.ToString(arrText[1 + i * 6])));
                                    komut.Parameters.AddWithValue("@ogrMail", "");
                                    komut.Parameters.AddWithValue("@ogrCins", "");
                                    komut.Parameters.AddWithValue("@ogrSube", "");
                                    komut.Parameters.AddWithValue("@ogrResim", "../img/profil/userfoto.jpg");
                                    komut.ExecuteNonQuery();


                                    string sorgu1 = "INSERT INTO Ogrenci_Sinav VALUES(@ogrNo,@sinavID,@ogrSinif,@ogrCevap,@tarih ,@trD, @trY, @ssD, @ssY, @mtD, @mtY, @fnD, @fnY, @toplamNT)";
                                    SqlCommand komut1 = new SqlCommand(sorgu1, baglanti);
                                    komut1.Parameters.AddWithValue("@ogrNo", Convert.ToInt32(arrText[0 + i * 6]));
                                    komut1.Parameters.AddWithValue("@sinavID", dropSinavlar.SelectedValue);
                                    komut1.Parameters.AddWithValue("@ogrSinif", Convert.ToInt32(arrText[2 + i * 6]));
                                    komut1.Parameters.AddWithValue("@ogrCevap", ogrCevap);
                                    komut1.Parameters.AddWithValue("@tarih", DateTime.Now);
                                    komut1.Parameters.AddWithValue("@trD", trD);
                                    komut1.Parameters.AddWithValue("@trY", trY);
                                    komut1.Parameters.AddWithValue("@ssD", ssD);
                                    komut1.Parameters.AddWithValue("@ssY", ssY);
                                    komut1.Parameters.AddWithValue("@mtD", mtD);
                                    komut1.Parameters.AddWithValue("@mtY", mtY);
                                    komut1.Parameters.AddWithValue("@fnD", fnD);
                                    komut1.Parameters.AddWithValue("@fnY", fnY);
                                    komut1.Parameters.AddWithValue("@toplamNT", toplamNT);
                                    komut1.ExecuteNonQuery();

                                    lblSonucOk.Text = "Öğrenci Kaydı ve Sonucu Eklendi";

                                }
                                catch (Exception ex)
                                {
                                    lblSonucFail.Text = "Ekleme Başarısız! -- " + ex;
                                }
                                finally
                                {
                                    baglanti.Close();
                                }
                            }
                            else
                            {
                                // kayıt varsa sadece sonuc eklenecek
                                string sorgu1 = "INSERT INTO Ogrenci_Sinav VALUES(@ogrNo,@sinavID,@ogrSinif,@ogrCevap,@tarih ,@trD, @trY, @ssD, @ssY, @mtD, @mtY, @fnD, @fnY, @toplamNT)";
                                SqlCommand komut1 = new SqlCommand(sorgu1, baglanti);
                                komut1.Parameters.AddWithValue("@ogrNo", Convert.ToInt32(arrText[0 + i * 6]));
                                komut1.Parameters.AddWithValue("@sinavID", dropSinavlar.SelectedValue);
                                komut1.Parameters.AddWithValue("@ogrSinif", Convert.ToInt32(arrText[2 + i * 6]));
                                komut1.Parameters.AddWithValue("@ogrCevap", ogrCevap);
                                komut1.Parameters.AddWithValue("@tarih", DateTime.Now);
                                komut1.Parameters.AddWithValue("@trD", trD);
                                komut1.Parameters.AddWithValue("@trY", trY);
                                komut1.Parameters.AddWithValue("@ssD", ssD);
                                komut1.Parameters.AddWithValue("@ssY", ssY);
                                komut1.Parameters.AddWithValue("@mtD", mtD);
                                komut1.Parameters.AddWithValue("@mtY", mtY);
                                komut1.Parameters.AddWithValue("@fnD", fnD);
                                komut1.Parameters.AddWithValue("@fnY", fnY);
                                komut1.Parameters.AddWithValue("@toplamNT", toplamNT);
                                komut1.ExecuteNonQuery();

                                lblSonucOk.Text = "Öğrenci Sonucu Eklendi";
                            }

                        }
                        catch (Exception ex)
                        {
                            lblSonucFail.Text = "Ekleme Başarısız! : " + ex;
                        }
                        finally
                        {
                            baglanti.Close();
                        }

                    }
                }
                else
                {
                    lblSonucFail.Text = "Dosya Seçilmedi!";
                }
            }


            dropSinavlar.Items.Clear();
            dropSinavlar.Items.Add("Seçiniz");

            try
            {
                SqlDataAdapter adptr = new SqlDataAdapter("SELECT * FROM Sinav", baglanti);
                DataTable tbl = new DataTable();
                adptr.Fill(tbl);
                dropSinavlar.DataSource = tbl;
                dropSinavlar.DataTextField = "sinavAdi";
                dropSinavlar.DataValueField = "sinavID";
                dropSinavlar.DataBind();
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
    }
}