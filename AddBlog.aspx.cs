using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class AdminManage_AddBlog : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-E9ANIN8;Initial Catalog=FashionAdda;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGridView();
        }
    }

    protected void btnsend_Click(object sender, EventArgs e)
    {
        try
        {
            if (FileUpload1.HasFile)
            {
                string blogpic = FileUpload1.FileName;
                string filePath = "~/AdminManage/blogpic1/   " + blogpic;
                FileUpload1.SaveAs(Server.MapPath(filePath));

                using (SqlConnection con = new SqlConnection("Data Source=DESKTOP-E9ANIN8;Initial Catalog=FashionAdda;Integrated Security=True"))
                {
                    SqlCommand cmd = new SqlCommand("INSERT INTO AddProduct (Image, title, description, date) VALUES (@Image, @title, @description, @date)", con);
                    cmd.Parameters.AddWithValue("@Image", filePath);
                    cmd.Parameters.AddWithValue("@title", txttitle.Text.Trim());
                    cmd.Parameters.AddWithValue("@description", txtdes.InnerText.Trim());
                    cmd.Parameters.AddWithValue("@date", txtdate.Text);

                    con.Open();
                    int res = cmd.ExecuteNonQuery();

                    if (res > 0)
                    {
                        Response.Write("Product has been added successfully!");
                        BindGridView();
                    }
                    else
                    {
                        Response.Write("Failed to add product!");
                    }
                }
            }
            else
            {
                Response.Write("Please select a file to upload.");
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }

    private void BindGridView()
    {


        using (SqlConnection con = new SqlConnection("Data Source=DESKTOP-E9ANIN8;Initial Catalog=FashionAdda;Integrated Security=True"))
        {
            SqlCommand cmd = new SqlCommand("SELECT ID, Image, title, description, date FROM AddProduct", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        ClearFields();
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
            int idd = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            SqlCommand cmd = new SqlCommand("DELETE FROM AddProduct WHERE ID = @ID", con);
            cmd.Parameters.AddWithValue("@ID", idd);

            con.Open();
            int res = cmd.ExecuteNonQuery();

            if (res > 0)
            {
                Response.Write("Product has been Deleted");
                BindGridView();
            }
            else
            {
                Response.Write("Product Data Failed!!!");
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        finally
        {
            con.Close();
        }
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            int idup = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            FileUpload fileUpload = (FileUpload)GridView1.Rows[e.RowIndex].FindControl("FileUpload2");
            TextBox updesc = (TextBox)GridView1.Rows[e.RowIndex].FindControl("updesc");
            TextBox uptitle = (TextBox)GridView1.Rows[e.RowIndex].FindControl("uptitle");
            TextBox update = (TextBox)GridView1.Rows[e.RowIndex].FindControl("update");

            string filePath = "";
            if (fileUpload.HasFile)
            {
                string upimg = fileUpload.FileName;
                filePath = "~/1/blogpic1/" + upimg;
                fileUpload.PostedFile.SaveAs(Server.MapPath(filePath));
            }

            using (SqlConnection con = new SqlConnection("Data Source=DESKTOP-L5B8JV8\\MSSQLSERVER02;Initial Catalog=Dynamic;Integrated Security=True"))
            {
                SqlCommand cmd = new SqlCommand("UPDATE AddProduct SET Image=@Image, title=@title, description=@description, date=@date WHERE id=@id", con);
                cmd.Parameters.AddWithValue("@Image", filePath);
                cmd.Parameters.AddWithValue("@title", uptitle.Text);
                cmd.Parameters.AddWithValue("@description", updesc.Text);
                cmd.Parameters.AddWithValue("@date", update.Text);
                cmd.Parameters.AddWithValue("@ID", idup);

                con.Open();
                int res = cmd.ExecuteNonQuery();

                if (res > 0)
                {
                    Response.Write("Product Has Been Updated Successfully");
                    BindGridView();
                }
                else
                {
                    Response.Write("Product Update Failed!!!");
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        BindGridView();
    }

    private void ClearFields()
    {
        txttitle.Text = "";
        txtdes.InnerText = "";
        txtdate.Text = "";
    }
}
