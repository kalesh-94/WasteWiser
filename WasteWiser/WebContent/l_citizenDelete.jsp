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
		int CitizenId = Integer.parseInt(request.getParameter("ciId"));
	
		Connection con = DbConnection.connect();

		PreparedStatement pstmt8 = con.prepareStatement("delete from citizens where CitizenId=?");
		pstmt8.setInt(1, CitizenId);

		int i = pstmt8.executeUpdate();
		if (i > 0) {
			response.sendRedirect("k_viewcitizens.jsp");
		}
	%>

</body>
</html>