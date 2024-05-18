using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class AdminManage_AddNotice : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=DESKTOP-L5B8JV8\\MSSQLSERVER02;Initial Catalog=Dynamic;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGridView(); // Load GridView data on initial page load
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string noticeText = TextBox1.Text.Trim();

        if (!string.IsNullOrEmpty(noticeText))
        {
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["dbms"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO Notices (NoticeText, DateAdded) VALUES (@NoticeText, @DateAdded)";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@NoticeText", noticeText);
                    cmd.Parameters.AddWithValue("@DateAdded", DateTime.Now);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    // Refresh GridView after inserting notice
                    BindGridView();

                    // Clear TextBox after adding notice
                    TextBox1.Text = string.Empty;
                }
            }
            catch (Exception ex)
            {

            }
        }
    }

    protected void BindGridView()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["dbms"].ConnectionString;
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            string query = "SELECT NoticeText, DateAdded FROM Notices ORDER BY DateAdded DESC";
            SqlDataAdapter adapter = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();

            con.Open();
            adapter.Fill(dt);
            con.Close();

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = GridView1.Rows[e.RowIndex];
        string noticeText = (row.FindControl("txtNoticeText") as TextBox).Text;

        if (!string.IsNullOrEmpty(noticeText))
        {
            int noticeId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["dbms"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "UPDATE Notices SET NoticeText = @NoticeText WHERE NoticeId = @NoticeId";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@NoticeText", noticeText);
                    cmd.Parameters.AddWithValue("@NoticeId", noticeId);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    GridView1.EditIndex = -1;
                    BindGridView();
                }
            }
            catch (Exception ex)
            {
                //lblErrorMessage.Text = "Failed to update notice: " + ex.Message;
                //lblErrorMessage.Visible = true;
            }
        }
    }
}