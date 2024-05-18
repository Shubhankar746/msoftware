<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="AdminDashboard_register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Signup Page</title>
    <!-- Add necessary meta tags, stylesheets, or scripts here -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>
    <style>
        /* Custom CSS styles for the form */
        body {
            background-color: rgba(240, 240, 240, 0.7); /* Semi-transparent light gray background */
            font-family: Arial, sans-serif; 
        }

        .container {
            width: 500px;
            margin: auto;
            margin-top: 80px;
            background-color: rgba(51, 51, 51, 0.8); /* Semi-transparent dark background */
            padding: 20px; /* Add padding */
            border-radius: 8px;
            box-shadow: 0px 0px 20px 0px rgba(0, 0, 0, 0.5); /* Soft shadow effect */
            border: 2px solid #4CAF50; /* Border color */
            color: #fff; /* Text color */
        }

        h1 {
            text-align: center; /* Center align the heading */
            color: #ff6347; /* Tomato color for heading */
            margin-bottom: 20px; /* Bottom margin for spacing */
        }

        .form-group {
            margin-bottom: 20px; /* Bottom margin for spacing */
        }

        .form-control {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ff6347; /* Input border color */
            border-radius: 4px;
            background-color: rgba(248, 249, 250, 0.7); /* Semi-transparent light gray background for input */
            color: #333; /* Text color for input */
        }

        .btn {
            width: 100%; /* Full width button */
            background-color: #007bff; /* Blue color for button */
            border: none; /* No border */
            color: white; /* White text color */
            padding: 10px; /* Padding for button */
            cursor: pointer; /* Cursor style on hover */
            transition: background-color 0.3s; /* Smooth transition effect */
        }

        .btn:hover {
            background-color: #0056b3; /* Darker blue color on hover */
        }

        #btnUploadImage {
            width: 100%; /* Full width button */
            background-color: #28a745; /* Green color for button */
            border: none; /* No border */
            color: white; /* White text color */
            padding: 10px; /* Padding for button */
            cursor: pointer; /* Cursor style on hover */
            transition: background-color 0.3s; /* Smooth transition effect */
            text-align: center; /* Center align the text */
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1); /* Glow effect */
        }

        #btnUploadImage:hover {
            background-color: #218838; /* Darker green color on hover */
            box-shadow: 0 0 30px rgba(0, 0, 0, 0.2); /* Increase glow on hover */
        }

        /* Additional colorful design elements */
        #signupContainer h1 {
            color: #ff6347; /* Tomato color for heading */
            margin-bottom: 20px; /* Bottom margin for spacing */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div id="signupContainer">
                        <h1>Sign Up Now</h1>
                    </div>
                    <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                    <div class="form-group">
                        <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Username" Required="true"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email"  Required="true"></asp:TextBox>
                    </div>
                    <div class="form-group"> 
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Password" Required="true"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="fileProfileImage" id="btnUploadImage" class="btn">Upload Profile Image</label>
                        <asp:FileUpload ID="fileProfileImage" runat="server" />
                    </div>
                   <%-- <div class="form-group">
                        <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" placeholder="Mobile" TextMode="SingleLine" Required="true"></asp:TextBox>
                    </div>--%>
                    <div class="form-group">
                        <asp:DropDownList ID="DropDownList1" runat="server"  CssClass="form-control">
                            <asp:ListItem Value="User">User</asp:ListItem>
                            <asp:ListItem Value="Admin">Admin</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" OnClientClick="return validateInputs();" />
                    </div>
                    <div class="col-12 mt-3">
                        <p>Already have an account? <a href="LoginPage.aspx">Sign In</a></p>
                    </div>
                </div>   
            </div>
        </div>
    </form>

    <script>
        function validateInputs() {
            var username = document.getElementById('<%= txtUsername.ClientID %>').value;
            var email = document.getElementById('<%= txtEmail.ClientID %>').value;
            var password = document.getElementById('<%= txtPassword.ClientID %>').value;
<%--            var mobile = document.getElementById('<%= txtMobile.ClientID %>').value;--%>

            // Regular expression to match only alphabets
            var alphabetPattern = /^[a-zA-Z]+$/;

            // Validate Username
            if (!alphabetPattern.test(username)) {
                alert('Please enter a valid username with alphabets only.');
                return false;
            }

            // Validate Email (You can add email validation here if needed)

            // Validate Password (You can add password validation here if needed)

            // Validate Mobile (You can add mobile validation here if needed)

            return true;
        }

      <%--  // Show selected file name on the button label
        document.getElementById('<%= fileProfileImage.ClientID %>').addEventListener('change', function () {
            var fileName = this.value.split('\\').pop();
            document.getElementById('<%= btnUploadImage.ClientID %>').textContent = fileName;
        });--%>
    </script>
</body>
</html>
