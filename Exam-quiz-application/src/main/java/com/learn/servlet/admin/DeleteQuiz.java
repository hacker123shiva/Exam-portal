package com.learn.servlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.learn.service.QuizService;

/**
 * Servlet implementation class DeleteQuiz
 */
@WebServlet("/admin/deleteQuiz/*")
public class DeleteQuiz extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteQuiz() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (Authorizer.isAdminAuthorised(session)) {
			Long quizId = Long.parseLong(request.getPathInfo().substring(1));
			if (new QuizService().deleteQuiz(quizId)) {
				session.setAttribute("info", "Quiz deleted successfully.");
			} else {
				session.setAttribute("erro", "Quiz not deleted successfully.");
			}
			response.sendRedirect(request.getContextPath() + "/admin/dashboard");
		} else {
			session.invalidate();
			session.setAttribute("error", "Unauthorised request.");
			response.sendRedirect(request.getContextPath() + "/admin/login");
		}
	}

}
