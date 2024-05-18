<%@ Page Title="" Language="C#" MasterPageFile="~/AdminManage/Admin.master" AutoEventWireup="true" CodeFile="AddCategories.aspx.cs" Inherits="AdminManage_AddCategories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <script type="text/javascript">
            function confirmPrint() {
        // Display a confirmation dialog to the user
        if (confirm("Are you sure you want to print the bill?")) {
            // If user confirms, return true to proceed with server-side click event
            return true;
        } else {
            // If user cancels, return false to prevent server-side click event
            return false;
        }
    }
        </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <div class="form-horizontal">
          
            <h2>Add Category</h2>
            <hr />
            <div class="form-group">
                <asp:Label ID="Label1" CssClass="col-md-2 control-label" runat="server" Text="Category Name"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtCategory" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="text-danger"
                        ErrorMessage="* Please enter a category name" ControlToValidate="txtCategory" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-offset-2 col-md-6">
                    <asp:Button ID="btnAddCategory" CssClass="btn btn-success" runat="server" Text="Add Category"
                        OnClick="btnAddCategory_Click" />
                </div>
            </div>
            <hr />
            <h2>All Categories</h2>
            <hr />
            <asp:GridView ID="GridViewCategories" runat="server" CssClass="table table-striped table-bordered"
                AutoGenerateColumns="False" EmptyDataText="No categories found"
                OnRowEditing="GridViewCategories_RowEditing" OnRowCancelingEdit="GridViewCategories_RowCancelingEdit"
                OnRowUpdating="GridViewCategories_RowUpdating" OnRowDeleting="GridViewCategories_RowDeleting" CellPadding="4" ForeColor="#333333" GridLines="None"   DataKeyNames="CatID">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:TemplateField HeaderText="Category ID">
                        <ItemTemplate>
                            <asp:Label ID="lblCatID" runat="server" Text='<%# Eval("CatID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Category Name">
                        <ItemTemplate>
                            <asp:Label ID="lblCatName" runat="server" Text='<%# Eval("CatName") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditCatName" runat="server" Text='<%# Bind("CatName") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
                </Columns>
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


<%--<asp:Button ID="btnPrintBill" runat="server" Text="Print Bill" OnClick="btnPrintBill_Click" OnClientClick="return confirmPrint();" />--%>

        </div>
    </div>
</asp:Content>



