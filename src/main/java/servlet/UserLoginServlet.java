package servlet;

import model.ArtistUser;
import services.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final UserService userService = new UserService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Authenticate the user
        ArtistUser artistUser = userService.authenticateUser(email, password);

        if (artistUser != null) {
            // Create a session
            HttpSession session = request.getSession(true);
            session.setAttribute("user", artistUser);
            session.setAttribute("userId", artistUser.getUserId());
            session.setAttribute("fullName", artistUser.getFullName());
            session.setMaxInactiveInterval(30 * 60); // 30 minutes

            response.sendRedirect(request.getContextPath() + "userDashboard.jsp");
        } else {
            // Authentication failed
            request.setAttribute("error", "Invalid email or password.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            // Already logged in
            response.sendRedirect(request.getContextPath() + "userDashboard.jsp");
        } else {
            // Forward to login page
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
