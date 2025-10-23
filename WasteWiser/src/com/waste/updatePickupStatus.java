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
 * Servlet implementation class updatePickupStatus
 */
public class updatePickupStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updatePickupStatus() {
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
		
		String status = request.getParameter("status");
		int pickupId = Integer.parseInt(request.getParameter("pickupId"));
		
		System.out.println(status);
		System.out.println(pickupId);
		
		
		try {
			PreparedStatement pstmt13 = con.prepareStatement("UPDATE pickuprequest SET status=? WHERE pickupId=?");
				
			pstmt13.setString(1, status);
			pstmt13.setInt(2, pickupId);
			
			int i = pstmt13.executeUpdate();
			
			if(i>0){
				System.out.println("Agent Updated the Pickup Request !!!");
				response.sendRedirect("s_agentViewAssignedPickups.jsp");
			}
			else{
				System.out.println("something went wrong !!!!!!!!!!!!!!!!");
			}
		
		
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		doGet(request, response);
	}

}
