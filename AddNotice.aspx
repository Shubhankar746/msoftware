<%@ Page Title="" Language="C#" MasterPageFile="~/AdminManage/Admin.master" AutoEventWireup="true" CodeFile="AddNotice.aspx.cs" Inherits="AdminManage_AddNotice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        /* Style for TextBox */
        .grid-textbox {
            width: 100%;
            padding: 5px;
            font-size: 14px;
            border: 1px solid #ced4da; /* Light gray */
            border-radius: 5px;
            box-sizing: border-box;
        }

        /* Style for Button */
        .grid-button {
            padding: 5px 10px;
            font-size: 14px;
            background-color: #007bff; /* Blue */
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        /* Hover effect for Button */
        .grid-button:hover {
            background-color: #0056b3; /* Darker Blue */
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container mt-4">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header bg-primary text-white">Add Notice</div>
                    <div class="card-body">
                        <asp:TextBox ID="TextBox1" runat="server" placeholder="Enter Notice" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                        <br />
                        <asp:Button ID="Button1" runat="server" Text="Add Notice" OnClick="Button1_Click" CssClass="btn btn-primary" />
                    </div>
                </div>


    <div class="card mt-4">
                    <div class="card-header bg-primary text-white">Notices</div>
                    <div class="card-body">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-striped">
                            <Columns>
                                <asp:TemplateField HeaderText="Notice">
                                    <ItemTemplate>
                                        <asp:Label ID="lblNoticeText" runat="server" Text='<%# Eval("NoticeText") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtNoticeText" runat="server" Text='<%# Bind("NoticeText") %>' CssClass="grid-textbox"></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Date Added">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDateAdded" runat="server" Text='<%# Eval("DateAdded", "{0:dd/MM/yyyy HH:mm:ss}") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Label ID="lblDateAdded" runat="server" Text='<%# Bind("DateAdded", "{0:dd/MM/yyyy HH:mm:ss}") %>'></asp:Label>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField ShowEditButton="True" ControlStyle-CssClass="grid-button" UpdateText="Update" CancelText="Cancel" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
          
</asp:Content>


