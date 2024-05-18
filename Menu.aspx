<%@ Page Title="Add Menu" Language="C#" MasterPageFile="~/AdminDashboard/MasterPage.master" AutoEventWireup="true" CodeFile="Menu.aspx.cs" Inherits="AdminDashboard_Menu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .form-container {
            padding: 20px;
            background-color:wheat;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            margin: 50px auto;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-label {
            font-weight: bold;
        }
        .btn-submit {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .btn-submit:hover {
            background-color: #0056b3;
        }
        .btn-icon {
            margin-right: 5px;
        }
        .image-preview {
            max-width: 100%;
            height: auto;
            margin-top: 10px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="form-container">
        <h2 class="text-center">Add Menu</h2>
        <asp:Panel ID="PanelAddMenu" runat="server">
            <div class="form-group">
                <asp:Label ID="LabelDay" runat="server" Text="Day" CssClass="form-label">
                    <i class="fas fa-calendar-day"></i>
                </asp:Label>
                <asp:DropDownList ID="DropDownListDay" runat="server" CssClass="form-control">
                    <asp:ListItem Value="Monday">Monday</asp:ListItem>
                    <asp:ListItem Value="Tuesday">Tuesday</asp:ListItem>
                    <asp:ListItem Value="Wednesday">Wednesday</asp:ListItem>
                    <asp:ListItem Value="Thursday">Thursday</asp:ListItem>
                    <asp:ListItem Value="Friday">Friday</asp:ListItem>
                    <asp:ListItem Value="Saturday">Saturday</asp:ListItem>
                    <asp:ListItem Value="Sunday">Sunday</asp:ListItem>
                </asp:DropDownList>
            </div>
           <div class="form-group">
    <asp:Label ID="breakfast" runat="server" Text="Breakfast" CssClass="form-label">
        <i class="fas fa-utensil-spoon"></i>
    </asp:Label>
    <asp:TextBox ID="TextBoxBreakfast" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" Placeholder="Enter the dishes for breakfast"></asp:TextBox>
</div>

<div class="form-group">
    <asp:Label ID="LabelLunch" runat="server" Text="Lunch" CssClass="form-label">
        <i class="fas fa-utensil-spoon"></i>
    </asp:Label>
    <asp:TextBox ID="TextBoxLunch" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" Placeholder="Enter the dishes for lunch"></asp:TextBox>
</div>

<div class="form-group">
    <asp:Label ID="LabelDinner" runat="server" Text="Dinner" CssClass="form-label">
        <i class="fas fa-utensil-spoon"></i>
    </asp:Label>
    <asp:TextBox ID="TextBoxDinner" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" Placeholder="Enter the dishes for dinner"></asp:TextBox>
</div>

            <div class="form-group">
                <asp:Label ID="LabelDishes" runat="server" Text="Dishes" CssClass="form-label">
                    <i class="fas fa-utensil-spoon"></i>
                </asp:Label>
                <asp:TextBox ID="TextBoxDishes" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" Placeholder="Enter the dishes for the selected meal"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="LabelFinancialYear" runat="server" Text="Financial Year" CssClass="form-label">
                    <i class="fas fa-calendar-alt"></i>
                </asp:Label>
                <asp:TextBox ID="TextBoxFinancialYear" runat="server" CssClass="form-control" Placeholder="Enter the financial year"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="LabelDate" runat="server" Text="Date" CssClass="form-label">
                    <i class="fas fa-calendar"></i>
                </asp:Label>
                <asp:TextBox ID="TextBoxDate" runat="server" CssClass="form-control" Placeholder="Select date" ReadOnly="true"></asp:TextBox>
<%--                <asp:Calendar ID="CalendarDate" runat="server" CssClass="form-control" Visible="false" OnSelectionChanged="CalendarDate_SelectionChanged"></asp:Calendar>--%>
<%--                <asp:Button ID="ButtonShowCalendar" runat="server" CssClass="btn btn-secondary mt-2" Text="Select Date" OnClick="ButtonShowCalendar_Click" />--%>
            </div>
            <div class="form-group">
                <asp:FileUpload ID="FileUploadDishImage" runat="server" CssClass="form-control" />
                <img id="ImagePreview" class="image-preview" runat="server" />
            </div>
            <div class="form-group">
                <asp:Button ID="ButtonAddMenu" runat="server" CssClass="btn-submit" Text="Submit" OnClick="ButtonAddMenu_Click">

                </asp:Button>
            </div>
        </asp:Panel>
    </div>

    


<div style="height: 400px; overflow-x: auto; overflow-y: hidden;">

<asp:GridView ID="GridViewMenu" runat="server" CssClass="grid-view" DataKeyNames="ID" AutoGenerateColumns="false" style="margin:auto">
    <Columns>
        <asp:TemplateField HeaderText="ID">
            <ItemTemplate>
                <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Day">
            <ItemTemplate>
                <asp:Label ID="lblDay" runat="server" Text='<%# Eval("Day") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        
        <asp:TemplateField HeaderText="Breakfast">
            <ItemTemplate>
                <asp:Label ID="lblBreakfast" runat="server" Text='<%# Eval("Breakfast") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Lunch">
            <ItemTemplate>
                <asp:Label ID="lblLunch" runat="server" Text='<%# Eval("Lunch") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Dinner">
            <ItemTemplate>
                <asp:Label ID="lblDinner" runat="server" Text='<%# Eval("Dinner") %>' ></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
      <%--  <asp:TemplateField HeaderText="Dishes">
            <ItemTemplate>
                <asp:Label ID="lblDishes" runat="server" Text='<%# Eval("Dishes") %>' ></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>--%>
        <asp:TemplateField HeaderText="Image">
            <ItemTemplate>
                <asp:Image ID="imgDish" runat="server" ImageUrl='<%# Eval("ImageUrl") %>' Width="100" Height="100" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Financial Year">
            <ItemTemplate>
                <asp:Label ID="lblFinancialYear" runat="server" Text='<%# Eval("FinancialYear") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Date">
            <ItemTemplate>
                <asp:Label ID="lblDate" runat="server" Text='<%# Eval("Date", "{0:dd/MM/yyyy}") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <HeaderStyle BackColor="#007bff" ForeColor="White" Font-Bold="True" />
    <RowStyle BackColor="#f8f9fa" ForeColor="#495057" />
    <AlternatingRowStyle BackColor="#e9ecef" ForeColor="#495057" />
</asp:GridView>
</div>

</asp:Content>
