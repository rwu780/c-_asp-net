<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Order_p3.aspx.cs" Inherits="Assignment3.part3.Order" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>COMP466 Assignemnt3</title>
    <link rel ="stylesheet" type="text/css" href="../shared/share.css" />
    <style>
        fieldset {
            vertical-align:middle;
        }
    </style>
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
    <div class ="content">
        <form id="form1_p3" runat="server">
            <div>
                <h1>Order</h1>
                <p>PLease select a computer to begin</p>
                <p>&nbsp;</p>
                <p>
                    <asp:DropDownList ID="computerDrowDownList_p3" runat="server" AutoPostBack="true" EnableViewState="true" OnSelectedIndexChanged ="updateComputer">
                        <asp:ListItem Value="350">HP Desktop($350)</asp:ListItem>
                        <asp:ListItem Value="300" Selected="True">HP Laptop($300)</asp:ListItem>
                        <asp:ListItem Value="354">Dell Desktop($354)</asp:ListItem>
                        <asp:ListItem Value="600">Dell Gaming PC($600)</asp:ListItem>
                    </asp:DropDownList>
                </p>
                <table style="width:100%;">
                    <tr>
                        <td>Computer</td>
                        <td>
                            <asp:Label ID="computerLabel_p3" runat="server" Text="ramLabel"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>RAM</td>
                        <td>
                            <asp:Label ID="ramLabel_p3" runat="server" Text="ramLabel"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Hard Drive</td>
                        <td>
                            <asp:Label ID="hdLabel_p3" runat="server" Text="hdLabel"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>CPU</td>
                        <td>
                            <asp:Label ID="cpuLabel_p3" runat="server" Text="cpuLabel"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Display</td>
                        <td>
                            <asp:Label ID="displayLabel_p3" runat="server" Text="displayLabel"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>OS</td>
                        <td>
                            <asp:Label ID="osLabel_p3" runat="server" Text="osLabel"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>SoundCard</td>
                        <td>
                            <asp:Label ID="soundcardLabel_p3" runat="server" Text="soundcardLabel"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Total Price</td>
                        <td>
                            <asp:Label ID="totalpriceLabel_p3" runat="server" Text="totalPriceLabel"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <div id="customize_p3" runat="server">
                    You can select different components for you computer.<br />
                    <br />
                    <asp:Label ID="Label7_p3" runat="server" Text="Ram"></asp:Label>
                    <br />
                    <fieldset>
                        <asp:RadioButtonList ID="ramRadioButtonList_p3" runat="server" AutoPostBack="true" OnSelectedIndexChanged ="updateRam">
                            <asp:ListItem Selected="True" Value="150">Kingston HyperX 8GB($150)</asp:ListItem>
                            <asp:ListItem Value="250">Kingston HyperX 16GB($250)</asp:ListItem>
                            <asp:ListItem Value="110">Axiom 4GB DDR4$(110)</asp:ListItem>
                        </asp:RadioButtonList>
                    </fieldset><br />
                    <br />
                    <asp:Label ID="Label8_p3" runat="server" Text="Hard Drive"></asp:Label>
    &nbsp;<fieldset>
                        <asp:RadioButtonList ID="hdRadioButtonList_p3" runat="server" AutoPostBack="true" OnSelectedIndexChanged ="updateHD">
                            <asp:ListItem Selected="True" Value="58">Seagate BarraCude 1TB($58)</asp:ListItem>
                            <asp:ListItem Value="70">Seagate BarraCuda 2TB($70)</asp:ListItem>
                            <asp:ListItem Value="80">Seagate BarraCuda 2TB Hybrid Drive$(80)</asp:ListItem>
                        </asp:RadioButtonList>
                    </fieldset><br />
                    <br />
                    <asp:Label ID="Label9_p3" runat="server" Text="CPU"></asp:Label>
    &nbsp;<fieldset>
                        <asp:RadioButtonList ID="cpuRadioButtonList_p3" runat="server" AutoPostBack="true" OnSelectedIndexChanged ="updateCPU">
                            <asp:ListItem Value="383">Intel Core i5-7600K($383)</asp:ListItem>
                            <asp:ListItem Selected="True" Value="80">Intel Pentium G4400 3.3Ghz($80)</asp:ListItem>
                            <asp:ListItem Value="528">Intel Core i7-7700K($528)</asp:ListItem>
                        </asp:RadioButtonList>
                        <br />
                    </fieldset>
                    <br />
                    <br />

                    <asp:Label ID="Label10_p3" runat="server" Text="Display"></asp:Label>

                    <fieldset>
                        <asp:RadioButtonList ID="displayRadioButtonList_p3" runat="server" AutoPostBack="true" OnSelectedIndexChanged ="updateDisplay">
                            <asp:ListItem Selected="True" Value="300">ASUS 31.5&quot; LED Display $(300)</asp:ListItem>
                            <asp:ListItem Value="550">Philips 43&quot; 4K UHD LED Monitor($550)</asp:ListItem>
                            <asp:ListItem Value="500">ASUS 28&quot; 4K Ultra HD LED Gaming Monitor($500)</asp:ListItem>
                        </asp:RadioButtonList>
                        <br />
                        <br />
                    </fieldset>
                    <br />
                    <br />
            
                    <asp:Label ID="Label11_p3" runat="server" Text="Operating System"></asp:Label>

                    <fieldset>
                        <asp:RadioButtonList ID="osRadioButtonList_p3" runat="server" AutoPostBack="true" OnSelectedIndexChanged ="updateOS">
                            <asp:ListItem Selected="True" Value="165">Microsoft Windows 10 Home($165)</asp:ListItem>
                            <asp:ListItem Value="260">Microsoft Windows 10 Pro($260)</asp:ListItem>
                            <asp:ListItem Value="100">Apple Mac OS X Tiger Version($100)</asp:ListItem>
                        </asp:RadioButtonList>
                        <br />
                    </fieldset>
                    <br />
                    <br />
                
                    <asp:Label ID="Label1_p3" runat="server" Text="Operating System"></asp:Label>
                    <fieldset>
                        <asp:RadioButtonList ID="soundcardRadioButtonList_p3" runat="server" AutoPostBack="true" OnSelectedIndexChanged ="updateSoundcard">
                            <asp:ListItem Value="150">ASUS STRIX SOAR 7.1 PCle Gaming Sound Card($150)</asp:ListItem>
                            <asp:ListItem Value="416">ASUS EsSENCESTXII Essence STIX II Sound Card($416)</asp:ListItem>
                            <asp:ListItem Selected="True" Value="17">MMNOX Startech 4.1 Channel PCI External Sound Card($17)</asp:ListItem>
                        </asp:RadioButtonList>
                    </fieldset>
                    <br />
                    <br />
                    <asp:Button ID="submitButton_p3" runat="server" Text="Submit" OnClick="order"/>
                </div> 
                <br />
                <br />
                <asp:Label ID="outputLabel_p3" runat="server" Text="Label" Visible="False"></asp:Label>

            </div>
        </form>
    </div>
</body>
</html>
