using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;

public partial class AdminDashboard_Menu : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=DESKTOP-E9ANIN8;Initial Catalog=MESS;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Bind GridViewMenu
            BindGridViewMenu();
        }
    }

    protected void ButtonAddMenu_Click(object sender, EventArgs e)
    {
        // Get the values from the form
        string day = DropDownListDay.SelectedValue;
        string breakfast = TextBoxBreakfast.Text;
        string lunch = TextBoxLunch.Text;
        string dinner = TextBoxDinner.Text;
        string financialyr = TextBoxFinancialYear.Text; // Corrected line

        // Check if a file is uploaded
        if (FileUploadDishImage.HasFile)
        {
            // Save the image to a folder and get the image URL
            string imageUrl = SaveImage(FileUploadDishImage.PostedFile);

            // Insert data into the database
            InsertMenu(day, breakfast, lunch, dinner, imageUrl, financialyr);
        }
    }

    protected void BindGridViewMenu()
    {
        // Database connection string
        string connectionString = ConfigurationManager.ConnectionStrings["dbms"].ConnectionString;

        // SQL query to select menu data
        string query = "SELECT * FROM Menu";

        // Create connection and command objects
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                // Open connection
                connection.Open();

                // Execute command and load data into GridViewMenu
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                GridViewMenu.DataSource = dt;
                GridViewMenu.DataBind();
            }
        }
    }

    protected void InsertMenu(string day, string breakfast, string lunch, string dinner, string imageUrl, string financialyr)
    {
        // Database connection string
        string connectionString = ConfigurationManager.ConnectionStrings["dbms"].ConnectionString;

        // SQL query to insert menu data
        string query = "INSERT INTO Menu (Day, Breakfast, Lunch, Dinner, ImageUrl, FinancialYear) VALUES (@Day, @Breakfast, @Lunch, @Dinner, @ImageUrl, @FinancialYear)";

        // Create connection and command objects
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                // Add parameters
                command.Parameters.AddWithValue("@Day", day);
                command.Parameters.AddWithValue("@Breakfast", breakfast);
                command.Parameters.AddWithValue("@Lunch", lunch);
                command.Parameters.AddWithValue("@Dinner", dinner);
                command.Parameters.AddWithValue("@ImageUrl", imageUrl);
                command.Parameters.AddWithValue("@FinancialYear", financialyr);

                // Open connection
                connection.Open();

                // Execute command
                command.ExecuteNonQuery();

                // Re-bind GridViewMenu to refresh data
                BindGridViewMenu();
            }
        }
    }


    protected string SaveImage(HttpPostedFile file)
    {
        // Specify the folder path to save the image
        string folderPath = Server.MapPath("~/AdminDashboard/Meal/");

        // Generate a unique file name
        string fileName = Guid.NewGuid().ToString() + "_" + file.FileName;

        // Save the file to the specified folder
        file.SaveAs(folderPath + fileName);

        // Return the URL of the saved image
        return "~/AdminDashboard/Meal/" + fileName;
    }
}
