<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoginPage.aspx.cs" Inherits="AdminManage_LoginPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="." />
    <meta name="author" content="" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- app favicon -->
    <link rel="shortcut icon" href="assets/img/favicon.ico">
    <!-- google fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <!-- plugin stylesheets -->
    <link rel="stylesheet" type="text/css" href="assets/css/vendors.css" />
    <!-- app style -->
    <link rel="stylesheet" type="text/css" href="assets/css/style.css" />
    <style>
        body {
    background-color: #f4f4f4;
    font-family: 'Roboto', sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
}

.login-container {
    width: 400px;
}

.login {
    background: #fff;
    padding: 40px;
    border-radius: 10px;
    box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.1);
}

.login h1 {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 20px;
}

.form-group {
    margin-bottom: 20px;
}

.form-control {
    width: 100%;
    padding: 15px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
}

.btn-primary {
    width: 100%;
    background-color: #ff6600;
    color: #fff;
    border: none;
    border-radius: 5px;
    padding: 15px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.btn-primary:hover {
    background-color: #ff8533;
}

.options {
    margin-top: 20px;
    text-align: center;
}

.options a {
    color: #333;
    text-decoration: none;
}

.options a:hover {
    text-decoration: underline;
}

</style>


</head>
<body>
    <form id="form1" runat="server">
        <div>

            <div class="app">
                <div class="app-wrap">
                   
                    <div class="app-contant">
                        <div class="bg-white">
                            <div class="container-fluid p-0">
                                <div class="row no-gutters">
                                    <div class="col-sm-6 col-lg-5 col-xxl-3  align-self-center order-2 order-sm-1">
                                        <div class="d-flex align-items-center h-100-vh">
                                            <div class="login p-50">
                                                <h1 class="mb-2"></h1>
                                                <p>Welcome back, please login to your account.</p>
                                                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Username"></asp:TextBox>
                                                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Password"></asp:TextBox>
                             <asp:DropDownList ID="DropDownList1" runat="server"  CssClass="form-control">
                             <asp:ListItem>
                                 User
                                 
                             </asp:ListItem>

                             <asp:ListItem>
                                 Admin
                                 
                             </asp:ListItem>    
                         </asp:DropDownList>
                                                <asp:Button ID="btnSignIn" runat="server" Text="Sign In" CssClass="btn btn-primary text-uppercase" OnClick="btnSignIn_Click" />
                                                <div class="signup-link">
                                                    Don't have an account? <a href="../Ecommerce-website/Signup.aspx">Sign Up</a>
                                                </div>
                                                <div class="forgot-password-link">
        <a href="Forget.aspx">Forgot Password?</a>
    </div>         
                                            </div>
                                        </div>
                                    </div>
                               
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
       
            
     

    </form>
    <!-- plugins -->
    <script src="assets/js/vendors.js"></script>

    <!-- custom app -->
    <script src="assets/js/app.js"></script>

   
      <!-- plugins -->
    <script src="assets/js/vendors.js"></script>

    <!-- custom app -->
    <script src="assets/js/app.js"></script>

</body>
</html>