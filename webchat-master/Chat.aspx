<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Chat.aspx.cs" Inherits="Chat" %>


<!DOCTYPE html>

<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Chat</title>
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
        a.imjusttext{ color: #000000; text-decoration: none; }
        a.imjusttext:hover { text-decoration: none; }

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

    <script>
    function runScript(e) {
        if (e.keyCode == 13) {
            $("#Send").click(); //jquery
            document.getElementById("Send").click(); //javascript
        }
        
    }
    </script>

</head>
<body>
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
         <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="1000" Enabled="True" ClientIDMode="Inherit"> </asp:Timer>
        <div class="container-fluid">
            <div class="container ng-scope">
                <div class="block-header" style="box-shadow: 0 0 40px 1px #c9cccd;">
                    <br />

                </div>
                <div class="card m-b-0" id="messages-main" style="box-shadow: 0 0 40px 1px ">
                    <div class="ms-menu" style="overflow: scroll; overflow-x: hidden;" id="ms-scrollbar">
                        <div class="ms-block">
                            <div class="ms-user">
                                <asp:Image ID="Image1" runat="server" Height="50" Width="50" ImageUrl='<%# Bind("Image") %>' />
                                
                                <h5 class="q-title">
                                    
                                   <br /> 
                                    <asp:LinkButton ID="Label1" runat="server" CssClass="imjusttext" OnClick="Label1_Click" > </asp:LinkButton>
                                </h5>
                                <br />
                                <h2>
                                    <asp:Button ID="Logout" runat="server" class="btn btn-primary btn-block ms-new" Text="Wyloguj" OnClick="Logout_Click" />
                                </h2>
                            </div>

                            


                        </div>
                        <div class="ms-block">
                            <asp:TextBox ID="tbFriend" BorderColor="White" placeholder="Write login" runat="server" AutoCompleteType="Disabled" Width="182" ></asp:TextBox>
                            <asp:Button ID="bAdd" runat="server" class="btn btn-primary btn-block ms-new" Height="30" Text="Dodaj znajomego" OnClick="AddFriend"  /> <!-- dodany button on friendsów -->
                        </div>
                        <hr />
                        <div class="listview lv-user m-t-20">
                            <asp:DataList ID="DataList1" runat="server">
                                <ItemTemplate>
                                    <div class="lv-item media">
                                        <div class="lv-avatar pull-left">

                                            <asp:Image ID="Image2" runat="server" ImageUrl='<%# Bind("Image","~/images/{0}") %>' />
                                        </div>
                                        <div class="media-body">
                                            <div class="lv-title">

                                                <asp:LinkButton ID="LinkButton1" ForeColor="Black" runat="server" Text='<%# Bind("UserName") %>' OnClick="LinkButton1_Click"></asp:LinkButton>

                                            </div>
                                        </div>
                                </ItemTemplate>
                            </asp:DataList>


                        </div>
                    </div>
                    <div class="ms-body">
                        <div class="listview lv-message">
                            <div class="lv-header-alt clearfix">
                                <div id="ms-menu-trigger">
                                    <div class="line-wrap">
                                        <div class="line top">
                                        </div>
                                        <div class="line center"></div>
                                        <div class="line bottom"></div>
                                    </div>
                                </div>
                                <div class="lvh-label hidden-xs">
                                    <div class="lv-avatar pull-left">

                                        <asp:Image ID="Image3" runat="server" ImageUrl='<%# Bind("Image","~/images/{0}") %>' />
                                    </div>
                                    <span class="c-black">
                                        <asp:LinkButton ID="Label2" runat="server" CssClass="imjusttext" OnClick="Label2_Click" > </asp:LinkButton></span>
                                </div>

                            </div>
                            
                            <div class="lv-body" id="ms-scrollbar1" style="overflow: scroll; overflow-x: hidden; height: 520px;">

                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="Timer1" />
                                    </Triggers>
                                    <ContentTemplate>
                                        <asp:DataList ID="DataList3" runat="server">
                                            <ItemTemplate>
                                                <div class="lv-item media">
                                                    <div class="lv-avatar pull-left">

                                                        <asp:Image ID="Image4" runat="server" ImageUrl='<%# Bind("ProfilePicture") %>' />

                                                    </div>
                                                    <div class="media-body">
                                                        <div class="ms-item">
                                                            <span class="glyphicon glyphicon-triangle-left" style="color: #000000;"></span>
                                                            <asp:Label ID="Message" runat="server" Text='<%# Bind("Message") %>'> </asp:Label>

                                                        </div>
                                                        <br />
                                                        <asp:Image ID="obrazek" runat="server" Height="500" Width="400" ImageUrl='<%# Bind("Image") %>' />
                                                        <small class="ms-date"><span class="glyphicon glyphicon-time"></span>&nbsp;
                                                            <asp:Label ID="Date" runat="server" Text='<%# Bind("Time") %>'></asp:Label></small>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:DataList>
                                        
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                
                            </div>
                            <div class="clearfix"></div>
                            <div class="lv-footer ms-reply">

                                <asp:TextBox CssClass="textarea" ID="TextBox1" TextMode="MultiLine" placeholder="Write messages..." runat="server" onkeypress="return runScript(event)" AutoCompleteType="Disabled" AutoPostBack="False"></asp:TextBox>
                                
                                <button id="Send" runat="server" class="button" onserverclick="Unnamed_ServerClick" height="" width="">
                                    <span class="glyphicon glyphicon-send"></span>
                                </button>
                                <asp:FileUpload ID="Dodawanie_pliku" runat="server" />
                                
                                

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