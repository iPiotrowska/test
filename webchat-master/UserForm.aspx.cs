using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserForm : System.Web.UI.Page
{
        BazaDataContext bazaDC = new BazaDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Dostep"] == null)
        {
            Response.Redirect("Chat.aspx");
        }
        if(Session["Dostep"].ToString() == "false")
        {
            Edycja.Visible = false;
        }
        string profil = Session["Profil"].ToString();
        User u = bazaDC.Users.SingleOrDefault(x => x.UserName == profil);
        if(u!=null)
        {
            Login.Text = u.UserName;
            ZdjecieUzytownika.ImageUrl = "~/images/" + u.Image;
            Opis.Text = u.Description;
            Email.Text = u.Mail;
            Telefon.Text = (u.Phone).ToString();
            WWW.Text = u.Page;
            Facebook.Text = u.Facebook;
        }

    }

    protected void Edycja_Click(object sender, EventArgs e)
    {
        Zapisz.Visible = true;
        Opis1.Visible = true;
        Opis.Visible = false;
        Email.Visible = false;
        Email1.Visible = true;
        Telefon.Visible = false;
        Telefon1.Visible = true;
        WWW.Visible = false;
        WWW1.Visible = true;
        Facebook.Visible = false;
        Facebook1.Visible = true;
        Dodawanie_pliku.Visible = true;
        Edycja.Visible = false;

        User u = bazaDC.Users.SingleOrDefault(x => x.UserName == Login.Text);
        if(u!=null)
        {
            Opis1.Text = u.Description;
            Email1.Text = u.Mail;
            Telefon1.Text = (u.Phone).ToString();
            WWW1.Text = u.Page;
            Facebook1.Text = u.Facebook;
        }
    }

    protected void Zapisz_Click(object sender, EventArgs e)
    {
        User u = bazaDC.Users.SingleOrDefault(x => x.UserName == Login.Text);

        if (Opis1.Text!="")
        {
            u.Description = Opis1.Text;
        }
        else
        {
            u.Description = "none";
        }
        if (Email1.Text != "")
        {
            u.Mail = Email1.Text;
        }
        else
        {
            u.Mail = "none";
        }
        if (Telefon1.Text != "")
        {
            int a;
            if(Int32.TryParse(Telefon1.Text,out a))
            {
                 u.Phone = a;
            }
            else
            {
                u.Phone = 0;
            }
        }
        else
        {
            u.Phone = 0;
        }
        if (WWW1.Text != "")
        {
            u.Page = WWW1.Text;
        }
        else
        {
            u.Page = "none";
        }
        if (Facebook1.Text != "")
        {
            u.Facebook = Facebook1.Text;
        }
        else
        {
            u.Facebook = "none";
        }

        if (Dodawanie_pliku.PostedFile != null)
        {
            string ffname = Dodawanie_pliku.FileName;
            string ffpath = Server.MapPath("~/images/");
            int fflen = Dodawanie_pliku.PostedFile.ContentLength;
            string ffext = Path.GetExtension(ffname);
            ffext = ffext.ToLower();
            if (ffext == ".jpg" || ffext == ".png" || ffext == ".gif" || ffext == ".bmp")
            {
                if (fflen != 0)
                {
                    Dodawanie_pliku.SaveAs(ffpath + ffname);
                    u.Image = ffname;
                }
            }
        }


        bazaDC.SubmitChanges();

        Zapisz.Visible = false;
        Opis1.Visible = false;
        Opis.Visible = true;
        Email.Visible = true;
        Email1.Visible = false;
        Telefon.Visible = true;
        Telefon1.Visible = false;
        WWW.Visible = true;
        WWW1.Visible = false;
        Facebook.Visible = true;
        Facebook1.Visible = false;
        Dodawanie_pliku.Visible = false;
        Edycja.Visible = true;
        Page_Load(null, null);
    }
}