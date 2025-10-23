package com.waste;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class citizenLogin1
 */
@WebServlet("/citizenLogin1")
public class citizenLogin1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public citizenLogin1() {
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
		String cimail = request.getParameter("cimail");
		String cipass = request.getParameter("cipass");
		
		try {
			PreparedStatement pstmt1 = con.prepareStatement("SELECT * FROM citizens WHERE Email=? AND Password=?");
			
			pstmt1.setString(1, cimail);
			pstmt1.setString(2, cipass);
			
			ResultSet rs = pstmt1.executeQuery();
			
			if(rs.next()){
				
				System.out.println("Login Citizen Successfull !!!");
				GetSetCitizenId.setCitizenId(rs.getInt(1));
				System.out.println("citizenId getted: "+rs.getInt(1));
				response.sendRedirect("e_citizenDashboard.html");
			}
			else{
				System.out.println("Citizen Not Found !!!!!");
				response.sendRedirect("v_errorPageCitizen.html");
			}
		
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		System.out.println(cimail);
		System.out.println(cipass);
		
		doGet(request, response);
	}

}
