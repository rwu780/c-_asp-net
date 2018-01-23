<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewOrders.aspx.cs" Inherits="Assignment3.part4.viewOrders" %>

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
    <div class ="content">
        <form id="form1" runat="server">
            <asp:Label ID="Label1" runat="server" Text="ABCD Online Computer Application"></asp:Label>
            <div>
                <asp:GridView ID="orderGridView" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataSourceID="orderLinqDataSource" ForeColor="Black" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:CheckBox ID="cbSelect" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" ReadOnly="True" />
                        <asp:BoundField DataField="computer" HeaderText="computer" SortExpression="computer" ReadOnly="True" />
                        <asp:BoundField DataField="ram" HeaderText="ram" SortExpression="ram" ReadOnly="True" />
                        <asp:BoundField DataField="hd" HeaderText="hd" SortExpression="hd" ReadOnly="True" />
                        <asp:BoundField DataField="cpu" HeaderText="cpu" SortExpression="cpu" ReadOnly="True" />
                        <asp:BoundField DataField="display" HeaderText="display" SortExpression="display" ReadOnly="True" />
                        <asp:BoundField DataField="os" HeaderText="os" SortExpression="os" ReadOnly="True" />
                        <asp:BoundField DataField="soundcard" HeaderText="soundcard" ReadOnly="True" SortExpression="soundcard" />
                        <asp:BoundField DataField="totalPrice" HeaderText="totalPrice" SortExpression="totalPrice" ReadOnly="True" />
                    </Columns>
                    
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="Gray" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                <asp:LinqDataSource ID="orderLinqDataSource" runat="server" EnableDelete ="true" ContextTypeName="Assignment3.DataClasses1DataContext" EntityTypeName="" Select="new (soundcard, totalPrice, Id, computer, ram, hd, cpu, display, os)" TableName="orderTables" Where="userID == @userID">
                    <WhereParameters>
                        <asp:SessionParameter Name="userID" SessionField="userID" Type="Int32" />
                    </WhereParameters>
                </asp:LinqDataSource>
                
                <br />
                <br />
                <asp:Button ID="deleteButton" runat="server" Text="Delete" OnClick="deleteSelectedProducts_Clicks"/>
                <br />
                <br />
                <br />
                <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/part4/signout.aspx">Sign Out</asp:LinkButton>
                <br />
                <br />
                <br />
                
            </div>
        </form>
    </div>
</body>
</html>
