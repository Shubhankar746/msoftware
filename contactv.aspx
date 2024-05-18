<%@ Page Title="" Language="C#" MasterPageFile="~/AdminManage/Admin.master" AutoEventWireup="true" CodeFile="contactv.aspx.cs" Inherits="AdminManage_contactv" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        body {
            background-image: url('../Home/blogpic1/wp6944404.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 0 20px;
        }

        .search-container {
            margin-bottom: 20px;
        }

        .search-container input[type=text] {
            width: 200px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            outline: none;
        }

        .search-container button {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .grid-container {
            overflow-y: auto;
            background-color: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 10px;
        }

        .grid-container table {
            width: 100%;
            border-collapse: collapse;
        }

        .grid-container th,
        .grid-container td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        .grid-container th {
            background-color: #000084;
            color: #fff;
            font-weight: bold;
            text-align: left;
        }

        .grid-container tr:hover {
            background-color: #f5f5f5;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <div class="search-container">
            <asp:TextBox ID="txtSearchNumber" runat="server" placeholder="Search by Number"></asp:TextBox>
            <asp:Button ID="btnSearchNumber" runat="server" Text="Search" OnClick="btnSearchNumber_Click" />
        </div>

<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" DataKeyNames="ID" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">

        <AlternatingRowStyle BackColor="#DCDCDC" />

        <Columns>
            <asp:ButtonField HeaderText="Action" CommandName="View" Text="View" />
            <asp:TemplateField HeaderText="ID">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>


             <asp:TemplateField HeaderText="Name">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

             <asp:TemplateField HeaderText="Email">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%#Eval("Email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Phone">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%#Eval("mobileno") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Message">
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%#Eval("Message") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Status">
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%#Eval("Status") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>

        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <PagerStyle ForeColor="Black" HorizontalAlign="Center" BackColor="#999999" />
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#0000A9" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#000065" />
    </asp:GridView>
                </div>
</asp:Content>
