package servlet;

import model.Artist;
import services.ArtistService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@SuppressWarnings("serial")
@WebServlet("/artist/register")
public class RegisterServlet extends HttpServlet {

    private final ArtistService artistService = new ArtistService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Passwords do not match.");
            request.getRequestDispatcher("/user/UserRegister.jsp").forward(request, response);
            return;
        }

        if (artistService.emailExists(email)) {
            request.setAttribute("error", "Email is already registered.");
            request.getRequestDispatcher("/user/UserRegister.jsp").forward(request, response);
            return;
        }

        Artist artist = new Artist();
        artist.setUsername(username);
        artist.setEmail(email);
        artist.setPassword(password);
        artist.setFullName(fullName);
        artist.setPhoneNumber(phone);
        artist.setAddress(address);

        boolean success = artistService.registerArtist(artist);

        if (success) {
            request.getSession().setAttribute("registerSuccess", "Registration successful! Please login.");
            response.sendRedirect(request.getContextPath() + "/user/UserLogin.jsp");
        } else {
            request.setAttribute("error", "Registration failed. Try again.");
            request.getRequestDispatcher("/user/UserRegister.jsp").forward(request, response);
        }
    }
}
