package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.AdminUserModel;
import services.UserController;

@WebServlet("/UserUpdateServlet")
public class UserUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String role = request.getParameter("role");
		
		boolean isTrue;
		
		isTrue = UserController.updateData(id, name, email, role);

		
		if(isTrue == true) {
			List<AdminUserModel> UserDetails = UserController.getById(id);
			request.setAttribute("UserDetails", UserDetails);
			
			String alertMessage = "Data Update Successfull";
			response.getWriter().println("<script> alert('"+alertMessage+"'); window.location.href = 'UserDisplayServlet' </script>");
		}
		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
			dis2.forward(request, response);
		}
	}

}
