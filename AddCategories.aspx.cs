using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web;
//using iTextSharp.text;
//using iTextSharp.text.pdf;
using System.Configuration;
using System.Web.UI.WebControls;

public partial class AdminManage_AddCategories : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGridview();
        }
    }

    private void BindGridview()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["dbms"].ConnectionString;
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand("SELECT CatID, CatName FROM tblCategory", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            GridViewCategories.DataSource = dt;
            GridViewCategories.DataBind();
        }
    }

    protected void btnAddCategory_Click(object sender, EventArgs e)
    {
        string categoryName = txtCategory.Text.Trim();

        if (!string.IsNullOrEmpty(categoryName))
        {
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["dbms"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO tblCategory (CatName) VALUES (@CatName)", con);
                    cmd.Parameters.AddWithValue("@CatName", categoryName);
                    cmd.ExecuteNonQuery();

                    // Display success message using JavaScript alert
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Category Added Successfully');", true);

                    // Clear text input
                    txtCategory.Text = string.Empty;

                    // Rebind GridView after adding new category
                    BindGridview();
                }
            }
            catch (Exception ex)
            {
                Response.Write("An error occurred: " + ex.Message);
            }
        }
        else
        {
            // Show error message if category name is empty
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please enter a category name.');", true);
        }
    }

    protected void GridViewCategories_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridViewCategories.EditIndex = e.NewEditIndex;
        BindGridview();
    }

    protected void GridViewCategories_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridViewCategories.EditIndex = -1;
        BindGridview();
    }

    protected void GridViewCategories_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = GridViewCategories.Rows[e.RowIndex];
        int categoryId = Convert.ToInt32(GridViewCategories.DataKeys[e.RowIndex].Value);
        TextBox txtEditCatName = (TextBox)row.FindControl("txtEditCatName");
        string categoryName = txtEditCatName.Text.Trim();

        try
        {
            string connectionString = ConfigurationManager.ConnectionStrings["dbms"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE tblCategory SET CatName = @CatName WHERE CatID = @CatID", con);
                cmd.Parameters.AddWithValue("@CatID", categoryId);
                cmd.Parameters.AddWithValue("@CatName", categoryName);
                cmd.ExecuteNonQuery();

                // Exit edit mode
                GridViewCategories.EditIndex = -1;

                // Rebind GridView after updating category
                BindGridview();
            }
        }
        catch (Exception ex)
        {
            Response.Write("An error occurred: " + ex.Message);
        }
    }

    protected void GridViewCategories_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int rowIndex = e.RowIndex;

            if (rowIndex >= 0 && rowIndex < GridViewCategories.Rows.Count)
            {
                // Retrieve the category ID from DataKeys using the correct row index
                int categoryId = Convert.ToInt32(GridViewCategories.DataKeys[rowIndex].Value);

                string connectionString = ConfigurationManager.ConnectionStrings["dbms"].ConnectionString;

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();

                    SqlCommand cmd = new SqlCommand("DELETE FROM tblCategory WHERE CatID = @CatID", con);
                    cmd.Parameters.AddWithValue("@CatID", categoryId);
                    cmd.ExecuteNonQuery();

                    // Rebind GridView after deleting category
                    BindGridview();
                }
            }
            else
            {
                throw new Exception("Invalid row index for deletion.");
            }
        }
        catch (Exception ex)
        {
            Response.Write("An error occurred: " + ex.Message);
        }
    }


    //protected void btnPrintBill_Click(object sender, EventArgs e)
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

    //    // Add content to the document
    //    // For example, add bill details from database
    //    PdfPTable table = new PdfPTable(2); // 2 columns
    //    table.AddCell("CatID");
    //    table.AddCell("CatName");

    //    // Fetch data from database
    //    string connectionString = @"Data Source=DESKTOP-E9ANIN8;Initial Catalog=FashionAdda;Integrated Security=True";
    //    string query = "SELECT CatID, CatName FROM  tblCategory";

    //    using (SqlConnection connection = new SqlConnection(connectionString))
    //    {
    //        SqlCommand command = new SqlCommand(query, connection);
    //        connection.Open();
    //        SqlDataReader reader = command.ExecuteReader();

    //        while (reader.Read())
    //        {
    //            // Add data to PDF table
    //            table.AddCell(reader["CatID"].ToString());
    //            table.AddCell(reader["CatName"].ToString());
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


}
