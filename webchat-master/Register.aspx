<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <title>Rejestracja</title>
    <meta name="generator" content="Bootply" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="description" content="Example snippet for a Bootstrap login form modal" />
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div id="loginModal" class="modal show" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="text-center">Rejestracja</h1>
                </div>
                <div class="modal-body">
                    <form runat="server" class="form col-md-12 center-block">
                        <div class="form-group">

                            <asp:TextBox ID="TextBox1" class="form-control input-lg" placeholder="Podaj nazwę użytkownika" runat="server"></asp:TextBox>
                                    
                        <div style="height: 20px; width: 222px">
                            
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="  Uzupełnij nazwę użytkownika" ForeColor="Red"></asp:RequiredFieldValidator>
                            
                        </div>
                                    
                        </div>
                        <div class="form-group">

                            <asp:TextBox ID="TextBox2" TextMode="Password" class="form-control input-lg" placeholder="Podaj hasło" runat="server" ToolTip="Hasło musi mieć przynajmniej 6 znaków"></asp:TextBox>
                            
                        <div>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Uzupełnij hasło" ForeColor="Red"></asp:RequiredFieldValidator>
                            
                            
                            
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            
                            
                            <asp:RegularExpressionValidator ID="ValidatorPassword" runat="server"     
                                    ErrorMessage="Hasło musi mieć przynajmniej 6 znaków" 
                                    ControlToValidate="TextBox2"     
                                    ValidationExpression="^([\S\s]{6,50})" ForeColor="Red" />
                            

                        </div>

                        </div>

                        <div class="form-group">

                            <asp:TextBox ID="TextBox3" TextMode="Password" class="form-control input-lg" placeholder="Potwierdź hasło" runat="server" ToolTip="Powtórz hasło"></asp:TextBox>
                        <div>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="Uzupełnij hasło" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox2" ControlToValidate="TextBox3" ErrorMessage="Hasła nie są identyczne" ForeColor="Red"></asp:CompareValidator>

                        </div>

                        </div>

                        <div class="form-group">

                            <asp:FileUpload ID="FileUpload1" runat="server"/>
                        </div>
                        <div class="form-group">

                            <asp:Button ID="Button1" runat="server" class="btn btn-primary btn-lg btn-block" Text="Zarejestruj" OnClick="Button1_Click" />
                            <span class="pull-right"><a href="Login.aspx">Zaloguj</a></span>
                            <span class="pull-left"><a href="Default.aspx">Strona główna</a></span>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <div class="col-md-12">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type='text/javascript' src="//ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script type='text/javascript' src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
</body>
</html>