using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
public partial class AdminDashboard_register : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=DESKTOP-E9ANIN8;Initial Catalog=FashionAdda;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["dbms"].ConnectionString;
        string username = txtUsername.Text.Trim();
        string email = txtEmail.Text.Trim();
        string password = txtPassword.Text;
        //string mobile = txtmobile.Text;
        string UserRole = DropDownList1.SelectedValue.ToString();


        if (fileProfileImage.HasFile)
        {

            string str = fileProfileImage.FileName;
            fileProfileImage.PostedFile.SaveAs(Server.MapPath("~/AdminDashboard/ProfileImages/" + str));
            string Image = "~/AdminDashboard/ProfileImages/" + str.ToString();

            try                
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "INSERT INTO Users (Username, Email, Password, ProfileImage,UserRole) VALUES (@Username, @Email, @Password, @ProfileImage,@UserRole)";
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@Username", username);
                        command.Parameters.AddWithValue("@Email", email);
                        command.Parameters.AddWithValue("@Password", password);
                        command.Parameters.AddWithValue("@ProfileImage", Image);
                        //command.Parameters.AddWithValue("@mobile", mobile);

                        command.Parameters.AddWithValue("@UserRole", UserRole);

                        command.ExecuteNonQuery();
                    }
                }
                lblMessage.Text = "Registration successful!";

            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
            }
        }
    }
}
