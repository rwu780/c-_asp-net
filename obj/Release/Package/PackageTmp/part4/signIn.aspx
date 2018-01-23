<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signIn.aspx.cs" Inherits="Assignment3.part4.signIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>COMP466 Assignment3</title>
    <link rel ="stylesheet" type="text/css" href="../shared/share.css" />
</head>
<body>
    <header class ="header">Assignment3 Part4</header>
    <nav class ="sideMenu">
        <ul>
            <li><a href ="../tma3a.html">TMA3 Cover Page</a></li>
            <li><a href="main_p4.aspx" >Main</a></li>
            <li><a href="signIn.aspx">Sign In</a></li>
            <li><a href="Order_p4.aspx">Order</a></li>
            <li><a href="contactUs_p4.aspx">Contact Us</a></li>
        </ul>
    </nav>
    <div class="content">
        <form id="form1" runat="server">
            <asp:Label ID="Label1" runat="server" Text="ABCD Online Computer Application"></asp:Label>

            <div id="signInContent" runat="server" visible="true">
                <br />
                <br />
                Please sign in to View your order and status<br />
                <br />
                <br />
                <asp:Label ID="Label2" runat="server" Text="Username:"></asp:Label>
                <asp:TextBox ID="usernameTextBox" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label3" runat="server" Text="Password:"></asp:Label>
                <asp:TextBox ID="passwordTextBox" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="signInButton" runat="server" Text="Sign-In" OnClick="signInButtonClicked" />
                <br />
                <br />


                <asp:LinkButton ID="registerLinkButton" runat="server" OnClick="registerLinkButtonClicked">Register</asp:LinkButton>
                &nbsp;
                <asp:LinkButton ID="forgotPasswordLinkButton" runat="server" OnClick="recoverPasswordLinkButtonClicked">Forgot Password?</asp:LinkButton>
                <br />
                <br />

                <asp:Label ID="signInErrorLabel" runat="server" Text="Label" Visible="False"></asp:Label>
         
            </div>

            <div id="registerContent" runat="server" visible="false">
                <br />
                <br />
                Please fill in the require field to register<br />
                <br />
                <br />
                <asp:Label ID="Label5" runat="server" Text="Username:"></asp:Label>
                <asp:TextBox ID="registerUsername" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="usernameTextBox" Display="Dynamic" ErrorMessage="You need to enter a username" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <br />
                <asp:Label ID="Label6" runat="server" Text="Password:"></asp:Label>
                <asp:TextBox ID="registerPassword" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="passwordTextBox" ErrorMessage="You need to enter a password" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <br />
                <asp:Button ID="registerButton" runat="server" Text="registerButtonClicked" OnClick="registerButtonClicked" />
                <br />
                <br />
                <asp:Label ID="registerErrorLabel" runat="server" Text="Label" Visible="False"></asp:Label>
                <br />
            </div>

            <div id="recoverPasswordContent" runat="server" visible="false">
                <br />
                <br />
                Password Recovery: please enter you username to retrieve your password<br />
                <br />
                <asp:Label ID="Label7" runat="server" Text="Username:"></asp:Label>
                <asp:TextBox ID="recoverUsername" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="recoverRequiredFieldValidator" runat="server" ControlToValidate="recoverUsername" ErrorMessage="You need to enter a username"></asp:RequiredFieldValidator>
                <br />
                <br />
                <asp:Button ID="recoverButton" runat="server" Text="Retrieve password" OnClick="recoverButtonClicked"/>
                <br />
                <br />
                <asp:Label ID="recoverLabel" runat="server" Text="password: " Visible="false"></asp:Label>

                <br />

            </div>
        </form>
    </div>
</body>
</html>
