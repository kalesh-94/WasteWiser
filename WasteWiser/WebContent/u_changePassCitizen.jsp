<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.waste.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Password - WasteWise</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style>
:root {
    --primary: #2e7d32;
    --primary-light: #4caf50;
    --primary-dark: #1b5e20;
    --secondary: #ff9800;
    --accent: #009688;
    --text: #333333;
    --background: #f5f5f5;
    --card-bg: #ffffff;
    --error: #f44336;
    --shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body {
    background-color: var(--background);
    color: var(--text);
    line-height: 1.6;
    min-height: 100vh;
    padding: 20px;
}

.header {
    background-color: var(--primary);
    color: white;
    padding: 1rem 0;
    box-shadow: var(--shadow);
    margin-bottom: 2rem;
    border-radius: 8px;
}

.header-content {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.logo {
    display: flex;
    align-items: center;
    gap: 10px;
}

.logo i {
    font-size: 2rem;
}

.logo h1 {
    font-size: 1.8rem;
    font-weight: 700;
}

.nav-links a {
    color: white;
    text-decoration: none;
    margin-left: 20px;
    padding: 8px 16px;
    border-radius: 4px;
    transition: background-color 0.3s;
}

.nav-links a:hover {
    background-color: var(--primary-dark);
}

.page-title {
    text-align: center;
    font-size: 2.5rem;
    color: var(--primary);
    font-weight: 600;
    margin-bottom: 2rem;
}

.form-container {
    max-width: 500px;
    margin: 0 auto;
    background: white;
    border-radius: 12px;
    box-shadow: var(--shadow);
    padding: 2rem;
}

.form-group {
    margin-bottom: 1.5rem;
}

.form-group label {
    display: block;
    margin-bottom: 0.5rem;
    font-weight: 600;
    color: var(--primary-dark);
}

.form-input {
    width: 100%;
    padding: 12px 16px;
    border: 2px solid #e0e0e0;
    border-radius: 6px;
    font-size: 1rem;
    transition: border-color 0.3s;
    background-color: white;
}

.form-input:focus {
    outline: none;
    border-color: var(--primary);
}

.btn {
    padding: 12px 24px;
    border: none;
    border-radius: 6px;
    font-size: 1rem;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s;
    text-decoration: none;
    display: inline-flex;
    align-items: center;
    gap: 8px;
    text-align: center;
}

.btn-primary {
    background-color: var(--primary);
    color: white;
    width: 100%;
    justify-content: center;
}

.btn-primary:hover {
    background-color: var(--primary-dark);
    transform: translateY(-2px);
}

.btn-secondary {
    background-color: #6c757d;
    color: white;
    width: 100%;
    justify-content: center;
    margin-top: 1rem;
}

.btn-secondary:hover {
    background-color: #545b62;
}

.alert {
    padding: 1rem;
    border-radius: 6px;
    margin-bottom: 1.5rem;
    border-left: 4px solid;
}

.alert-success {
    background-color: #d4edda;
    border-color: var(--primary);
    color: var(--primary-dark);
}

.alert-error {
    background-color: #f8d7da;
    border-color: var(--error);
    color: #721c24;
}

.footer {
    text-align: center;
    margin-top: 2rem;
    padding: 1rem;
    color: var(--text);
    border-top: 1px solid #ddd;
}

.password-requirements {
    background: #f8f9fa;
    padding: 1rem;
    border-radius: 6px;
    margin-top: 1rem;
    font-size: 0.9rem;
}

.password-requirements h4 {
    color: var(--primary);
    margin-bottom: 0.5rem;
}

.password-requirements ul {
    list-style: none;
    padding-left: 0;
}

.password-requirements li {
    margin-bottom: 0.3rem;
    display: flex;
    align-items: center;
    gap: 0.5rem;
}

.password-requirements li i {
    color: var(--primary);
    font-size: 0.8rem;
}
</style>
</head>
<body>
    <div class="header">
        <div class="header-content">
            <div class="logo">
                <i class="fas fa-recycle"></i>
                <h1>WasteWise</h1>
            </div>
            <div class="nav-links">
                <a href="e_citizenDashboard.html">Dashboard</a>
                <a href="requestPickup.jsp">Request Pickup</a>
                <a href="n_pickupReqCitizen.html">View Status</a>
                <a href="citizenChangePassword.jsp">Change Password</a>
                <a href="c_citizenLogin.html">Logout</a>
            </div>
        </div>
    </div>

    <h1 class="page-title">Change Password</h1>

    <div class="form-container">
        <%
            String success = request.getParameter("success");
            String error = request.getParameter("error");
            
            if (success != null) {
        %>
            <div class="alert alert-success">
                <i class="fas fa-check-circle"></i> <%= success %>
            </div>
        <%
            }
            
            if (error != null) {
        %>
            <div class="alert alert-error">
                <i class="fas fa-exclamation-circle"></i> <%= error %>
            </div>
        <%
            }
        %>

        <form action="citizenChangePassword" method="post" onsubmit="return validatePassword()">
            <div class="form-group">
                <label for="currentPassword">
                    <i class="fas fa-lock"></i> Current Password
                </label>
                <input type="password" id="currentPassword" name="currentPassword" 
                       class="form-input" required placeholder="Enter your current password">
            </div>

            <div class="form-group">
                <label for="newPassword">
                    <i class="fas fa-key"></i> New Password
                </label>
                <input type="password" id="newPassword" name="newPassword" 
                       class="form-input" required placeholder="Enter new password">
            </div>

            <div class="form-group">
                <label for="confirmPassword">
                    <i class="fas fa-key"></i> Confirm New Password
                </label>
                <input type="password" id="confirmPassword" name="confirmPassword" 
                       class="form-input" required placeholder="Confirm new password">
            </div>

            <button type="submit" class="btn btn-primary">
                <i class="fas fa-save"></i> Change Password
            </button>
            
            <a href="citizenDashboard.html" class="btn btn-secondary">
                <i class="fas fa-arrow-left"></i> Back to Dashboard
            </a>
        </form>

        
    </div>

    <div class="footer">
        <p>&copy; 2025 WasteWise. All rights reserved.</p>
    </div>
<script>
	function validatePassword(){
	const newPassword = document.getElementById("newPassword").value.trim();
    const confirmPassword = document.getElementById("confirmPassword").value.trim();

    if (newPassword !== confirmPassword) {
        alert("New Password and Confirm Password must Same !");
        return false; // prevent form submission
    }
    
    
    return true;
	
}



</script>
		



   
    
</body>
</html>