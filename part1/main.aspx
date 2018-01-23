<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="Assignment3.part1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>COMP466 Assignment3</title>
    <link rel ="stylesheet" type="text/css" href="../shared/share.css" />
</head>
<body>
    <header class ="header">Assignment3 Part1</header>
    <nav class ="sideMenu">
        <ul>
            <li><a href ="../tma3a.html">TMA3 Cover Page</a></li>
            <li><a href="main.aspx" >Part1</a></li>
        </ul>
    </nav>
    <div class ="content">
        <h1>Assignment3 Part1</h1>
        <form id="form1" runat="server">
            <div>
                The number of times you hitted on this page:<asp:Label ID="numberOfTimes" runat="server"></asp:Label>
            </div>
            <p>
                You current IP address:
                <asp:Label ID="ipAddress" runat="server"></asp:Label>
            </p>
            <p>
                You current Timezone:
                <asp:Label ID="timeZone" runat="server" Text="Label"></asp:Label>
            </p>
        </form>
    </div> 
</body>
</html>
