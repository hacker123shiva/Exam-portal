//package com.learn.servlet.admin;
//
//import java.io.IOException;
//import java.io.InputStream;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.MultipartConfig;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import javax.servlet.http.Part;
//
//import com.learn.service.QuizService;
//import com.learn.utility.ExcelReader;
//
///**
// * Servlet implementation class UploadQuiz
// */
//@WebServlet("/admin/uploadQuiz")
//@MultipartConfig
//public class UploadQuiz extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//
//	/**
//	 * @see HttpServlet#HttpServlet()
//	 */
//	public UploadQuiz() {
//		super();
//		// TODO Auto-generated constructor stub
//	}
//
//	/**
//	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
//	 *      response)
//	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		HttpSession session = request.getSession(false);
//		if (Authorizer.isAdminAuthorised(session)) {
//			request.getRequestDispatcher("/admin/upload-quiz-question.jsp").include(request, response);
//		} else {
//			session.invalidate();
//			session.setAttribute("error", "Unauthorised request.");
//			response.sendRedirect(request.getContextPath() + "/admin/login");
//		}
//	}
//
//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
//	 *      response)
//	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//
//		HttpSession session = request.getSession(false);
//		if (Authorizer.isAdminAuthorised(session)) {
//			Long quizId = Long.parseLong(request.getParameter("quizId"));
//			Part attachedFile = request.getPart("attachedFile");
//			InputStream inputStream = attachedFile.getInputStream();
//			ExcelReader excelReader = new ExcelReader();
//			boolean b = new QuizService().addQuestion(quizId, excelReader.getQuestion(inputStream));
//			if (!b) {
//				session.setAttribute("error", "Unable to add quiz.");
//				request.getRequestDispatcher("/admin/upload-quiz-question.jsp").include(request, response);
//			} else {
//				session.setAttribute("info", "Quiz added successfully.");
//				response.sendRedirect(request.getContextPath() + "/admin/dashboard");
//			}
//		} else {
//			session.invalidate();
//			session.setAttribute("error", "Unauthorised request.");
//			response.sendRedirect(request.getContextPath() + "/admin/login");
//		}
//	}
//
//}
