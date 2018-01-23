<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="Assignment3.part2.main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>COMP466 Assignment3</title>
    <link rel ="stylesheet" type ="text/css" href ="../shared/share.css" />
    <style>
        fieldset {
            display:inline-block;
            vertical-align:middle;
            border: none;
        }
    </style>
</head>
<body>
    <header class ="header">Assignment3 Part2</header>
    <nav class ="sideMenu">
        <ul>
            <li><a href ="../tma3a.html">TMA3 Cover Page</a></li>
            <li><a href="main.aspx" >Part2 Main</a></li>
        </ul>
    </nav>
    <div class = "content">
        <form id="form1" runat="server">
            <div>
            </div>
            <asp:Image ID="myImage" ImageUrl="~/part2/pic/pic1.jpg" runat="server"/>
            <p>
                <asp:Label ID="caption" runat="server" Text="Label"></asp:Label>
            </p>           
            <div>
                <asp:ScriptManager ID="ScriptManager1" runat="server" />
                <asp:Timer ID="Timer1" runat="server" OnTick="refresh" Interval="5000">
                </asp:Timer>
            </div>
            <div>
                <fieldset>
                    <asp:Button ID="startStopButton" runat="server" Text="Stop" OnClick ="updateStartStop"/>
                </fieldset>
                <fieldset>
                    <asp:RadioButtonList ID="MOVEMENT" runat="server" AutoPostBack="true" OnSelectedIndexChanged ="updateMovement">
                        <asp:ListItem>Backward</asp:ListItem>
                        <asp:ListItem Selected="True">Forward</asp:ListItem>
                    </asp:RadioButtonList>
                </fieldset>
                <fieldset>
                    <asp:RadioButtonList ID="SEQUENCE" runat="server" AutoPostBack ="true" OnSelectedIndexChanged ="updateSequence">
                        <asp:ListItem>Random</asp:ListItem>
                        <asp:ListItem Selected="True">Sequential</asp:ListItem>
                    </asp:RadioButtonList>
                </fieldset>
                <fieldset>
                    <asp:Button ID="nextPicture" runat="server" Text="Next" OnClick="nextImage"/>
                    <br />
                    <asp:Button ID="previousPicture" runat="server" Text="Previous" OnClick="previousImage"/>
                    <br />
                </fieldset>
            </div> 
        </form>
    </div>
</body>
</html>
