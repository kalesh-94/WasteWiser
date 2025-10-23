<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.waste.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Pickup Request</title>
</head>
<body>

	<%
		int pickupId = Integer.parseInt(request.getParameter("reqId"));
	
		Connection con = DbConnection.connect();

		PreparedStatement pstmt10 = con.prepareStatement("delete from pickuprequest where pickupId=?");
		pstmt10.setInt(1, pickupId);

		int i = pstmt10.executeUpdate();
		if (i > 0) {
			response.sendRedirect("o_adminViewRequest.jsp	");
		}
	%>

</body>
</html>