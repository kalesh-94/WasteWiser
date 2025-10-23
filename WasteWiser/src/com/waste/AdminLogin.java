package com.waste;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLogin() {
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
		
		String admail = request.getParameter("admail");
		String adpass = request.getParameter("adpass");
		
		System.out.println(admail);
		System.out.println(adpass);
		
		if(admail.equals("admin@mail.com") && adpass.equals("123")){
			System.out.println("welcome admin !!!");
			response.sendRedirect("b_adminDashboard.html");
		} else{
			System.out.println("Admin NOT Found !!!!");
			response.sendRedirect("y_errorAdmin.html");
		}
		
		
		
		doGet(request, response);
	}

}
