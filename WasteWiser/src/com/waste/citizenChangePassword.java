package com.waste;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class citizenChangePassword
 */
public class citizenChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public citizenChangePassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Connection con = DbConnection.connect();
		
		String currentPassword = request.getParameter("currentPassword");
		String newPassword = request.getParameter("newPassword");
		String confirmPassword = request.getParameter("confirmPassword");
		int citizenId = GetSetCitizenId.getCitizenId();
		
		try {
			PreparedStatement pstmt14 = con.prepareStatement("UPDATE citizens SET Password=? WHERE CitizenId=? AND Password=?");
			
			pstmt14.setString(1, newPassword);
			pstmt14.setInt(2, citizenId);
			pstmt14.setString(3, currentPassword);
		
			
			int i = pstmt14.executeUpdate();
			if(i>0){
				response.sendRedirect("e_citizenDashboard.html");
				System.out.println("password Changed successfully ");
			}
			else{
				System.out.println("password is not chnaged something went wrong !!!!!!!!");
				response.sendRedirect("v_errorPageCitizen.html");
			}
		
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		doGet(request, response);
	}

}
