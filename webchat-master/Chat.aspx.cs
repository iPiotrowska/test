using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class Chat : System.Web.UI.Page
{
    BazaDataContext bazaDC = new BazaDataContext();
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadChatbox();
        get_User();
        Load_Frends();
    }

    
    public void LoadChatbox()
    {
        List<Chatbox> chat = new List<Chatbox>();
        foreach(Chatbox c in bazaDC.Chatboxes)
        {
            if((c.Sender== Label1.Text && c.Reciever== Label2.Text) || (c.Sender == Label2.Text && c.Reciever == Label1.Text))
            {
                chat.Add(c);
            }
        }
        DataList3.DataSource = chat;
        DataList3.DataBind();
        ScriptManager.RegisterStartupScript(this.Page, typeof(Panel), "PanelChatContent", ";ScrollToBottom();", true);
       
    }

    public void get_User()
    {
        if (Session["Image"] == null) // jak sesja wygaśnie
        {
            Response.Redirect("Default.aspx");
        }
        Image1.ImageUrl = "~/images/" + Session["Image"].ToString();
        Label1.Text = Session["Admin"].ToString();
    }

    public void AddFriend(object sender, EventArgs e)
    {
        User u = bazaDC.Users.SingleOrDefault(x => x.UserName == tbFriend.Text);
        if(u != null)
        {
            User1 u1 = bazaDC.User1s.SingleOrDefault(x => (x.UserName1 == Label1.Text && x.UserName2 == tbFriend.Text) || (x.UserName1==tbFriend.Text && x.UserName2==Label1.Text));
            if(u1==null)
            {
                u1 = new User1
                {
                    UserName1 = Label1.Text,
                    UserName2 = tbFriend.Text
                };
                bazaDC.User1s.InsertOnSubmit(u1);
                bazaDC.SubmitChanges();
            }
        }
        else
        {
            tbFriend.Text = "User not found";
        }
        Load_Frends();
    }

    public void Unnamed_ServerClick(object sender, EventArgs e)
    {
        if (TextBox1.Text != "" || Dodawanie_pliku.PostedFile != null)
        {
            TimeSpan timeNow = DateTime.Now.TimeOfDay;
            TimeSpan trimmedTimeNow = new TimeSpan(timeNow.Hours, timeNow.Minutes, timeNow.Seconds);
            Chatbox Mess = new Chatbox
            {
                Date = DateTime.Now.Date,
                Time = trimmedTimeNow,
                ProfilePicture = Image1.ImageUrl.ToString(),
                Sender = Label1.Text,
                Reciever = Label2.Text,
                Message = TextBox1.Text
            };
            if (Dodawanie_pliku.PostedFile != null)
            {
                string ffname = Dodawanie_pliku.FileName;
                string ffpath = Server.MapPath("~/images/");
                int fflen = Dodawanie_pliku.PostedFile.ContentLength;
                string ffext = Path.GetExtension(ffname);
                ffext = ffext.ToLower();
                if (ffext == ".jpg" || ffext==".jpeg"|| ffext == ".png" || ffext == ".gif" || ffext == ".bmp")
                {
                    if (fflen != 0)
                    {
                        Dodawanie_pliku.SaveAs(ffpath + ffname);
                    }
                    Mess.Image = "~/images/" + ffname;
                }
            }
            else
            {
                Mess.Image = null;
            }
            bazaDC.Chatboxes.InsertOnSubmit(Mess);
            bazaDC.SubmitChanges();
            TextBox1.Text = "";
        }
        LoadChatbox();
    }


    public void Load_Frends()
    {
        List<User1> list = new List<User1>(); 
        foreach(var u in bazaDC.User1s)
        {
            if(u.UserName1==Label1.Text || u.UserName2==Label1.Text)
            {
                list.Add(u);
            }
        }
        List<User> list2 = new List<User>();
        foreach(var u in list)
        {
            User tmp;
            if(u.UserName1!=Label1.Text)
            {
                tmp = bazaDC.Users.SingleOrDefault(x => x.UserName == u.UserName1);
            }
            else
            {
                tmp = bazaDC.Users.SingleOrDefault(x => x.UserName == u.UserName2);
            }
            if (tmp != null)
            {
                list2.Add(tmp);
            }
        }
        DataList1.DataSource = list2;
        DataList1.DataBind();
    }

    public void LinkButton1_Click(object sender, EventArgs e)
    {
        LinkButton lBtn = sender as LinkButton;
        string id = ((LinkButton)sender).CommandArgument.ToString();
        //Label1.Text = id;
        Label2.Text = lBtn.Text;
        
        DataListItem item = (DataListItem)lBtn.NamingContainer;
        Image NameLabel = (Image)item.FindControl("Image2");
        string url = NameLabel.ImageUrl.ToString();
        Image3.ImageUrl = url;
        LoadChatbox();
    }

    public void Label2_Click(object sender, EventArgs e)
    {
        Session["Profil"] = Label2.Text;
        Session["Dostep"] = "false";
        //Response.Redirect("UserForm.aspx");
        Response.Write("<script>");
        Response.Write("window.open('UserForm.aspx','_blank')");
        Response.Write("</script>");
    }

    public void Label1_Click(object sender, EventArgs e)
    {
        Session["Profil"] = Label1.Text;
        Session["Dostep"] = "true";
        // Response.Redirect("UserForm.aspx");
        Response.Write("<script>");
        Response.Write("window.open('UserForm.aspx','_blank')");
        Response.Write("</script>");
    }

    public void Timer1_Tick(object sender, EventArgs e)
    {
        Load_Frends();
        get_User();
        LoadChatbox();
    }

    protected void Logout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Default.aspx");
    }
}