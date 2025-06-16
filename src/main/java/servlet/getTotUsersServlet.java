package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import services.UserController;

import javax.servlet.RequestDispatcher;


@WebServlet("/getTotUsersServlet")
public class getTotUsersServlet extends HttpServlet {
    private static final long serialVersionUID = 1L; // recommended for serialization

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Create DAO instance
        UserController dao = new UserController();

        // Fetch total users
        int totalUsers = dao.getTotalUsers();

        // Set attribute and forward to JSP
        request.setAttribute("allUsers", totalUsers);
        RequestDispatcher dispatcher = request.getRequestDispatcher("Admin.jsp");
        dispatcher.forward(request, response);
    }
}

