package com.waste;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class agentLogin
 */

public class agentLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public agentLogin() {
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
		
		String agmail = request.getParameter("agmail");
		String agpass = request.getParameter("agpass");
		
		
		System.out.println(agmail);
		System.out.println(agpass);
		
		try {
			PreparedStatement pstmt10 = con.prepareStatement("select * from agents where Email=? AND Password=?");
			
			pstmt10.setString(1, agmail);
			pstmt10.setString(2, agpass);
			
			
		
			ResultSet rs = pstmt10.executeQuery();
			
			
			if(rs.next()){
				
				System.out.println("Agent login Successful !!");
				GetSetAgentId.setAgentId(rs.getInt(1));
				System.out.println("Agent Id: "+rs.getInt(1)+" is Login !!!");
				response.sendRedirect("r_agentDashboard.html");
			} 
			else{
				System.out.println("Agent Not Found !!!!!");
				response.sendRedirect("x_errorPageAgent.html");
			}
			
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		doGet(request, response);
	}

}
