<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.waste.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Assigned Pickups - WasteWise</title>
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

.cards-container {
    max-width: 1200px;
    margin: 0 auto;
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
    gap: 1.5rem;
    padding: 0 10px;
}

.pickup-card {
    background: white;
    border-radius: 12px;
    box-shadow: var(--shadow);
    padding: 1.5rem;
    border-left: 4px solid var(--primary);
    transition: all 0.3s ease;
    position: relative;
    margin-bottom: 20px; /* ✅ ensures next card is separate */
}

.pickup-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 15px rgba(0, 0, 0, 0.15);
}

.card-header {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    margin-bottom: 1rem;
    padding-bottom: 1rem;
    border-bottom: 2px solid #f0f0f0;
}

.pickup-id {
    font-size: 1.1rem;
    font-weight: 700;
    color: var(--primary);
    background: #e8f5e8;
    padding: 4px 12px;
    border-radius: 20px;
}

.status-badge {
    padding: 6px 12px;
    border-radius: 20px;
    font-size: 0.85rem;
    font-weight: 600;
    text-align: center;
    display: inline-block;
}

.status-pending {
    background-color: #fff3cd;
    color: #856404;
    border: 1px solid #ffeaa7;
}

.status-assigned {
    background-color: #d1ecf1;
    color: #0c5460;
    border: 1px solid #bee5eb;
}

.status-completed {
    background-color: #d4edda;
    color: #155724;
    border: 1px solid #c3e6cb;
}

.status-delayed {
    background-color: #f8d7da;
    color: #721c24;
    border: 1px solid #f5c6cb;
}

.card-details {
    margin-bottom: 1.5rem;
}

.detail-row {
    display: flex;
    margin-bottom: 0.8rem;
    align-items: flex-start;
}

.detail-label {
    font-weight: 600;
    color: var(--primary-dark);
    min-width: 120px;
    font-size: 0.9rem;
}

.detail-value {
    color: var(--text);
    flex: 1;
    font-size: 0.95rem;
}

.waste-type {
    display: inline-block;
    background: #e3f2fd;
    color: #1976d2;
    padding: 4px 10px;
    border-radius: 15px;
    font-size: 0.85rem;
    font-weight: 500;
}

.card-actions {
    display: flex;
    justify-content: flex-end;
    gap: 0.8rem;
    padding-top: 1rem;
    border-top: 1px solid #f0f0f0;
}

.btn {
    padding: 8px 16px;
    border: none;
    border-radius: 6px;
    font-size: 0.9rem;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s;
    text-decoration: none;
    display: inline-flex;
    align-items: center;
    gap: 5px;
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

.btn-outline {
    background-color: transparent;
    color: var(--primary);
    border: 2px solid var(--primary);
}

.btn-outline:hover {
    background-color: var(--primary);
    color: white;
}

.no-data {
    text-align: center;
    padding: 4rem 2rem;
    color: var(--text);
    font-size: 1.1rem;
    grid-column: 1 / -1;
    background: white;
    border-radius: 12px;
    box-shadow: var(--shadow);
}

.no-data i {
    font-size: 4rem;
    margin-bottom: 1rem;
    color: #ddd;
}

.footer {
    text-align: center;
    margin-top: 3rem;
    padding: 1rem;
    color: var(--text);
    border-top: 1px solid #ddd;
}

.priority-high {
    border-left-color: var(--error);
}

.priority-medium {
    border-left-color: var(--secondary);
}

.priority-low {
    border-left-color: var(--accent);
}

.date-badge {
    background: #fff8e1;
    color: #ff8f00;
    padding: 4px 10px;
    border-radius: 15px;
    font-size: 0.8rem;
    font-weight: 500;
    display: inline-flex;
    align-items: center;
    gap: 4px;
}

@media (max-width: 768px) {
    .cards-container {
        grid-template-columns: 1fr;
        padding: 0 5px;
    }
    
    .pickup-card {
        padding: 1rem;
    }
    
    .card-header {
        flex-direction: column;
        gap: 0.5rem;
    }
    
    .detail-row {
        flex-direction: column;
        gap: 0.2rem;
    }
    
    .detail-label {
        min-width: auto;
    }
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
                <a href="r_agentDashboard.html">Dashboard</a>
                <a href="s_agentViewAssignedPickups.jsp">My Pickups</a>
                <a href="changePassword.jsp">Change Password</a>
                <a href="f_agentLogin.html">Logout</a>
                
                <a href="t_agentProfile.jsp"><i class="fas fa-user"></i> Profile</a>
            </div>
        </div>
    </div>

    <h1 class="page-title">My Assigned Pickups</h1>

    <div class="cards-container">
        <%
          
            int AssignedAgentId = GetSetAgentId.getAgentId(); 
            
           
              Connection con = DbConnection.connect();
                
                
              PreparedStatement pstmt = con.prepareStatement("SELECT * FROM pickuprequest WHERE AssignedAgentId=?");
              pstmt.setInt(1, AssignedAgentId);
              ResultSet rs = pstmt.executeQuery();

                boolean hasData = false;
                
                while (rs.next()) {
                 int CitizenId = rs.getInt(2);
                 PreparedStatement  pstmt12 = con.prepareStatement("SELECT * FROM citizens WHERE CitizenId=?");
                    pstmt12.setInt(1, CitizenId);
                   ResultSet rs1 = pstmt12.executeQuery();
                
                    String citizenName = "";
                    if (rs1.next()) {
                        citizenName = rs1.getString("name");
                    }

                    hasData = true;
                    String status = rs.getString("status");
                    String wasteType = rs.getString("Waste Type");
                    String preferredDate = rs.getString("preferredDate");
                    String address = rs.getString("address");
                    
                    // Close the inner result set
                    if (rs1 != null) {
                        rs1.close();
                        rs1 = null;
                    }
                    if (pstmt12 != null) {
                        pstmt12.close();
                        pstmt12 = null;
                    }
                 
        %>
        
        <div style="margin: 10px; padding: 10px;" class="pickup-card <%= rs.getInt(1) %>">
            <div class="card-header">
                <div class="pickup-id">
                    <i class="fas fa-hashtag"></i> <%= rs.getInt(1) %>
                </div>
                <span class="status-badge status-<%= status.toLowerCase() %>">
                    <i class="fas fa-circle" style="font-size: 0.6rem;"></i> <%= status %>
                </span>
            </div>
            
            <div class="card-details">
                <div class="detail-row">
                    <span class="detail-label">Citizen:</span>
                    <span class="detail-value"><%= citizenName %></span>
                </div>
                
                <div class="detail-row">
                    <span class="detail-label">Citizen ID:</span>
                    <span class="detail-value">#<%= CitizenId %></span>
                </div>
                
                <div class="detail-row">
                    <span class="detail-label">Address:</span>
                    <span class="detail-value"><%= address %></span>
                </div>
                
                <div class="detail-row">
                    <span class="detail-label">Waste Type:</span>
                    <span class="detail-value">
                        <span class="waste-type">
                            <i class="fas fa-trash"></i> <%= wasteType %>
                        </span>
                    </span>
                </div>
                
                <div class="detail-row">
                    <span class="detail-label">Preferred Date:</span>
                    <span class="detail-value">
                        <span class="date-badge">
                            <i class="fas fa-calendar"></i> <%= preferredDate %>
                        </span>
                    </span>
                </div>
            </div>

			<div class="card-actions">
				<form action="updatePickupStatus" method="post"
					style="display: inline;">
					<input type="hidden" name="pickupId" value="<%=rs.getInt(1)%>">
					<select name="status" class="btn btn-outline" required>
						<option value="">Update Status</option>
						<option value="Pickup Completed">Pickup Completed</option>
						<option value="Ongoing">Ongoing</option>
					</select>
					<button type="submit" class="btn btn-primary">
						<i class="fas fa-edit"></i> Submit
					</button>
				</form>
			</div>
			</div>
			<%
                }
				

				if (!hasData) {
			%>
        <div class="no-data">
            <i class="fas fa-inbox"></i>
            <h3>No Assigned Pickups</h3>
            <p>You don't have any pickup assignments at the moment.</p>
            <p style="color: #666; font-size: 0.9rem; margin-top: 0.5rem;">
                New assignments will appear here when assigned by admin.
            </p>
        </div>
       
        <div class="no-data">
            <i class="fas fa-exclamation-triangle"></i>
            <h3>Error Loading Data</h3>
            <p>There was an error loading your assigned pickups.</p>
            <p style="color: #666; font-size: 0.9rem; margin-top: 0.5rem;">
                Please try again later or contact administrator.
            </p>
        </div>
      <%
                }
      %>
        
    </div>

    <div class="footer">
        <p>&copy; 2025 WasteWise. All rights reserved.</p>
    </div>
</body>
</html>