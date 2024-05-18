using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Web.UI;

public partial class AdminManage_AddSubCategories : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindMainCat();
            BindSubCatGridView();
        }
    }

    private void BindSubCatGridView()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["dbms"].ConnectionString;
        string query = "SELECT A.SubCatID, A.SubCatName, B.CatName AS MainCategoryName " +
                       "FROM tblSubCategory A INNER JOIN tblCategory B ON B.CatID = A.MainCatID";

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                GridViewSubCategories.DataSource = dt;
                GridViewSubCategories.DataBind();
            }
        }
    }

    protected void btnAddSubCategory_Click(object sender, EventArgs e)
    {
        string subCatName = txtSubCategory.Text.Trim();
        int mainCatID = Convert.ToInt32(ddlMainCatID.SelectedValue);

        string connectionString = ConfigurationManager.ConnectionStrings["dbms"].ConnectionString;
        string query = "INSERT INTO tblSubCategory (SubCatName, MainCatID) VALUES (@SubCatName, @MainCatID)";

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@SubCatName", subCatName);
                cmd.Parameters.AddWithValue("@MainCatID", mainCatID);

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        // Display success message using JavaScript alert
        ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('SubCategory Added Successfully');", true);

        // Clear input fields
        txtSubCategory.Text = string.Empty;
        ddlMainCatID.ClearSelection();
        ddlMainCatID.Items.FindByValue("0").Selected = true;

        // Rebind SubCategory GridView
        BindSubCatGridView();
    }

    private void BindMainCat()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["dbms"].ConnectionString;
        string query = "SELECT CatID, CatName FROM tblCategory";

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                ddlMainCatID.DataSource = reader;
                ddlMainCatID.DataTextField = "CatName";
                ddlMainCatID.DataValueField = "CatID";
                ddlMainCatID.DataBind();

                // Insert default/select option
                ddlMainCatID.Items.Insert(0, new ListItem("-Select-", "0"));
            }
        }
    }

    protected void GridViewSubCategories_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridViewSubCategories.EditIndex = e.NewEditIndex;
        BindSubCatGridView();
    }

    protected void GridViewSubCategories_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridViewSubCategories.EditIndex = -1;
        BindSubCatGridView();
    }

    protected void GridViewSubCategories_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = GridViewSubCategories.Rows[e.RowIndex];
        int subCatID = Convert.ToInt32(GridViewSubCategories.DataKeys[e.RowIndex].Value);
        TextBox txtEditSubCategoryName = (TextBox)row.FindControl("txtEditSubCategoryName");
        string subCatName = txtEditSubCategoryName.Text.Trim();

        string connectionString = ConfigurationManager.ConnectionStrings["dbms"].ConnectionString;
        string query = "UPDATE tblSubCategory SET SubCatName = @SubCatName WHERE SubCatID = @SubCatID";

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@SubCatName", subCatName);
                cmd.Parameters.AddWithValue("@SubCatID", subCatID);

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        GridViewSubCategories.EditIndex = -1;
        BindSubCatGridView();
    }

    protected void GridViewSubCategories_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int subCatID = Convert.ToInt32(GridViewSubCategories.DataKeys[e.RowIndex].Value);

        string connectionString = ConfigurationManager.ConnectionStrings["dbms"].ConnectionString;
        string query = "DELETE FROM tblSubCategory WHERE SubCatID = @SubCatID";

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@SubCatID", subCatID);

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        BindSubCatGridView();
    }
}
