using System;
using System.Linq;
using System.Text;
using System.IO;
using System.Security.Cryptography;

public partial class Register : System.Web.UI.Page
{
    public static string MD5Hash(string input)
    {
        StringBuilder hash = new StringBuilder();
        MD5CryptoServiceProvider md5provider = new MD5CryptoServiceProvider();
        byte[] bytes = md5provider.ComputeHash(new UTF8Encoding().GetBytes(input));

        for (int i = 0; i < bytes.Length; i++)
        {
            hash.Append(bytes[i].ToString("x2"));
        }
        return hash.ToString();
    }



    BazaDataContext bazaDC = new BazaDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (FileUpload1.PostedFile != null)
        {
            string fname = FileUpload1.FileName;
            string fpath = Server.MapPath("~/images/");
            int flen = FileUpload1.PostedFile.ContentLength;
            string fext = Path.GetExtension(fname);
            fext = fext.ToLower();
        
            if (flen < 1048576)
            {
                if (fext == ".jpg"|| fext == ".jpeg" || fext == ".png" || fext == ".gif" || fext == ".bmp" || flen == 0)
                {
                    if (flen != 0)
                    {
                        FileUpload1.SaveAs(fpath + fname);
                    }
                    else
                    {
                        fname = "pop1.png"; //domyslny obrazek
                    }
                    string pass = MD5Hash(TextBox2.Text);

                    User tmp = bazaDC.Users.SingleOrDefault(x => x.UserName == TextBox1.Text);
                    if (tmp == null)
                    {
                        User user = new User
                        {
                            UserName = TextBox1.Text,
                            Password = pass,
                            Image = fname,
                            Description = "none",
                            Mail = "none",
                            Phone = 0,
                            Facebook = "none",
                            Page = "none"
                        };

                        bazaDC.Users.InsertOnSubmit(user);
                        bazaDC.SubmitChanges();


                        if (bazaDC.Users.Contains(user))
                        {
                            TextBox1.Text = "";
                            TextBox2.Text = "";
                            TextBox3.Text = "";
                            Response.Redirect("Login.aspx");
                        }
                        else
                        {
                            Response.Write("<script>alert('Rejestracja się nie udała. Spróbuj ponownie.');</script>");
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Podana nazwa użytkownika jest już zajęta. Wybierz inną.');</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Tylko zdjęcia są dopuszczane!');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Maksymalny dopuszczalny rozmiar zdjęć to 1 MB');</script>");
            }
            
        }
    }

}

