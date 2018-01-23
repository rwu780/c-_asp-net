<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contactUs_p3.aspx.cs" Inherits="Assignment3.part3.contactUs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Assignment3</title>
    <link rel ="stylesheet" type="text/css" href="../shared/share.css" />

    </head>

<body>
    <header class ="header">Assignment3 Part3</header>
    <nav class ="sideMenu">
        <ul>
            <li><a href ="../tma3a.html">TMA3 Cover Page</a></li>
            <li><a href="main_p3.aspx" >Main</a></li>
            <li><a href="Order_p3.aspx">Order</a></li>
            <li><a href="contactUs_p3.aspx">Contact Us</a></li>
        </ul>
    </nav>
    <div class="content">
        <h1>Contact Us</h1>
        <p>If you have any questions/concerns regard to the particular product or the application, please let you contact info and comments below and we will get
            back to you as soon as possible
        </p>
        <form id="form1_p3" runat="server">
            <table style="width:100%;">
                <tr>
                    <td>Name:</td>
                    <td>
                        <asp:TextBox ID="nameTextBox_p3" runat="server"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="nameRequiredFieldValidator_p3" runat="server" ControlToValidate="nameTextBox_p3" Display="Dynamic" ErrorMessage="Please enter your name" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>E-mail:</td>
                    <td>
                        <asp:TextBox ID="emailTextBox_p3" runat="server"></asp:TextBox>
                        e.g. <a href="mailto:email@domain.com">email@domain.com</a><br />
                        <asp:RequiredFieldValidator ID="emailRequiredFieldValidator_p3" runat="server" ControlToValidate="emailTextBox_p3" Display="Dynamic" ErrorMessage="Please enter your email" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="emailRegularExpressionValidator_p3" runat="server" ControlToValidate="emailTextBox_p3" Display="Dynamic" ErrorMessage="Please enter an e-mail address in a valid format" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>Phone:</td>
                    <td>
                        <asp:TextBox ID="phoneTextBox_p3" runat="server"></asp:TextBox>
                        e.g. (555) 555-1234<br />
                        <asp:RequiredFieldValidator ID="phoneRequiredFieldValidator_p3" runat="server" ControlToValidate="phoneTextBox_p3" Display="Dynamic" ErrorMessage="Please enter your phone" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="phoneRegularExpressionValidator_p3" runat="server" ControlToValidate="phoneTextBox_p3" ErrorMessage="Please enter a phone number in a  valid format" ForeColor="Red" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>Subject:</td>
                    <td>
                        <asp:TextBox ID="subjectTextBox_p3" runat="server"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="subjectRequiredFieldValidator_p3" runat="server" ControlToValidate="subjectTextBox_p3" Display="Dynamic" ErrorMessage="Please enter your subject" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr><tr>
                    <td>Question/Comments:</td>
                    <td>
                        <textarea id="commentTextArea_p3" cols="80" maxlength="300" name="S1" rows="5" wrap="soft" required="required"></textarea><br />
                        <br />

                    </td>
                </tr>
            </table>
            <asp:Button ID="submitButton_p3" runat="server" Text="Submit" />
            <br />
            <br />
            <asp:Label ID="outputLabel_p3" runat="server" Text="Label" Visible="False"></asp:Label>
            <br />
        </form>
    </div>
</body>
</html>