using System;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;

public partial class AdminManage_LoginPage : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=DESKTOP-E9ANIN8;Initial Catalog=FashionAdda;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        // You may add some initialization code here if needed
    }

    protected void btnSignIn_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(txtUsername.Text) || string.IsNullOrEmpty(txtPassword.Text))
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please enter both username and password');", true);
            return;
        }

        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM Users WHERE Username=@Username AND Password=@Password AND UserRole=@UserRole", con);
            cmd.Parameters.AddWithValue("@Username", txtUsername.Text);
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
            cmd.Parameters.AddWithValue("@UserRole", DropDownList1.SelectedValue);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            string ProfileImage = dt.Rows[0]["ProfileImage"].ToString();

            if (dt.Rows.Count > 0)
            {
                // Login successful
                Session["Username"] = txtUsername.Text;
                Session["ProfileImage"] = ProfileImage;
                Response.Redirect("~/AdminManage/Admin.aspx");

                // Alert box for successful login
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Login successful!');", true);
            }
            else
            {
                // Invalid username, password, or user role
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Invalid username, password, or user role.');", true);
            }
        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('An error occurred: " + ex.Message + "');", true);
        }
        finally
        {
            con.Close();
        }
    }

}
