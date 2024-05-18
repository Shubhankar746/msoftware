<%@ Page Title="" Language="C#" MasterPageFile="~/AdminManage/Admin.master" AutoEventWireup="true" CodeFile="AddProduct.aspx.cs" Inherits="AdminManage_AddProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
          .preview-img {
            max-width: 30%;
            height: auto;
            display: none;
        }

        .label {
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="container">
    <h1 class="text-center mb-4">ADD PRODUCT</h1>
    <div class="row justify-content-center">
        <div class="col-md-8"> 
            <div class="maincont">  
                <div class="form-group">  
                    <label for="ddlcatg" class="label">Category:</label>
                    <asp:DropDownList ID="ddlcatg" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlcatg_SelectedIndexChanged" CssClass="form-control">
                    </asp:DropDownList>

                       
                                  
                    </div>
                <div class="form-group">
                    <label for="ddlsubcatg" class="label">Subcategory:</label>
                    <asp:DropDownList ID="ddlsubcatg" runat="server" CssClass="form-control">
                    </asp:DropDownList>
                </div>

                <div class="form-group">
                    <label class="label" for="FileUpload1">Image 1:</label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-upload"></i></span>
                        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" onchange="previewImage(event, 'imagePreview1')" />
                    </div>
                    <img id="imagePreview1" class="preview-img" src="#" alt="Preview" />
                </div>

                <div class="form-group">
                    <label class="label" for="FileUpload2">Image 2:</label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-upload"></i></span>
                        <asp:FileUpload ID="FileUpload2" runat="server" CssClass="form-control" onchange="previewImage(event, 'imagePreview2')" />
                    </div>
                    <img id="imagePreview2" class="preview-img" src="#" alt="Preview" />
                </div>

                <div class="form-group">
                    <label class="label" for="FileUpload3">Image 3:</label>
                    <div class="input-group">
                        <span class="input-group-addon" style="background-color: #dc3545;"><i class="fa fa-upload"></i></span>
                        <asp:FileUpload ID="FileUpload3" runat="server" CssClass="form-control" onchange="previewImage(event, 'imagePreview3')" />
                    </div>
                    <img id="imagePreview3" class="preview-img" src="#" alt="Preview" />
                </div>

                <div class="form-group">
                    <label class="label" for="txtbrand">Brand Name:</label>
                    <asp:TextBox ID="txtbrand" runat="server" CssClass="form-control" placeholder="Enter Brand Name"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label class="label" for="txtprice">Price:</label>
                    <asp:TextBox ID="txtprice" runat="server" CssClass="form-control" placeholder="Enter Price"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label class="label" for="txtSize">Size:</label>
                    <asp:DropDownList ID="txtSize" runat="server" CssClass="form-control">
                        <asp:ListItem>Select size</asp:ListItem>
                        <asp:ListItem>sm</asp:ListItem>
                        <asp:ListItem>M</asp:ListItem>
                        <asp:ListItem>L</asp:ListItem>
                        <asp:ListItem>Extra Large (XL)</asp:ListItem>
                        <asp:ListItem>Extra Extra Large (XXL)</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="form-group">
                    <label class="label" for="txtdes">Description:</label>
                    <textarea id="txtdes" runat="server" class="form-control" style="margin-top: 5px;"></textarea>
                </div>

                <div class="form-group">
                    <label class="label" for="txtQuantity">Quantity:</label>
                    <asp:TextBox ID="txtQuantity" runat="server" type="number" CssClass="form-control"></asp:TextBox>
                </div>

<%--                <div class="form-group">
                    <label class="label" for="txtDiscount">Discount:</label>
                    <asp:TextBox ID="txtDiscount" runat="server" CssClass="form-control"></asp:TextBox>
                </div>--%>

                <div class="form-group">
                    <label class="label" for="ddlFreeDelivery">Free Delivery:</label>
                    <asp:DropDownList ID="ddlFreeDelivery" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                        <asp:ListItem Text="No" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                </div>

                <%--<div class="form-group">
                    <label class="label" for="txtDeliveryCharges">Delivery Charges:</label>
                    <asp:TextBox ID="txtDeliveryCharges" runat="server" CssClass="form-control" placeholder="Enter delivery charges"></asp:TextBox>
                </div>--%>

                <div class="form-group">
                    <label class="label" for="ddlRating">Rating:</label>
                    <asp:DropDownList ID="ddlRating" runat="server" CssClass="form-control">
                        <asp:ListItem Text="*" Value="*"></asp:ListItem>
                        <asp:ListItem Text="**" Value="**"></asp:ListItem>
                        <asp:ListItem Text="***" Value="***"></asp:ListItem>
                        <asp:ListItem Text="****" Value="****"></asp:ListItem>
                        <asp:ListItem Text="*****" Value="*****"></asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="form-group">
                    <label class="label">COD:</label>
                    <asp:CheckBox ID="chkCOD" runat="server" CssClass="checkbox"></asp:CheckBox>
                </div>

                <div class="form-group text-center">
                    <asp:Button ID="Button1" runat="server" Text="SAVE" OnClick="Button1_Click" CssClass="btn btn-primary" />
                </div>
            </div>
        </div>
    </div>
</div>
 <%--   <br />
    <div class="form-group text-center">--%>
    <asp:Button ID="btnExportGridToExcel" runat="server" Text="Export to Excel" OnClick="btnExportToExcel_Click" CssClass="btn btn-success" />






                   
                
         
   <div class="row justify-content-center">
    <h1 class="text-center mb-4">VIEW ADDED PRODUCT DETAILS</h1>
    <div class="col-md-12">
        <div class="table-responsive">
            <asp:GridView ID="GridView1" runat="server" DataKeyNames="ID" AutoGenerateColumns="False" BorderColor="#DEBA84" 
                AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" OnRowCancelingEdit="GridView1_RowCancelingEdit" 
                OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" 
                CssClass="table table-bordered table-hover" BackColor="#FFFFFF" BorderStyle="None" >
                <Columns>
                     <asp:TemplateField HeaderText="ID" HeaderStyle-CssClass="font-weight-bold">
                        <ItemTemplate>
                            <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID") %>' Width="10px"></asp:Label>
                        </ItemTemplate>

                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Image1" HeaderStyle-CssClass="font-weight-bold">
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Image1","~/AdminManage/ProductImages/{0}") %>' Width="100px" Height="110px" CssClass="hover-zoom"/>
                        </ItemTemplate>

                         <EditItemTemplate>   
                             <asp:FileUpload ID="Imageupdate1" runat="server" />
                        </EditItemTemplate>

                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Image2" HeaderStyle-CssClass="font-weight-bold">
                        <ItemTemplate>
                            <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("Image2","~/AdminManage/ProductImages/{0}") %>' Width="50px" Height="110px" CssClass="hover-zoom"/>
                        </ItemTemplate>

                         <EditItemTemplate>
                             <asp:FileUpload ID="Imageupdate2" runat="server" />
                        </EditItemTemplate>

                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Image3" HeaderStyle-CssClass="font-weight-bold">
                        <ItemTemplate>
                            <asp:Image ID="Image3" runat="server" ImageUrl='<%# Eval("Image3","~/AdminManage/ProductImages/{0}") %>' Width="100px" Height="110px" CssClass="hover-zoom"/>
                        </ItemTemplate>

                         <EditItemTemplate>
                             <asp:FileUpload ID="Imageupdate3" runat="server" />
                        </EditItemTemplate>

                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Category Name" HeaderStyle-CssClass="font-weight-bold">
                        <ItemTemplate>
                            <asp:Label ID="Lblcname" runat="server" Text='<%# Eval("CatName") %>' Width="120px"></asp:Label>
                        </ItemTemplate>

                        <EditItemTemplate>
                            <asp:TextBox ID="txtcname" runat="server" Text='<%# Bind("CatName") %>' Width="100px"></asp:TextBox>
                        </EditItemTemplate>


                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="SubCatName" HeaderStyle-CssClass="font-weight-bold">
                        <ItemTemplate>
                            <asp:Label ID="LblSub" runat="server" Text='<%# Eval("SubCatName") %>' Width="120px"></asp:Label>
                        </ItemTemplate>

                        <EditItemTemplate>
                            <asp:TextBox ID="txtSub" runat="server" Text='<%# Bind("SubCatName") %>' Width="100px"></asp:TextBox>
                        </EditItemTemplate>


                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Brand" HeaderStyle-CssClass="font-weight-bold">
                        <ItemTemplate>
                            <asp:Label ID="LblBrand" runat="server" Text='<%# Eval("BrandName") %>' Width="120px"></asp:Label>
                        </ItemTemplate>

                        <EditItemTemplate>
                            <asp:TextBox ID="txtbrand" runat="server" Text='<%# Bind("BrandName") %>' Width="100px"></asp:TextBox>
                        </EditItemTemplate>


                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Price" HeaderStyle-CssClass="font-weight-bold">
                        <ItemTemplate>
                            <asp:Label ID="Lblprice" runat="server" Text='<%# Eval("Price") %>' Width="120px"></asp:Label>
                        </ItemTemplate>

                        <EditItemTemplate>
                            <asp:TextBox ID="txtprice" runat="server" Text='<%# Bind("Price") %>' Width="100px"></asp:TextBox>
                        </EditItemTemplate>


                    </asp:TemplateField>


                  <asp:TemplateField HeaderText="Size">
                   <ItemTemplate>
                   <asp:Label ID="txtsize" CssClass="message-text" runat="server" Text='<%# Eval("Size") %>'></asp:Label>
                    </ItemTemplate>
                    </asp:TemplateField>



                      <asp:TemplateField HeaderText="Description">
                        <ItemTemplate>
                            <asp:Literal ID="LiteralDescription" runat="server" Text='<%# Eval("description") %>'></asp:Literal>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtDescription" runat="server" Text='<%# Bind("description") %>' TextMode="MultiLine" Rows="3" Columns="30" CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

        
                     <asp:TemplateField HeaderText="Qty">
                            <ItemTemplate>
                                <asp:Label ID="lblQty" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>  
                            </ItemTemplate>
                        </asp:TemplateField>

                      <%--  <asp:TemplateField HeaderText="Price">
                            <ItemTemplate>
                                <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                    
                    <%--<asp:TemplateField HeaderText="Discount">
                            <ItemTemplate>
                                <asp:Label ID="txtDiscount" runat="server" Text='<%# Eval("Discount") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField> --%>
                      <%--  <asp:TemplateField HeaderText="Total Price">
                            <ItemTemplate>
                                <asp:Label ID="lblTotalPrice" runat="server" Text='<%# Eval("TotalPrice") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>--%>

                     <asp:TemplateField HeaderText="FreeDelivery">
                            <ItemTemplate>
                                <asp:Label ID="ddlFreeDelivery" runat="server" Text='<%# Eval("FreeDelivery") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                       <%--<asp:TemplateField HeaderText="DeliveryCharges">
                            <ItemTemplate>
                                <asp:Label ID="txtDeliveryCharges" runat="server" Text='<%# Eval("DeliveryCharges") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>--%>

                     <asp:TemplateField HeaderText="Rating">
                            <ItemTemplate>
                                <asp:Label ID="ddlRating" runat="server" Text='<%# Eval("Rating") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                      <asp:TemplateField HeaderText="COD">
                            <ItemTemplate>
                                <asp:Label ID="chkCOD" runat="server" Text='<%# Eval("COD") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField> 
                </Columns>
               
            </asp:GridView>
        </div>
    </div>
</div>
   
       <div class="form-group text-center">
<%--    <asp:Button ID="btnPrint" runat="server" Text="Print Bill" OnClick="btnPrint_Click" CssClass="btn btn-primary" />--%>
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

        <script>
            function previewImage(event, previewId) {
                var input = event.target;
                var preview = document.getElementById(previewId);

                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        preview.src = e.target.result;
                        preview.style.display = 'block';
                    }
                    reader.readAsDataURL(input.files[0]);
                }
            }
        </script>
      
</asp:Content>



