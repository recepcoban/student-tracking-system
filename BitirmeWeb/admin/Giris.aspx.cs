using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BitirmeWeb.admin
{
    public partial class Giris : System.Web.UI.Page
    {
        SqlConnection baglanti = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["DB_Bitirme"].ConnectionString);

        public object yonetici;

        // page load
        protected void Page_Load(object sender, EventArgs e)
        {
            yonetici = Session["yonetici"];
            if (yonetici != null)
            {
                Response.Redirect("Default.aspx");
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

        // yönetici girişi
        protected void btnGiris_Click(object sender, EventArgs e)
        {
            lblGirisOK.Text = "";
            lblGirisFAIL.Text = "";

            if (txtKadi.Text.Equals("") || txtParola.Text.Equals(""))
            {
                lblGirisFAIL.Text = "Boş Alan Bırakmayınız!";
            }
            else
            {

                try
                {

                    String sorgu = "SELECT * FROM Yonetici WHERE yonKadi = @kadi AND yonParola = @parola";
                    SqlCommand komut = new SqlCommand(sorgu, baglanti);
                    komut.Parameters.AddWithValue("@kadi", txtKadi.Text);
                    komut.Parameters.AddWithValue("@parola", MD5Olustur(txtParola.Text));

                    baglanti.Open();

                    SqlDataReader dr = komut.ExecuteReader();
                    if (dr.Read())
                    {
                        Session.Timeout = 20;
                        Session.Add("yonetici", dr["yonKadi"].ToString());
                        lblGirisOK.Text = "Giriş Başarılı, Yönlendiriliyorsunuz...";

                        txtKadi.Text = "";
                        txtParola.Text = "";

                        Response.Redirect("Default.aspx");

                    }
                    else
                    {
                        lblGirisFAIL.Text = "Hatalı giriş, lütfen bilgileri kontrol ediniz!";
                    }

                }
                catch (Exception)
                {
                    lblGirisFAIL.Text = "Hatalı giriş, lütfen bilgileri kontrol ediniz!";
                }
                finally
                {
                    baglanti.Close();
                }

            }
        }

    }
}