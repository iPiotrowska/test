using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Security.Cryptography;
using System.Text;

public partial class Login : System.Web.UI.Page
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

    DataSet ds, ds1;
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    
    protected void Button1_Click(object sender, EventArgs e)
    {
        BazaDataContext bazaDC = new BazaDataContext();
        string pass = MD5Hash(TextBox2.Text);
        User u = bazaDC.Users.SingleOrDefault(x => x.UserName == TextBox1.Text && x.Password == pass);
        if (u != null)
        {
            Session["Admin"] = u.UserName;
            Session["Image"] = u.Image;
            Response.Redirect("Chat.aspx");
        }
        else
        {
            Response.Write("<script>alert('Zły login lub hasło!');</script>");
        }
    }
}