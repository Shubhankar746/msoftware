using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminManage_AddCarousel : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-E9ANIN8;Initial Catalog=FashionAdda;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetDatas();
        }
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        try
        {
            if (FileUpload1.HasFile)
            {
                string filename = FileUpload1.FileName;
                FileUpload1.SaveAs(Server.MapPath("~/AdminManage/images1/") + filename);

                SqlCommand cmd = new SqlCommand("INSERT INTO Repeater3 ( Image) VALUES ( @Image)", con);
                cmd.Parameters.AddWithValue("@Image", filename);

                con.Open();
                int result = cmd.ExecuteNonQuery();
                con.Close();

                if (result > 0)
                {
                    MessageBox("Data Saved");
                    GetDatas();
                }
                else
                {
                    MessageBox("Failed to save data");
                }
            }
            else
            {
                MessageBox("Please select an image file");
            }
        }
        catch (Exception ex)
        {
            MessageBox(ex.Message);
        }
    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/Admin.aspx");
    }

    protected void GetDatas()
    {
        try
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM Repeater3", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        catch (Exception ex)
        {
            MessageBox(ex.Message);
        }
    }

    protected void GridView1_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        GetDatas();
    }



    protected void GridView1_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        GetDatas();
    }

    private void MessageBox(string msg)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + msg + "');", true);
    }

    protected void GridView1_RowDeleting1(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
    {
        try
        {
            int idd = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            SqlCommand cmd = new SqlCommand("Delete from Repeater3 WHERE ID=@ID", con);
            cmd.Parameters.AddWithValue("@ID", idd);

            con.Open();
            int res = cmd.ExecuteNonQuery();
            con.Close();

            if (res > 0)
            {
                MessageBox("DATA has been deleted");
            }
            else
            {
                MessageBox("DATA has been failed");

            }
        }
        catch (Exception ex)
        {
            MessageBox(ex.Message);
        }
    }

    protected void GridView1_RowCancelingEdit1(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        GetDatas();
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string connectionString = "Data Source=DESKTOP-E9ANIN8;Initial Catalog=FashionAdda;Integrated Security=True";

        int idup = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

        try
        {
            //int rowIndex = e.RowIndex;
            FileUpload fileUpload1 = (FileUpload)GridView1.Rows[e.RowIndex].FindControl("FileUpload1");

            //string uploadFolder = Server.MapPath("~/Admin/images/");

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE Repeater3 SET Image=@Image WHERE ID=@ID", con);

                if (fileUpload1.HasFile)
                {
                    string uimg = fileUpload1.FileName.ToString();
                    // string upImage = Path.Combine(uploadFolder, fileUpload1.FileName);
                    fileUpload1.PostedFile.SaveAs(Server.MapPath("~/AdminManage/images1/") + uimg);
                    cmd.Parameters.AddWithValue("@Image", uimg);
                    cmd.Parameters.AddWithValue("@ID", idup);

                    int rowsAffected = cmd.ExecuteNonQuery();


                    if (rowsAffected > 0)
                    {
                        GridView1.EditIndex = -1;
                        GetDatas();
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Data has been updated successfully');", true);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Failed to update data');", true);
                    }
                }
            }
        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + ex.Message + "');", true);
        }
    }
}

