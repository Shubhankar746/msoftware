﻿<%@ Page Title="" Language="C#" MasterPageFile="~/FashionAdaa/MasterPage.master" AutoEventWireup="true" CodeFile="AddBlog.aspx.cs" Inherits="AdminManage_AddBlog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        /*body {
            background-color: #f0f0f0;*/ /* Changed background color to a lighter shade */
            /*font-family: Arial, sans-serif;*/ /* Added a common font family for better readability */
            /*margin: 0;*/ /* Removed default margin */
            /*padding: 0;*/ /* Removed default padding */
        /*}*/

        .container {
            max-width: 800px; /* Set maximum width for better content presentation */
            margin: 0 auto; /* Center align the container */
            padding: 20px; /* Added padding for content spacing */
        }

        #imagePreview {
            max-width: 100%; /* Adjusted max-width for responsiveness */
            height: auto; /* Allow the image to adjust its height proportionally */
            display: block; /* Ensured image is displayed as a block element */
            margin-top: 20px; /* Increased top margin for better spacing */
        }

        #btnsend {
            background-color: mediumpurple; /* Changed button background color */
            color: white; /* Changed button text color */
            padding: 10px 20px; /* Added padding for button */
            border: none; /* Removed button border */
            cursor: pointer; /* Added cursor style for better usability */
            border-radius: 5px; /* Added border-radius for button */
            transition: background-color 0.3s ease; /* Smooth transition effect */
        }

        #btnsend:hover {
            background-color: #7b68ee; /* Darker color on hover for better contrast */
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <div class="row">
            <div class="col-6">
                <h1 class="text-center">ADD Product</h1>
            </div>
        </div>
        <div class="row" style="margin-left: 20px; margin-top: 20px;">
            <div class="col-sm-12">
                <h4>Upload Image</h4>
                <asp:FileUpload ID="FileUpload1" runat="server" type="file" onchange="previewImage(event)" />
                <br />
                <img id="imagePreview" src="#" alt="Preview" style="display: none;" height="50px;" width="50px" />
            </div>
        </div>

        <div class="row" style="margin-top: 20px;">
            <div class="col-sm-12">
                <asp:Label ID="Label1" runat="server" Text="Title: " CssClass="font-weight-bold" style="color: mediumturquoise; font-size: 20px;"></asp:Label>
                <asp:TextBox ID="txttitle" runat="server" CssClass="form-control" TextMode="MultiLine" style="margin-top: 5px;"></asp:TextBox>
            </div>
        </div>

        <div class="row" style="margin-top: 20px;">
            <div class="col-sm-12">
                <asp:Label ID="Label2" runat="server" Text="Description: " CssClass="font-weight-bold" style="color: mediumturquoise; font-size: 20px;"></asp:Label>
                <textarea id="txtdes" runat="server" class="form-control" style="margin-top: 5px;"></textarea>
            </div>
        </div>

        <div class="row" style="margin-top: 20px;">
            <div class="col-sm-12">
                <asp:Label ID="Label3" runat="server" Text="Date: " CssClass="font-weight-bold" style="color: darkcyan; font-size: 20px;"></asp:Label>
                <asp:TextBox ID="txtdate" runat="server" CssClass="form-control" type="date" style="margin-top: 5px;"></asp:TextBox>
            </div>
        </div>

        <div class="row" style="margin-top: 20px;">
            <div class="col-sm-12">
                <asp:Button ID="btnsend" runat="server" Text="Get Info" CssClass="btn btn-primary" OnClick="btnsend_Click" />
                <br />
                <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-primary" OnClick="btnClear_Click" />
            </div>
        </div>

        <div class="row" style="overflow-y:auto; margin-top: 20px;">
            <asp:GridView ID="GridView1" runat="server" DataKeyNames="id" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
                <Columns>
                    <asp:TemplateField HeaderText="Id">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("ID") %>' Width="60px"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                                         
                    <asp:TemplateField HeaderText="Product Image">       
                        <ItemTemplate>
<%--                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Image","~/1/blogpic1/{0}") %>' Width="80px" Height="100px" />--%>
                         <asp:Image ID="imgProduct" runat="server" ImageUrl='<%# Eval("Image") %>' Height="100" Width="100" />

                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:FileUpload ID="FileUpload2" runat="server" />
                            <asp:Image ID="EditImage" runat="server" ImageUrl='<%# Bind("Image","~/1/blogpic1/{0}") %>' Width="80px" Height="100px" />
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Title">   
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("title") %>' Width="200px"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="uptitle" runat="server" Text='<%# Bind("title") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Description">
                        <ItemTemplate>
                            <asp:Literal ID="LiteralDescription" runat="server" Text='<%# Eval("description") %>'></asp:Literal>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtDescription" runat="server" Text='<%# Bind("description") %>' TextMode="MultiLine" Rows="3" Columns="30" CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Upload Date">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("date") %>' Width="105px"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="update" runat="server" Text='<%# Bind("date") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>

                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        </div>
    </div>

    <script>
        function previewImage(event) {
            var input = event.target;
            var preview = document.getElementById('imagePreview');

            var reader = new FileReader();
            reader.onload = function () {
                preview.src = reader.result;
                preview.style.display = 'block';
            }

            reader.readAsDataURL(input.files[0]);
        }
    </script>

    <script src="https://cdn.tiny.cloud/1/kuk3eax4b8akb3oc1pwgwsd3jnezvj4r7zxa5tn5dtjij755/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
    <script>
        tinymce.init({
            selector: '#<%= txtdes.ClientID %>',
            plugins: 'autoresize',
            toolbar: 'undo redo | bold italic | alignleft aligncenter alignright | bullist numlist outdent indent | link',
            height: 300,
            autoresize_bottom_margin: 16
        });
    </script>
</asp:Content>