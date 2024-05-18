using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminDashboard_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {


        if (!IsPostBack)
        {
            // Check if user is authenticated and session variables are set
            if (Session["Username"] != null && Session["ProfileImage"] != null)
            {
                Label1.Text = Session["Username"].ToString();
                Image1.ImageUrl = Session["ProfileImage"].ToString();
                // Load data when page first loads
            }
            else
            {
                Response.Redirect("~/AdminDashboard/Login.aspx");
            }
        }
    }
}



