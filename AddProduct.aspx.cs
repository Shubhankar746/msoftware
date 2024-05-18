
using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class AdminManage_AddProduct : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-E9ANIN8;Initial Catalog=FashionAdda;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGridView();
            LoadCategories();
        }
    }

   
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            if (FileUpload1.HasFile && FileUpload2.HasFile && FileUpload3.HasFile)
            {
                string strname1 = Path.GetFileName(FileUpload1.FileName);
                string strname2 = Path.GetFileName(FileUpload2.FileName);
                string strname3 = Path.GetFileName(FileUpload3.FileName);

                FileUpload1.SaveAs(Server.MapPath("~/AdminManage/ProductImages/") + strname1);
                FileUpload2.SaveAs(Server.MapPath("~/AdminManage/ProductImages/") + strname2);
                FileUpload3.SaveAs(Server.MapPath("~/AdminManage/ProductImages/") + strname3);

                SqlCommand cmd = new SqlCommand("INSERT INTO ProductsAdd (Image1, Image2, Image3, CatName, SubCatName, BrandName, Price, Size, Description, Quantity, FreeDelivery,  Rating, COD) VALUES (@Image1, @Image2, @Image3, @CatName, @SubCatName, @BrandName, @Price, @Size, @Description, @Quantity, @FreeDelivery, @Rating, @COD)", con);
                cmd.Parameters.AddWithValue("@Image1", strname1);
                cmd.Parameters.AddWithValue("@Image2", strname2);
                cmd.Parameters.AddWithValue("@Image3", strname3);
                cmd.Parameters.AddWithValue("@CatName", ddlcatg.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@SubCatName", ddlsubcatg.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@BrandName", txtbrand.Text);

                decimal price;
                if (decimal.TryParse(txtprice.Text, out price))
                {
                    cmd.Parameters.AddWithValue("@Price", price);
                }
                else
                {
                }

                cmd.Parameters.AddWithValue("@Size", txtSize.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@Description", txtdes.Value);

                int quantity;
                if (int.TryParse(txtQuantity.Text, out quantity))
                {
                    cmd.Parameters.AddWithValue("@Quantity", quantity);
                }
                else
                {
                }

             
                int freeDelivery;
                if (int.TryParse(ddlFreeDelivery.SelectedValue, out freeDelivery))
                {
                    cmd.Parameters.AddWithValue("@FreeDelivery", freeDelivery);
                }
                else
                {
                }

                //decimal deliveryCharges;
                //if (decimal.TryParse(txtDeliveryCharges.Text, out deliveryCharges))
                //{
                //    cmd.Parameters.AddWithValue("@DeliveryCharges", deliveryCharges);
                //}
                //else
                //{
                //}

                cmd.Parameters.AddWithValue("@Rating", ddlRating.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@COD", chkCOD.Checked);

                con.Open();
                int res = cmd.ExecuteNonQuery();
                con.Close();

                if (res > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Data has been saved successfully.');", true);
                    BindGridView();
                    ClearFields();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Failed to save data.');", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please upload all three images.');", true);
            }
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Error: " + ex.Message + "');", true);
        }
    }

    private void BindGridView()
    {
        try
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM ProductsAdd", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        catch (Exception ex)
        {
            MessageBox("Error: " + ex.Message);
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        BindGridView(); 
    }

    private void LoadCategories()
    {
        try
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM tblCategory", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                ddlcatg.DataSource = dt;
                ddlcatg.DataTextField = "catName";
                ddlcatg.DataValueField = "CatID";
                ddlcatg.DataBind();
                ddlcatg.Items.Insert(0, "Select Category");
            }
            else
            {
                ddlcatg.Items.Clear();
                ddlcatg.Items.Insert(0, "No categories found");
            }
        }
        catch (Exception ex)
        {
            MessageBox("Error: " + ex.Message);
        }
    }

    private void ClearFields()
    {
        ddlcatg.SelectedIndex = 0;
        ddlsubcatg.Items.Clear();
        txtbrand.Text = "";
        txtprice.Text = "";


        txtdes.Value = "";
        txtQuantity.Text = "";
    }

    private void MessageBox(string msg)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + msg + "');", true);
    }

    protected void ddlcatg_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlcatg.SelectedIndex > 0)
        {
            int selectedCatID = Convert.ToInt32(ddlcatg.SelectedValue);
            LoadSubCategories(selectedCatID);
        }
        else
        {
            ddlsubcatg.Items.Clear();
        }
    }

    private void LoadSubCategories(int catID)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM tblSubCategory WHERE MainCatID = @CatID", con);
            cmd.Parameters.AddWithValue("@CatID", catID);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                ddlsubcatg.DataSource = dt;
                ddlsubcatg.DataTextField = "SubCatName";
                ddlsubcatg.DataValueField = "SubCatID";
                ddlsubcatg.DataBind();
                ddlsubcatg.Items.Insert(0, "Select SubCategory");
            }
            else
            {
                ddlsubcatg.Items.Clear();
                ddlsubcatg.Items.Insert(0, "No subcategories found");
            }
        }
        catch (Exception ex)
        {
            MessageBox("Error: " + ex.Message);
        }
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        BindGridView();
    }


    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

        try
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            FileUpload Imageupdate1 = (FileUpload)GridView1.Rows[e.RowIndex].FindControl("Imageupdate1") as FileUpload;
            FileUpload Imageupdate2 = (FileUpload)GridView1.Rows[e.RowIndex].FindControl("Imageupdate2") as FileUpload;
            FileUpload Imageupdate3 = (FileUpload)GridView1.Rows[e.RowIndex].FindControl("Imageupdate3") as FileUpload;

            TextBox txtcname = (TextBox)GridView1.Rows[e.RowIndex].FindControl("ddlcatg.SelectedItem.Text");
            TextBox txtproname = (TextBox)GridView1.Rows[e.RowIndex].FindControl("ddlsubcatg.SelectedItem.Text");
            TextBox txtbrand = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtbrand.Text");
            TextBox txtdes = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtdes.Text");
            TextBox txtprice = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtprice");





            if (Imageupdate1.HasFile || Imageupdate2.HasFile || Imageupdate3.HasFile)
            {
                string fileName = System.IO.Path.Combine(Server.MapPath("~/AdminManage/ProductImages/"), Imageupdate1.FileName);
                Imageupdate1.SaveAs(fileName);

                string fileName2 = System.IO.Path.Combine(Server.MapPath("~/AdminManage/ProductImages/"), Imageupdate2.FileName);
                Imageupdate2.SaveAs(fileName2);

                string fileName3 = System.IO.Path.Combine(Server.MapPath("~/AdminManage/ProductImages/"), Imageupdate3.FileName);
                Imageupdate3.SaveAs(fileName3);

                SqlCommand cmd = new SqlCommand("UPDATE ProductsAdd SET Image1, Image2, Image3, CatName, SubCatName, BrandName, Price, Size, Description, Quantity, TotalPrice, Discount, FreeDelivery, DeliveryCharges, Rating, COD) VALUES (@Image1, @Image2, @Image3, @CatName, @SubCatName, @BrandName, @Price, @Size, @Description, @Quantity, @TotalPrice, @Discount, @FreeDelivery, @DeliveryCharges, @Rating, @COD WHERE ID=@ID", con);
                cmd.Parameters.AddWithValue("@Image1", Imageupdate1.FileName);
                cmd.Parameters.AddWithValue("@Image2", Imageupdate2.FileName);
                cmd.Parameters.AddWithValue("@Image3", Imageupdate3.FileName);
                cmd.Parameters.AddWithValue("@CatName", ddlcatg.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@SubCatName", ddlsubcatg.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@BrandName", txtbrand.Text);
                cmd.Parameters.AddWithValue("@Price", Convert.ToDecimal(txtprice.Text));
                cmd.Parameters.AddWithValue("@Size", txtSize.Text);
                cmd.Parameters.AddWithValue("@Description", txtdes);
                cmd.Parameters.AddWithValue("@Quantity", Convert.ToInt32(txtQuantity.Text));
                cmd.Parameters.AddWithValue("@FreeDelivery", ddlFreeDelivery.SelectedItem.Text == "Yes");
                cmd.Parameters.AddWithValue("@Rating", Convert.ToInt32(ddlRating.SelectedItem.Text)); // Assuming Rating is an integer field
                cmd.Parameters.AddWithValue("@COD", chkCOD.Text);


                cmd.Parameters.AddWithValue("@ID", id);

                con.Open();
                int res = cmd.ExecuteNonQuery();
                con.Close();

                if (res > 0)
                {
                    MessageBox("Data updated successfully");
                    GridView1.EditIndex = -1;
                    BindGridView();
                }
                else
                {
                    MessageBox("Failed to update Data");
                }
            }
            else
            {
                MessageBox("Please select the file");
            }
        }
        catch (Exception ex)
        {
            MessageBox("Error: " + ex.Message);
        }
    }



    // Method to save uploaded image and return the file name
    private string SaveImageAndGetFileName(FileUpload fileUpload)
    {
        string fileName = Path.GetFileName(fileUpload.FileName);
        string filePath = Server.MapPath("~/AdminManage/ProductImages/") + fileName; // Assuming the images are saved in the Images folder
        fileUpload.SaveAs(filePath);
        return fileName;
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        BindGridView();
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            SqlCommand cmd = new SqlCommand("DELETE FROM ProductsAdd WHERE ID=@ID", con);
            cmd.Parameters.AddWithValue("@ID", id);

            con.Open();
            int rowsAffected = cmd.ExecuteNonQuery();
            con.Close();

            if (rowsAffected > 0)
            {
                MessageBox("Product deleted successfully.");
            }
            else
            {
                MessageBox("Failed to delete product.");
            }

            BindGridView();
        }
        catch (Exception ex)
        {
            MessageBox("Error: " + ex.Message);
        }
    }

    protected void btnExportToExcel_Click(object sender, EventArgs e)
    {
        ExportGridToExcel();
    }

    private void ExportGridToExcel()
    {
        Response.Clear();
        Response.Buffer = true;
        Response.ClearContent();
        Response.ClearHeaders();
        Response.Charset = "";
        string FileName = "Vithal_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".xls";
        StringWriter strwritter = new StringWriter();
        HtmlTextWriter htmltextwritter = new HtmlTextWriter(strwritter);
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache);
        Response.ContentType = "application/vnd.ms-excel";
        Response.AddHeader("content-disposition", "attachement;filename=" + FileName);
        BindGridView();
        //GridView1.RenderControl(htmltextwritter);
        Response.Output.Write(strwritter.ToString());
        Response.End();

    }

    //protected void btnPrint_Click(object sender, EventArgs e)
    //{
    //    // Generate PDF bill
    //    GeneratePDFBill();
    //}

    //private void GeneratePDFBill()
    //{
    //    // Create a new PDF document
    //    Document doc = new Document();
    //    MemoryStream memoryStream = new MemoryStream();
    //    PdfWriter writer = PdfWriter.GetInstance(doc, memoryStream);

    //    // Open the document for writing
    //    doc.Open();

    //    // Set up fonts and colors
    //    BaseFont baseFont = BaseFont.CreateFont(BaseFont.HELVETICA, BaseFont.CP1252, BaseFont.NOT_EMBEDDED);
    //    Font titleFont = new Font(baseFont, 18, Font.BOLD, BaseColor.BLACK);
    //    Font cellFont = new Font(baseFont, 12, Font.NORMAL, BaseColor.BLACK);
    //    BaseColor lightGray = new BaseColor(240, 240, 240);

    //    // Add title
    //    Paragraph title = new Paragraph("Invoice", titleFont);
    //    title.Alignment = Element.ALIGN_CENTER;
    //    title.SpacingAfter = 20f;
    //    doc.Add(title);

    //    // Add content to the document
    //    PdfPTable table = new PdfPTable(4); // Number of columns
    //    table.WidthPercentage = 100;
    //    table.SpacingAfter = 10f;

    //    // Add header cells with background color and borders
    //    AddCellWithBackgroundAndBorders(table, "Product", lightGray, cellFont);
    //    AddCellWithBackgroundAndBorders(table, "Price", lightGray, cellFont);
    //    AddCellWithBackgroundAndBorders(table, "Quantity", lightGray, cellFont);
    //    AddCellWithBackgroundAndBorders(table, "Total Price", lightGray, cellFont);

    //    // Fetch data from the database
    //    string connectionString = @"Data Source=DESKTOP-L5B8JV8\MSSQLSERVER02;Initial Catalog=FashionAdda;Integrated Security=True";
    //    string query = "SELECT SubCatName, Price, Quantity, TotalPrice FROM ProductsAdd"; // Modify this query accordingly

    //    using (SqlConnection connection = new SqlConnection(connectionString))
    //    {
    //        SqlCommand command = new SqlCommand(query, connection);
    //        connection.Open();
    //        SqlDataReader reader = command.ExecuteReader();

    //        while (reader.Read())
    //        {
    //            // Retrieve data from the database
    //            string product = reader["SubCatName"].ToString();
    //            string price = reader["Price"].ToString();
    //            string quantity = reader["Quantity"].ToString();
    //            string totalPrice = reader["TotalPrice"].ToString();

    //            // Add row data to the PDF table with borders
    //            AddCellWithBorders(table, product, cellFont);
    //            AddCellWithBorders(table, price, cellFont);
    //            AddCellWithBorders(table, quantity, cellFont);
    //            AddCellWithBorders(table, totalPrice, cellFont);
    //        }
    //    }

    //    // Add the table to the document
    //    doc.Add(table);

    //    // Close the document
    //    doc.Close();

    //    // Clear the response content and set content type and headers
    //    Response.Clear();
    //    Response.ContentType = "application/pdf";
    //    Response.AddHeader("Content-Disposition", "attachment; filename=Bill.pdf");
    //    Response.Cache.SetCacheability(HttpCacheability.NoCache);

    //    // Write the PDF content to the response stream
    //    Response.BinaryWrite(memoryStream.ToArray());
    //    Response.End();
    //}

    //private void AddCellWithBackgroundAndBorders(PdfPTable table, string text, BaseColor backgroundColor, Font font)
    //{
    //    PdfPCell cell = new PdfPCell(new Phrase(text, font));
    //    cell.BackgroundColor = backgroundColor;
    //    cell.BorderWidth = 1f;
    //    table.AddCell(cell);
    //}

    //private void AddCellWithBorders(PdfPTable table, string text, Font font)
    //{
    //    PdfPCell cell = new PdfPCell(new Phrase(text, font));
    //    cell.BorderWidth = 1f;
    //    table.AddCell(cell);
    //}




}

