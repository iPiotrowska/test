<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    <meta charset="utf-8"/>
    <title><%: Page.Title %> - Komunikator "Oryginalna nazwa"</title>
    <meta name="generator" content="Bootply" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
    <meta name="description" content="Example snippet for a Bootstrap login form modal" />
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet"/>
    
    <style type="text/css">
        .auto-style1 {
            height: 125px;
        }
        .auto-style2 {
            height: 86px;
        }
        .auto-style3 {
            width: 100%;
            height: 80px;
        }
        .auto-style4 {
            width: 249px
        }
        .auto-style5 {
            width: 39px;
        }
        .tyl{
	background-position:inherit;
    background-position-x:center;
    background-repeat:no-repeat;
	background-image: url('tlo.jpg');
    background-color:black;
}
        .auto-style6 {
            height: 409px;
        }
    </style>
    
</head>
<body class="tyl">
    <form id="form1" runat="server">
        <div class="auto-style1">
        </div>
        

        <footer>
            <div class="auto-style2">
                <table class="auto-style3">
                    <tr>
                        <td>&nbsp;</td>
                        <td class="auto-style4">&nbsp;
                            <asp:Button ID="Zal" runat="server" class="btn btn-primary btn-lg btn-block" Text="Zaloguj" OnClick="Zal_Click" />
                        </td>
                        <td class="auto-style5">&nbsp;</td>
                        <td class="auto-style4">&nbsp;
                            <asp:Button ID="Rej" runat="server" class="btn btn-primary btn-lg btn-block" Text="Zarejestruj" OnClick="Rej_Click" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>
        </footer>
    </form>
    <div class="auto-style6">
    </div>
            <p>&copy; <%: DateTime.Now.Year %> - Komunikator "Oryginalna Nazwa"</p>
        </body>
</html>
