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
 * Servlet implementation class citizenRegister
 */
public class citizenRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public citizenRegister() {
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
		
		
		int ciId = 0;
		String ciname = request.getParameter("ciname");
		String cimail = request.getParameter("cimail");
		String cicontact = request.getParameter("cicontact");
		String ciaddress = request.getParameter("ciaddress");
		String cizone = request.getParameter("cizone");
		String cipass = request.getParameter("cipass");
		
		System.out.println(ciId);
		System.out.println(ciname);
		System.out.println(cimail);
		System.out.println(cicontact);
		System.out.println(ciaddress);
		System.out.println(cizone);
		System.out.println(cipass);
		
		try {
			PreparedStatement pstmt = con.prepareStatement("INSERT INTO citizens VALUES(?,?,?,?,?,?,?)");
			
			pstmt.setInt(1, ciId);
			pstmt.setString(2, ciname);
			pstmt.setString(3, cimail);
			pstmt.setString(4, cicontact);
			pstmt.setString(5, ciaddress);
			pstmt.setString(6, cizone);
			pstmt.setString(7, cipass);
			
			int i = pstmt.executeUpdate();
			if(i>0){
				System.out.println("insert successful !!!");
				response.sendRedirect("c_citizenLogin.html");
			} 
			else{
				System.out.println("error !!!!!!!!!");
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		doGet(request, response);
	}

}
