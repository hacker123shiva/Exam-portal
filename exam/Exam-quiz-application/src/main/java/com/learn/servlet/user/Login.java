package com.learn.servlet.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.learn.db.dao.UserDao;
import com.learn.db.model.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class Login extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	//add get  method
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("login.jsp").include(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("test login1");
		String userName = request.getParameter("username");
		String password = request.getParameter("password");

		User user = new UserDao().getUser(userName, password);
		HttpSession session = request.getSession();
	
		if (user != null) {
			session.setAttribute("user", user);
			session.setAttribute("login", true);
			response.sendRedirect(request.getContextPath() + "/dashboard");
			System.out.println("test login2");
			 
			
		} else {
			session.setAttribute("error", "Invalid username or password.");
			response.sendRedirect(request.getContextPath() + "/");
		}
	}

}
