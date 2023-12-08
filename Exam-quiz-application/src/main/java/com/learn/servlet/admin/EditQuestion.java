package com.learn.servlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.learn.db.dao.QuestionDao;

/**
 * Servlet implementation class EditQuiz
 */
@WebServlet("/admin/editQuestion/*")
public class EditQuestion extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditQuestion() {
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
			Long questionId = Long.parseLong(request.getPathInfo().substring(1));
			request.setAttribute("question", new QuestionDao().getQuestion(questionId));
			request.getRequestDispatcher("/admin/edit-question.jsp").include(request, response);
		} else {
			session.invalidate();
			session.setAttribute("error", "Unauthorised request.");
			response.sendRedirect(request.getContextPath() + "/admin/login");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		if (Authorizer.isAdminAuthorised(session)) {
			Long questionId = Long.parseLong(request.getPathInfo().substring(1));

			String question = request.getParameter("question");
			String optionA = request.getParameter("optionA");
			String optionB = request.getParameter("optionB");
			String optionC = request.getParameter("optionC");
			String optionD = request.getParameter("optionD");
			String correctOption = request.getParameter("correctOption");

			if (new QuestionDao().updateQuestion(questionId, question, optionA, optionB, optionC, optionD,
					correctOption)) {
				session.setAttribute("info", "Question updated successfully.");
				response.sendRedirect(request.getContextPath() + "/admin/viewQuestion/" + questionId);
			} else {
				session.setAttribute("error", "Unable to update Question.");
				request.getRequestDispatcher("/admin/editQuestion/" + questionId).include(request, response);
			}
		} else {
			session.invalidate();
			session.setAttribute("error", "Unauthorised request.");
			response.sendRedirect(request.getContextPath() + "/admin/login");
		}
	}

}
