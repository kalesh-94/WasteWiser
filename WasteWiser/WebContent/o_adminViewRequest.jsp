<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="com.waste.*"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin View Pickup Requests - WasteWise</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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

.page-title {
    text-align: center;
    font-size: 2.5rem;
    color: var(--primary);
    font-weight: 600;
    margin-bottom: 2rem;
}

.table-container {
    max-width: 1200px;
    margin: 0 auto;
    background: white;
    border-radius: 8px;
    box-shadow: var(--shadow);
    overflow: hidden;
}

table {
    width: 100%;
    border-collapse: collapse;
}

th {
    background-color: var(--primary);
    color: white;
    padding: 15px 20px;
    text-align: left;
    font-weight: 600;
    font-size: 1rem;
}

td {
    padding: 12px 20px;
    border-bottom: 1px solid #e0e0e0;
    color: var(--text);
}

tr:hover {
    background-color: #f8f9fa;
}

.remove-link {
    color: var(--error);
    text-decoration: none;
    padding: 6px 12px;
    border: 1px solid var(--error);
    border-radius: 4px;
    transition: all 0.3s;
    font-weight: 500;
}

.remove-link:hover {
    background-color: var(--error);
    color: white;
    text-decoration: none;
}

.footer {
    text-align: center;
    margin-top: 2rem;
    padding: 1rem;
    color: var(--text);
    border-top: 1px solid #ddd;
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
				<a href="b_adminDashboard.html"
					style="color: white; text-decoration: none; margin-left: 20px;">Dashboard</a>
				<a href="i_adminviewAgents.jsp"
					style="color: white; text-decoration: none; margin-left: 20px;">View
					Agents</a> <a href="k_viewcitizens.jsp"
					style="color: white; text-decoration: none; margin-left: 20px;">View
					Citizens</a> <a href="#"
					style="color: white; text-decoration: none; margin-left: 20px; background-color: rgba(255, 255, 255, 0.1);">View
					Requests</a>
			</div>
		</div>
	</div>

	<h1 class="page-title">Pickup Requests</h1>

	

	<div class="table-container">
		<table>
			<thead>
				<tr>
					<th>Request ID</th>
					<th>Citizen ID</th>
					<th>Waste Type</th>
					<th>Preferred Date</th>
					<th>Preferred Time</th>
					<th>Address</th>
					<th>Status</th>
					<th>Assigned Agent</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<%
					Connection con = DbConnection.connect();
					PreparedStatement pstmt9 = con.prepareStatement("select * from pickuprequest");
					ResultSet rs = pstmt9.executeQuery();

					while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getInt(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=rs.getString(4)%></td>
					<td><%=rs.getString(5)%></td>
					<td><%=rs.getString(6)%></td>
					<td><%=rs.getString(7)%></td>
					<td><%=rs.getString(8)%></td>
					
					<td><a href="p_requestDelete.jsp?reqId=<%=rs.getInt(1)%>"
						class="remove-link">Remove</a></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>

	<div class="footer">
		<p>&copy; 2025 WasteWise. All rights reserved.</p>
	</div>

	<%
		rs.close();
		pstmt9.close();
		con.close();
	%>
</body>
</html>