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
 * Servlet implementation class addAgents
 */
public class addAgents extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addAgents() {
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
		
		
		int agId = 0;
		String agname = request.getParameter("agname");
		String agmail = request.getParameter("agmail");
		String agcontact = request.getParameter("agcontact");
		String agzone = request.getParameter("agzone");
		String agpass = request.getParameter("agpass");
		
		System.out.println(agId);
		System.out.println(agname);
		System.out.println(agmail);
		System.out.println(agcontact);
		System.out.println(agzone);
		System.out.println(agpass);
		
		
		Connection con  = DbConnection.connect();
		
		try {
			PreparedStatement pstmt3 = con.prepareStatement("INSERT INTO agents VALUES(?,?,?,?,?,?)");
			
			pstmt3.setInt(1, agId);
			pstmt3.setString(2, agname);
			pstmt3.setString(3, agmail);
			pstmt3.setString(4, agcontact);
			pstmt3.setString(5, agzone);
			pstmt3.setString(6, agpass);
			
			
			int i = pstmt3.executeUpdate();
			
			if(i>0){
				System.out.println("Added Successfully !!!!!!");
				response.sendRedirect("b_adminDashboard.html");
			}
			else{
				System.out.println("error !!!!!!");
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		doGet(request, response);
	}

}
