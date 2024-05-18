<%@ Page Title="" Language="C#" MasterPageFile="~/AdminManage/Admin.master" AutoEventWireup="true" CodeFile="AddSubCategories.aspx.cs" Inherits="AdminManage_AddSubCategories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class ="container ">
            <div class ="form-horizontal ">
                <br />
                <br />

                <h2>Add SubCategory</h2>
                <hr />

                 <div class ="form-group">
                    <asp:Label ID="Label2" CssClass ="col-md-2 control-label " runat="server" Text="Main CategoryID"></asp:Label>
                    <div class ="col-md-3 ">

                        <asp:DropDownList ID="ddlMainCatID" CssClass ="form-control" runat="server"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorMainCatID" runat="server" CssClass ="text-danger " ErrorMessage="*plz Enter Main CategoryID" ControlToValidate="ddlMainCatID" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>


                <div class ="form-group">
                    <asp:Label ID="Label1" CssClass ="col-md-2 control-label " runat="server" Text="SubCategory Name"></asp:Label>
                    <div class ="col-md-3 ">

                        <asp:TextBox ID="txtSubCategory" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatortxtSubCategoryName" runat="server" CssClass ="text-danger " ErrorMessage="*plz Enter SubCategory" ControlToValidate="txtSubCategory" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                



                        <asp:Button ID="btnAddSubCategory" CssClass ="btn btn-success " runat="server" Text="Add SubCategory" OnClick="btnAddSubCategory_Click"    />
                        
                    </div>
                </div>
                

            </div>


         <asp:GridView ID="GridViewSubCategories" runat="server" CssClass="table table-striped table-bordered"
    AutoGenerateColumns="False" EmptyDataText="No subcategories found"
    OnRowEditing="GridViewSubCategories_RowEditing" OnRowCancelingEdit="GridViewSubCategories_RowCancelingEdit"
    OnRowUpdating="GridViewSubCategories_RowUpdating" OnRowDeleting="GridViewSubCategories_RowDeleting"
    CellPadding="4" ForeColor="#333333" GridLines="None"
    DataKeyNames="SubCatID"> 
    <Columns>
       <asp:TemplateField HeaderText="SubCategory ID">
    <ItemTemplate>
        <asp:Label ID="lblSubCategoryID" runat="server" Text='<%# Eval("SubCatID") %>'></asp:Label>
    </ItemTemplate>
    <EditItemTemplate>
        <asp:Label ID="lblEditSubCategoryID" runat="server" Text='<%# Bind("SubCatID") %>'></asp:Label>
    </EditItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Main Category Name">
    <ItemTemplate>
        <asp:Label ID="lblMainCategoryName" runat="server" Text='<%# Eval("MainCategoryName") %>'></asp:Label>
    </ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="SubCategory Name">
    <ItemTemplate>
        <asp:Label ID="lblSubCategoryName" runat="server" Text='<%# Eval("SubCatName") %>'></asp:Label>
    </ItemTemplate>
    <EditItemTemplate>
        <asp:TextBox ID="txtEditSubCategoryName" runat="server" Text='<%# Bind("SubCatName") %>' CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEditSubCategoryName" runat="server" CssClass="text-danger"
            ErrorMessage="* Please enter a SubCategory Name" ControlToValidate="txtEditSubCategoryName"></asp:RequiredFieldValidator>
    </EditItemTemplate>
</asp:TemplateField>

        <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
    </Columns>
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
</asp:GridView>

</asp:Content>

