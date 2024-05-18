<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="AdminDashboard_Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Login</title>
    <!-- base:css -->
    <link rel="stylesheet" href="vendors/typicons/typicons.css" />
    <link rel="stylesheet" href="vendors/css/vendor.bundle.base.css" />
    <link rel="stylesheet" href="css/vertical-layout-light/style.css" />
    <!-- endinject -->
    <style>
        body {
            color: #000;
            overflow-x: hidden;
            height: 100%;
            background-color: #B0BEC5;
            background-repeat: no-repeat;
        }

        .card0 {
            box-shadow: 0px 4px 8px 0px #757575;
            border-radius: 0px;
        }

        .card2 {
            margin: 0px 40px;
        }

        .image {
            width: 100%;
            height: auto;
        }

        .line {
            height: 1px;
            width: 45%;
            background-color: #E0E0E0;
            margin-top: 10px;
        }

        .or {
            width: 10%;
            font-weight: bold;
        }

        .text-sm {
            font-size: 14px !important;
        }

        ::placeholder {
            color: #BDBDBD;
            opacity: 1;
            font-weight: 300;
        }

        :-ms-input-placeholder {
            color: #BDBDBD;
            font-weight: 300;
        }

        ::-ms-input-placeholder {
            color: #BDBDBD;
            font-weight: 300;
        }

        input, textarea {
            padding: 10px 12px 10px 12px;
            border: 1px solid lightgrey;
            border-radius: 2px;
            margin-bottom: 5px;
            margin-top: 2px;
            width: 100%;
            box-sizing: border-box;
            color: #2C3E50;
            font-size: 14px;
            letter-spacing: 1px;
        }

        input:focus, textarea:focus {
            -moz-box-shadow: none !important;
            -webkit-box-shadow: none !important;
            box-shadow: none !important;
            border: 1px solid #304FFE;
            outline-width: 0;
        }

        button:focus {
            -moz-box-shadow: none !important;
            -webkit-box-shadow: none !important;
            box-shadow: none !important;
            outline-width: 0;
        }

        a {
            color: inherit;
            cursor: pointer;
        }

        .btn-blue {
            background-color: #1A237E;
            width: 150px;
            color: #fff;
            border-radius: 2px;
        }

        .btn-blue:hover {
            color: white;
            cursor: pointer;
        }

        .bg-blue {
            color: #fff;
            background-color: #1A237E;
        }

        @media screen and (max-width: 991px) {
            .image {
                width: 300px;
                height: 220px;
            }

            .card2 {
                margin: 0px 15px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid px-1 px-md-5 px-lg-1 px-xl-5 py-5 mx-auto">
            <a href="Hostel_Software.html">BACK TO HOME</a>
            <div class="card card0 border-0">
                <div class="row d-flex">
                    <div class="col-md-6">
                        <div class="card1 pb-5">
                            <div class="row px-3 justify-content-center mt-4 mb-5 border-line">
                                <img src="images1/login.jpg" class="image" />
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="card2 card border-0 px-4 py-5">
                            <div class="row mb-4 px-3">
                                <h1 class="mb-0 mr-4 mt-2">HOSTEL MANAGEMENT</h1>
                            </div>
                            <div class="row px-3 mb-4">
                                <div class="line"></div>
                                <small class="or text-center"></small>
                                <div class="line"></div>
                            </div>
                            <div class="row px-3">
                                <asp:Label ID="LabelUserType" runat="server" CssClass="mb-1"><h6 class="mb-0 text-sm">UserType</h6></asp:Label>
                                <asp:DropDownList ID="DropDownListUserType" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="Select">Select</asp:ListItem>
                                    <asp:ListItem Value="Admin">Admin</asp:ListItem>
                                    <asp:ListItem Value="Operator">Operator</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="row px-3">
                                <asp:Label ID="LabelUsername" runat="server" CssClass="mb-1"><h6 class="mb-0 text-sm">Username</h6></asp:Label>
                                <asp:TextBox ID="txtuser" runat="server" CssClass="mb-4" Placeholder="Enter a valid username"></asp:TextBox>
                            </div>
                            <div id="pp" class="row px-3">
                                <asp:Label ID="LabelPassword" runat="server" CssClass="mb-1"><h6 class="mb-0 text-sm">Password</h6></asp:Label>
                                <asp:TextBox ID="txtpass" runat="server" TextMode="Password" Placeholder="Enter password"></asp:TextBox>
                            </div>
                            <div class="row px-3 mb-4">
                                <div class="custom-control custom-checkbox custom-control-inline">
                                    <asp:LinkButton ID="LinkButtonForgotPassword" runat="server" CssClass="text-sm" OnClick="ForgotPassword_Click">Forgot Password</asp:LinkButton>
                                </div>
                            </div>
                            <div class="row mb-3 px-3">
                                <asp:Button ID="ButtonLogin" runat="server" CssClass="btn btn-blue text-center" Text="Login" OnClick="Login_Click" />
                            </div>
                            <div class="row mb-4 px-3">
                                <small class="font-weight-bold"><a class="text-danger"></a></small>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="bg-blue py-4">
                    <div class="row px-3">
                        <small class="ml-4 ml-sm-5 mb-2">Copyright &copy; 2024. All rights reserved. Designed & Developed by Csdtitsolution</small>
                        <div class="social-contact ml-4 ml-sm-auto">
                            <span class="fa fa-facebook mr-4 text-sm"></span>
                            <span class="fa fa-google-plus mr-4 text-sm"></span>
                            <span class="fa fa-linkedin mr-4 text-sm"></span>
                            <span class="fa fa-twitter mr-4 mr-sm-5 text-sm"></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
