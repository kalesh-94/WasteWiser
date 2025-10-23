<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.waste.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Assign Pickup - WasteWise</title>
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
    max-width: 800px;
    margin: 0 auto;
    background: white;
    border-radius: 8px;
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

.form-select {
    width: 100%;
    padding: 12px 16px;
    border: 2px solid #e0e0e0;
    border-radius: 6px;
    font-size: 1rem;
    transition: border-color 0.3s;
    background-color: white;
}

.form-select:focus {
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
    display: inline-block;
    text-align: center;
}

.btn-primary {
    background-color: var(--primary);
    color: white;
}

.btn-primary:hover {
    background-color: var(--primary-dark);
    transform: translateY(-2px);
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

.alert-danger {
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

.pickup-info {
    background-color: #f8f9fa;
    padding: 1rem;
    border-radius: 6px;
    margin-bottom: 1rem;
    border-left: 4px solid var(--primary);
}

.info-label {
    font-weight: 600;
    color: var(--primary-dark);
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
                <a href="b_adminDashboard.html">Dashboard</a>
                <a href="#">View Citizens</a>
                <a href="h_addAgents.html">Add Agent</a>
                <a href="assign-pickup">Assign Pickup</a>
            </div>
        </div>
    </div>

    <h1 class="page-title">Assign Pickup Requests</h1>

  
        
       

        <form action="AssignPickup" method="post">
            <div class="form-group">
                <label><i class="fas fa-trash-alt"></i> Select Request:</label>
                <select name="pickupId" class="form-select" required>
                    <% 
                       Connection con = DbConnection.connect();
                       PreparedStatement ps = con.prepareStatement("SELECT pickupId, Address FROM pickuprequest WHERE status='Pending'");
                       ResultSet rs = ps.executeQuery();
                       while(rs.next()){
                    %>
                       <option value="<%=rs.getInt("pickupId")%>">
                          Request:-<%=rs.getInt("pickupId")%> - <%=rs.getString("Address")%>
                       </option>
                    <% } %>
                </select>
            </div>

            <div class="form-group">
                <label><i class="fas fa-user-tie"></i> Select Available Agent:</label>
                <select name="agentId" class="form-select" required>
                    <% 
                       ps = con.prepareStatement("SELECT agentId, Name, status FROM agents");
                       rs = ps.executeQuery();
                       while(rs.next()){
                    %>
                       <option value="<%=rs.getInt("agentId")%>">
                          <%=rs.getString("Name")%> (ID: <%=rs.getInt("agentId")%>) (Status: <%=rs.getString("status")%>)
                       </option>
                    <% } %>
                </select>
            </div>

            <button type="submit" class="btn btn-primary">
                <i class="fas fa-tasks"></i> Assign Pickup
            </button>
        </form>
    </div>
    
 

    <div class="footer">
        <p>&copy; 2025 WasteWise. All rights reserved.</p>
    </div>

    <%
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (con != null) con.close();
    %>
</body>
</html>