package servlet;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.moderatorModel;
import services.MusicDBUtil;

import java.io.IOException;
import java.util.List;

@WebServlet("/moderatorLoginServlet")
public class moderatorLoginServlet extends HttpServlet {
private static final long serialVersionUID = 1L;

protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {


}

protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	String email = request.getParameter("email");
	String password = request.getParameter("password");

	try {

		List<moderatorModel> eLogin = MusicDBUtil.loginvalidate(email, password);
		if(eLogin != null && !eLogin.isEmpty()) {

		request.getSession().setAttribute("admin", eLogin.get(0));
		response.sendRedirect("insertModerator.jsp");

	} else {

		String alertmessage = "Invalid Credentials, please try again!";
		response.getWriter().println("<script> alert('"+alertmessage+"'); window.location.href='/music' </script>");
	}

	} catch (Exception e) {
		e.printStackTrace();
	}

	}

}
