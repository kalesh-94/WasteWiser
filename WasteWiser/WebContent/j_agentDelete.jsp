<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.waste.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Agent</title>
</head>
<body>

	<%
		int agentId = Integer.parseInt(request.getParameter("agId"));
	
		Connection con = DbConnection.connect();

		PreparedStatement pstmt7 = con.prepareStatement("delete from agents where agentId=?");
		pstmt7.setInt(1, agentId);

		int i = pstmt7.executeUpdate();
		if (i > 0) {
			response.sendRedirect("i_adminviewAgents.jsp");
		}
	%>

</body>
</html>