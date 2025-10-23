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
 * Servlet implementation class AssignPickup
 */
public class AssignPickup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AssignPickup() {
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
		
		
		
		int pickupId = Integer.parseInt(request.getParameter("pickupId"));
        int agentId = Integer.parseInt(request.getParameter("agentId"));

        Connection con = DbConnection.connect();
        try {
            // Update pickupRequest to assign the agent
            PreparedStatement ps = con.prepareStatement(
                "UPDATE pickuprequest SET AssignedAgentId=?, status='Assigned' WHERE pickupId=?"
            );
            ps.setInt(1, agentId);
            ps.setInt(2, pickupId);
            ps.executeUpdate();

            // Update agent’s status to Busy
            ps = con.prepareStatement("UPDATE agents SET status='Busy' WHERE agentId=?");
            ps.setInt(1, agentId);
            ps.executeUpdate();

            response.sendRedirect("o_adminViewRequest.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("admin-dashboard.jsp?msg=Error");
        }
		
		
		
		
		doGet(request, response);
	}

}
