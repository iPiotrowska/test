<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserForm.aspx.cs" Inherits="UserForm" %>

<!DOCTYPE html>

<html lang="en">
<head>
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Profil użytkownika</title>
    <link href="./css/bootstrap.min.css" rel="stylesheet">
    <link href="./css/messsages.css" rel="stylesheet">
    <link href="./fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <style type="text/css">
        #ms-scrollbar::-webkit-scrollbar-track {
            background-color: #CCCCCC;
        }

        #ms-scrollbar::-webkit-scrollbar {
            width: 7px;
            background-color: #F5F5F5;
        }

        #ms-scrollbar::-webkit-scrollbar-thumb {
            background-color: #eeeeee;
            -webkit-box-shadow: inset 0 0 0px rgba(0,0,0,0.3);
        }

        .ms-new {
            box-shadow: 0 2px 5px rgba(0,0,0,0.16),0 2px 10px rgba(0,0,0,0.12);
            background-color: #2196f3;
        }

    </style>
    <script src="jQuery-2.1.4.min.js"></script>

    <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type="text/javascript"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
    <script type="text/javascript">

        window.onload = function () {
            $("div.lv-body").scrollTop(10000);
        };

    </script>

    
</head>


<body>
    <form id="container" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="container-fluid">
            <div class="container ng-scope">
                <div class="block-header" style="box-shadow: 0 0 40px 1px #c9cccd;">
                    <br />
                </div>
                <div class ="card m-b-0" id="messages-main" style="box-shadow: 0 0 40px 1px ">
                        <div class="ms-menu" id="opis">
                            <h1>OPIS</h1>
                            <asp:Textbox ID="Opis1" BorderColor="Blue" placeholder="Napisz coś o sobie" Visible="false" runat="server" Width="240" Height="800" TextMode="MultiLine" ForeColor="#FF0066"></asp:Textbox>
                            <asp:Label ID="Opis" runat="server" Text="Opis użytkownika"></asp:Label>
                            <asp:RegularExpressionValidator ID="revMessageBoardContents" ControlToValidate="Opis1" Text="Wymaga max 1500 znaków" ValidationExpression="^[\s\S]{0,1500}$" runat="server"/>
                            
                            <br />
                            <h2>
                                
                                <asp:Button ID="Edycja" Visible="true" runat="server" class="btn btn-primary btn-block ms-new" OnClick="Edycja_Click" Text="Edytuj dane"  />
                                <asp:Button ID="Zapisz" Visible="false" runat="server" class="btn btn-primary btn-block ms-new" Text="Zapisz zmiany" OnClick="Zapisz_Click"  />
                            </h2>
                            
                            
                        </div>
                    <div class="ms-body">
                        <div class="ms-block" id="jakasnazwa">
                        <div id="login">
                            <h1>Użytkownik: </h1>
                            <asp:Label ID="Login" runat="server" Font-Size="XX-Large"  Text="Tutaj wyciągasz nazwę użytkownika z bazy"></asp:Label>
                        </div>

                       <div class="ms-block" id="zdjecie">
                          
                            <asp:Image ID="ZdjecieUzytownika" runat="server" Height="400" Width="600" ImageUrl='<%# Bind("Image") %>' />
                            <asp:FileUpload ID="Dodawanie_pliku" runat="server" Visible="false" />
                        </div>

                        <h1> Informacje: </h1>
                        <div id="informacje">
                            
                            <div id="email">
                                <h1>Email</h1>
                               <asp:Textbox ID="Email1"  runat="server" placeholder="Podaj email" Visible="false" Width="200"></asp:Textbox> 
                                 <asp:Label ID="Email" runat="server" Text="A tu email Email"></asp:Label>
                            </div>
                            <div id="telefon">
                                <h1>Telefon</h1>
                                 <asp:Label ID="Telefon" runat="server" Text="A tu Telefon"></asp:Label>
                             <asp:Textbox ID="Telefon1" BorderColor="Blue" placeholder="Podaj numer" Visible="false" runat="server" Width="200"></asp:Textbox> 
                            </div>
                            <div id="fb">
                                <h1>Facebook</h1>
                                 <asp:Label ID="Facebook" runat="server" Text="none"></asp:Label>
                              <asp:Textbox ID="Facebook1" BorderColor="Blue" placeholder="Podaj link" Visible="false" runat="server" Width="200"></asp:Textbox>
                            </div>
                            <div id="www">
                                <h1>Strona www</h1>
                                 <asp:Label ID="WWW" runat="server" Text="none"></asp:Label>
                                <asp:Textbox ID="WWW1" BorderColor="Blue" placeholder="Podaj link" Visible="false" runat="server" Width="200"></asp:Textbox>
                           
                            </div>
                            
                               
                            
                            <br />
                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script type="text/javascript" src="./css/jquery.js"></script>
    <script src="./css/bootstrap.min.js"></script>
</body>
</html>
