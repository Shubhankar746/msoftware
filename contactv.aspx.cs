using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class AdminManage_contactv : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dbms"].ConnectionString);

    private void messageBox(string sms)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Showalert", "alert('" + sms + "')", true);
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Show();
        }
    }
    protected void btnSearchNumber_Click(object sender, EventArgs e)
    {
        try
        {
            string searchNumber = txtSearchNumber.Text.Trim();
            SqlCommand cmd = new SqlCommand("SELECT * FROM contacttable WHERE mobileno = @mobileno", con);
            cmd.Parameters.AddWithValue("@mobileno", searchNumber);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            else
            {
                // If no records found, display a message or clear the GridView
                GridView1.DataSource = null;
                GridView1.DataBind();
                messageBox("No records found for the given number.");
            }
        }
        catch (Exception ex)
        {
            messageBox(ex.Message);
        }
    }

    public void Show()
    {
        try
        {
            SqlCommand cmd = new SqlCommand("Select * from contacttable", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            else
            {
                GridView1.DataSource = null;
                GridView1.DataBind();
            }

        }
        catch (Exception ex)
        {
            messageBox(ex.Message);
        }
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "View")
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            string id = GridView1.DataKeys[rowIndex].Value.ToString();
            Response.Redirect("ViewContactDetails.aspx?id=" + id);

        }
    }
}