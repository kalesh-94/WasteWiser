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
 * Servlet implementation class submitPickupRequest
 */
public class submitPickupRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public submitPickupRequest() {
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
		
		int pickupId = 0;
		int citizenId = GetSetCitizenId.getCitizenId();
		String wasteType = request.getParameter("wasteType");
		String preferredDate = request.getParameter("preferredDate");
		String preferredTime = request.getParameter("preferredTime");
		String pickupAddress = request.getParameter("pickupAddress");
		String status = "pending";
		int AssignedAgentId	= 0;
		
		
		try {
			PreparedStatement pstmt9 = con.prepareStatement("insert into pickuprequest VALUES(?,?,?,?,?,?,?,?)");
				
			pstmt9.setInt(1, pickupId);
			pstmt9.setInt(2, citizenId);
			pstmt9.setString(3, wasteType);
			pstmt9.setString(4, preferredDate);
			pstmt9.setString(5, preferredTime);
			pstmt9.setString(6, pickupAddress);
			pstmt9.setString(7, status);
			pstmt9.setInt(8, AssignedAgentId);
			
			int i = pstmt9.executeUpdate();
			if(i>0){
				System.out.println("PickUp requested Successful !!!");
				response.sendRedirect("e_citizenDashboard.html");
			}
			else{
				System.out.println("something wrong in rwquest !!");
			}
		
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		doGet(request, response);
	}

}
