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
 * Servlet implementation class agentRegister
 */
public class agentRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public agentRegister() {
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
		String agstatus = request.getParameter("agstatus");
		
		System.out.println(agId);
		System.out.println(agname);
		System.out.println(agmail);
		System.out.println(agcontact);
		System.out.println(agzone);
		System.out.println(agpass);
		System.out.println(agstatus);
		
		
		Connection con  = DbConnection.connect();
		
		try {
			PreparedStatement pstmt2 = con.prepareStatement("INSERT INTO agents VALUES(?,?,?,?,?,?,?)");
			
			pstmt2.setInt(1, agId);
			pstmt2.setString(2, agname);
			pstmt2.setString(3, agmail);
			pstmt2.setString(4, agcontact);
			pstmt2.setString(5, agzone);
			pstmt2.setString(6, agpass);
			pstmt2.setString(7, agstatus);
			
			
			int i = pstmt2.executeUpdate();
			
			if(i>0){
				System.out.println("Register Successfully !!!!!!");
				response.sendRedirect("f_agentLogin.html");
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
