﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Zal_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }

    protected void Rej_Click(object sender, EventArgs e)
    {
        Response.Redirect("Register.aspx");
    }
}