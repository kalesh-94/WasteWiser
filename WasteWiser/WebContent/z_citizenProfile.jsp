<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.waste.*, java.sql.*, java.text.SimpleDateFormat, java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Citizen Profile - WasteWise</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style>
/* Simplified styles */
body {
	font-family: 'Segoe UI', sans-serif;
	background: #f5f5f5;
	margin: 0;
	padding: 0;
}

.header {
	background: #2e7d32;
	color: white;
	padding: 15px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.header h1 {
	margin: 0;
}

.nav-links a {
	color: white;
	margin-left: 15px;
	text-decoration: none;
}

.profile-container {
	max-width: 900px;
	margin: 40px auto;
	background: white;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.profile-header {
	display: flex;
	align-items: center;
	gap: 15px;
	margin-bottom: 20px;
}

.profile-avatar {
	width: 80px;
	height: 80px;
	border-radius: 50%;
	background: #2e7d32;
	color: white;
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 2rem;
}

.detail-row {
	margin-bottom: 10px;
}

.detail-label {
	font-weight: bold;
	color: #2e7d32;
	width: 120px;
	display: inline-block;
}

.alert {
	padding: 10px;
	border-radius: 5px;
	margin-bottom: 15px;
}

.alert-success {
	background: #d4edda;
	color: #155724;
}

.alert-error {
	background: #f8d7da;
	color: #721c24;
}

.footer {
	text-align: center;
	margin-top: 40px;
	color: gray;
}
</style>
</head>
<body>

	<div class="header">
		<h1>
			<i class="fas fa-recycle"></i> WasteWise
		</h1>
		<div class="nav-links">
			<ul>
				<a href="e_citizenDashboard.html" class="active">Dashboard</a>
				<a href="n_pickupReqCitizen.html">Request Pickup</a>
				<a href="u_changePassCitizen.jsp">Change Password</a>
				<a href="c_citizenLogin.html">Logout</a>
			</ul>
			
			
		</div>
	</div>

	<div class="profile-container">
		<%
			String successMessage = request.getParameter("success");
			String errorMessage = request.getParameter("error");

			try {
				Connection con = DbConnection.connect();
				int citizenId = GetSetCitizenId.getCitizenId(); // Assuming similar class as GetSetAgentId

				PreparedStatement ps = con.prepareStatement("SELECT * FROM citizens WHERE CitizenId=?");
				ps.setInt(1, citizenId);
				ResultSet rs = ps.executeQuery();

				if (rs.next()) {
					String citizenName = rs.getString("Name");
					String citizenEmail = rs.getString("Email");
					String citizenContact = rs.getString("Contact");
					String citizenAddress = rs.getString("Address");
					String citizenZone = rs.getString("Zone");
		%>

		<%
			if (successMessage != null) {
		%>
		<div class="alert alert-success">
			<i class="fas fa-check-circle"></i>
			<%=successMessage%></div>
		<%
			} else if (errorMessage != null) {
		%>
		<div class="alert alert-error">
			<i class="fas fa-exclamation-circle"></i>
			<%=errorMessage%></div>
		<%
			}
		%>

		<div class="profile-header">
			<div class="profile-avatar">
				<i class="fas fa-user"></i>
			</div>
			<div>
				<h2><%=citizenName%></h2>
				<p>
					Citizen ID: #<%=citizenId%></p>
			</div>
		</div>

		<div class="detail-row">
			<span class="detail-label">Email:</span>
			<%=citizenEmail%></div>
		<div class="detail-row">
			<span class="detail-label">Contact:</span>
			<%=citizenContact%></div>
		<div class="detail-row">
			<span class="detail-label">Address:</span>
			<%=citizenAddress%></div>
		<div class="detail-row">
			<span class="detail-label">Zone:</span>
			<%=citizenZone%></div>
		<div class="detail-row">
			<span class="detail-label">Member Since:</span>
			<%=new SimpleDateFormat("MMMM yyyy").format(new Date())%></div>

		<%
			} else {
		%>
		<div class="alert alert-error">
			<i class="fas fa-times-circle"></i> Citizen not found.
		</div>
		<%
			}
				rs.close();
				ps.close();
				con.close();
			} catch (Exception e) {
				out.println("<div class='alert alert-error'>Error: " + e.getMessage() + "</div>");
			}
		%>
	</div>

	<div class="footer">&copy; 2025 WasteWise. All rights reserved.</div>
</body>
</html>
