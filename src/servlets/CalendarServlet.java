package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import calendar.Manager;

/**
 * Servlet implementation class CalendarServlet
 */
@WebServlet("/CalendarServlet")
public class CalendarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Manager manager;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CalendarServlet() {
		super();

		manager = new Manager();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// response.getWriter().append("Served at: ").append(request.getContextPath());

		RequestDispatcher rd = request.getRequestDispatcher("templates/address.xhtml");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// If none of the below matches go to home page
		RequestDispatcher rd = request.getRequestDispatcher("templates/address.xhtml");

		String formType = request.getParameter("formType");
		if (formType.equals("homeForm")) {
			if (request.getParameter("login") != null) {
				rd = request.getRequestDispatcher("templates/Login.jsp");
			} else if (request.getParameter("register") != null) {
				rd = request.getRequestDispatcher("templates/Register.jsp");
			}
		} else if (formType.equals("loginForm")) {
			this.manager.login(request.getParameter("username"), request.getParameter("password"));
		} else if (formType.equals("registerForm")) {
			this.manager.register(
				request.getParameter("firstName"), 
				request.getParameter("lastName"),
				request.getParameter("username"), 
				request.getParameter("password1"),
				request.getParameter("password2")
			);
		}

		rd.forward(request, response);
	}

}
