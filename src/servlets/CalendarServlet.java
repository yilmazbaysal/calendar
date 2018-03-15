package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import calendar.Manager;
import models.Activity;
import models.User;

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

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String formType = request.getParameter("formType");
		if (formType.equals("registerButton")) {
			// Redirect to the register page
			response.sendRedirect("Register.jsp");
		} else if (formType.equals("loginForm")) {
			User user = this.manager.login(request.getParameter("username"), request.getParameter("password"));
			
			if (user != null) {
				// Set the user to the session
				request.getSession().setAttribute("user", user);
				
				// Redirect to the activities page
				response.sendRedirect("/Calendar/safe/Activities.jsp");
			}
			else {
				response.sendRedirect("/Calendar/address.xhtml");
			}
			
		} else if (formType.equals("registerForm")) {
			boolean is_registered = this.manager.register(
				request.getParameter("firstName"), 
				request.getParameter("lastName"),
				request.getParameter("username"), 
				request.getParameter("password1"),
				request.getParameter("password2")
			);
			
			if (is_registered) {
				response.sendRedirect("/Calendar/address.xhtml");
			}
			else {
				response.sendRedirect("/Calendar/Register.xhtml");
			}
		}
		else if (formType.equals("activityEdit")) {
			if(request.getSession().getAttribute("activityList") == null) {
	            // Create the list in the session
				request.getSession().setAttribute("activityList", new ArrayList<Activity>());   
	        }
			
			System.out.println(request.getParameter("startTime"));
			
			/*
			@SuppressWarnings("unchecked")
			Activity activity = this.manager.activity_edit(
					(ArrayList<Activity>) request.getSession().getAttribute("activityList"),
					Integer.parseInt(request.getParameter("id")),
					request.getParameter("title"),
					request.getParameter("location"),
					request.getParameter("description"),
					request.getParameter("startTime"),
					request.getParameter("endTime"),
					(User) request.getSession().getAttribute("user")
			);
			*/
		}
		else {
			// If none of the above matches go to home page
			RequestDispatcher rd = request.getRequestDispatcher("/Calendar/address.xhtml");
			rd.forward(request, response);
		}
	}

}
