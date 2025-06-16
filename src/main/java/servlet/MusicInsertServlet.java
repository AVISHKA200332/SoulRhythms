package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.MusicDBUtil;

import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/music/insert")
public class MusicInsertServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(MusicInsertServlet.class.getName());

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        LOGGER.info("Displaying music insert form");
        request.getRequestDispatcher("/insertModerator.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String title = request.getParameter("title");
            String artist = request.getParameter("artist");
            String albumID = request.getParameter("albumID");

            // Input validation
            if (title == null || title.trim().isEmpty() ||
                artist == null || artist.trim().isEmpty()) {
                
                throw new IllegalArgumentException("Title and artist are required");
            }

            boolean isInserted = MusicDBUtil.insertMusic(title, artist, albumID);

            if (isInserted) {
                LOGGER.info("Music created successfully: " + title + ", " + artist);
                response.sendRedirect(request.getContextPath() + "/music");
            } else {
                LOGGER.warning("Music insertion failed: " + title + ", " + artist);
                request.setAttribute("errorMessage", "Failed to insert music");
                request.getRequestDispatcher("../error.jsp").forward(request, response);
            }
        } catch (IllegalArgumentException e) {
            LOGGER.log(Level.WARNING, "Invalid input for music creation", e);
            request.setAttribute("errorMessage", "Invalid input: " + e.getMessage());
            request.getRequestDispatcher("../error.jsp").forward(request, response);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error creating music", e);
            request.setAttribute("errorMessage", "Error creating music: " + e.getMessage());
            request.getRequestDispatcher("../error.jsp").forward(request, response);
        }
    }
}