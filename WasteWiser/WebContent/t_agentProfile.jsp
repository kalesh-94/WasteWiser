<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.waste.*, java.sql.*, java.text.SimpleDateFormat, java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Agent Profile - WasteWise</title>
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

.status-section {
	margin-top: 20px;
	background: #f8f9fa;
	padding: 15px;
	border-radius: 6px;
}

.stats {
	display: flex;
	justify-content: space-around;
	margin-top: 30px;
}

.stat {
	text-align: center;
}

.stat-number {
	font-size: 2rem;
	color: #2e7d32;
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
			<a href="r_agentDashboard.html">Dashboard</a> <a
				href="s_agentViewAssignedPickups.jsp">My Pickups</a> <a
				href="w_changePassAgent.jsp">Change Password</a> <a
				href="f_agentLogin.html">Logout</a>
		</div>
	</div>

	<div class="profile-container">
		<%
			String successMessage = request.getParameter("success");
			String errorMessage = request.getParameter("error");
			String currentStatus = "available";

			try {
				Connection con = DbConnection.connect();
				int agentId = GetSetAgentId.getAgentId();

				// Update status if form submitted
				if ("POST".equalsIgnoreCase(request.getMethod())) {
					String newStatus = request.getParameter("status");
					if (newStatus != null && (newStatus.equals("available") || newStatus.equals("busy"))) {
						PreparedStatement updateStmt = con
								.prepareStatement("UPDATE agents SET status=? WHERE agentId=?");
						updateStmt.setString(1, newStatus);
						updateStmt.setInt(2, agentId);
						int rows = updateStmt.executeUpdate();
						updateStmt.close();
						if (rows > 0)
							response.sendRedirect("t_agentProfile.jsp?success=Status updated successfully!");
						else
							response.sendRedirect("t_agentProfile.jsp?error=Failed to update status");
						return;
					}
				}

				// Fetch agent info
				PreparedStatement ps = con.prepareStatement("SELECT * FROM agents WHERE agentId=?");
				ps.setInt(1, agentId);
				ResultSet rs = ps.executeQuery();

				if (rs.next()) {
					String agentName = rs.getString("name");
					String agentEmail = rs.getString("email");
					String agentContact = rs.getString("contact");
					String agentZone = rs.getString("zone");
					currentStatus = rs.getString("status") != null ? rs.getString("status") : "available";

					PreparedStatement statsStmt = con.prepareStatement("SELECT "
							+ "(SELECT COUNT(*) FROM pickuprequest WHERE AssignedAgentId=? AND status='Completed') AS completed, "
							+ "(SELECT COUNT(*) FROM pickuprequest WHERE AssignedAgentId=? AND status='Assigned') AS assigned, "
							+ "(SELECT COUNT(*) FROM pickuprequest WHERE AssignedAgentId=? AND status='Pending') AS pending");
					statsStmt.setInt(1, agentId);
					statsStmt.setInt(2, agentId);
					statsStmt.setInt(3, agentId);
					ResultSet statsRs = statsStmt.executeQuery();

					int completed = 0, assigned = 0, pending = 0;
					if (statsRs.next()) {
						completed = statsRs.getInt("completed");
						assigned = statsRs.getInt("assigned");
						pending = statsRs.getInt("pending");
					}
					statsRs.close();
					statsStmt.close();
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
				<i class="fas fa-user-tie"></i>
			</div>
			<div>
				<h2><%=agentName%></h2>
				<p>
					Agent ID: #<%=agentId%></p>
			</div>
		</div>

		<div class="detail-row">
			<span class="detail-label">Email:</span>
			<%=agentEmail%></div>
		<div class="detail-row">
			<span class="detail-label">Contact:</span>
			<%=agentContact%></div>
		<div class="detail-row">
			<span class="detail-label">Zone:</span>
			<%=agentZone%></div>
		<div class="detail-row">
			<span class="detail-label">Member Since:</span>
			<%=new SimpleDateFormat("MMMM yyyy").format(new Date())%></div>

		<div class="status-section">
			<h3>
				<i class="fas fa-user-clock"></i> Availability Status
			</h3>
			<p>
				<strong>Current:</strong>
				<%=currentStatus%></p>
			<form method="post">
				<button name="status" value="available">Available</button>
				<button name="status" value="busy">Busy</button>
			</form>
		</div>

		<div class="stats">
			<div class="stat">
				<div class="stat-number"><%=completed%></div>
				<div>Completed</div>
			</div>
			<div class="stat">
				<div class="stat-number"><%=assigned%></div>
				<div>Assigned</div>
			</div>
			<div class="stat">
				<div class="stat-number"><%=pending%></div>
				<div>Pending</div>
			</div>
		</div>

		<%
			} else {
		%>
		<div class="alert alert-error">
			<i class="fas fa-times-circle"></i> Agent not found.
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
