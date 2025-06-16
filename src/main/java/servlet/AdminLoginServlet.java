package servlet;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.adminModel;
import services.UserController;

import java.io.IOException;
import java.util.List;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
private static final long serialVersionUID = 1L;

protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {


}

protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String role = request.getParameter("role");

	try {
		List<adminModel> eLogin = UserController.loginvalidate(email, password);
		switch(role) {
		case "Admin" :
			if(eLogin != null && !eLogin.isEmpty()) {

				request.getSession().setAttribute("admin", eLogin.get(0));
				response.sendRedirect("getTotUsersServlet");
			}
			else {

				String alertmessage = "Invalid Credentials, please try again!";
				response.getWriter().println("<script> alert('"+alertmessage+"'); window.location.href='login.jsp' </script>");
		
			} 
			break;
			
		case "Moderator" :
			if(eLogin != null && !eLogin.isEmpty()) {

				request.getSession().setAttribute("admin", eLogin.get(0));
				response.sendRedirect("updateModerator.jsp");
			}
			else {

				String alertmessage = "Invalid Credentials, please try again!";
				response.getWriter().println("<script> alert('"+alertmessage+"'); window.location.href='login.jsp' </script>");
			}
				break;
			
		case "ArtistUser" :
			if(eLogin != null && !eLogin.isEmpty()) {

				request.getSession().setAttribute("admin", eLogin.get(0));
				response.sendRedirect("dashboard.jsp");
			}
			else {

				String alertmessage = "Invalid Credentials, please try again!";
				response.getWriter().println("<script> alert('"+alertmessage+"'); window.location.href='login.jsp' </script>");
			}
				break;
			
		/*case "" :
			
			break; */
			 
	}
	}catch (Exception e) {
		e.printStackTrace();
	}

	}

}
