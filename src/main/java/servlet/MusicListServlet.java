package servlet;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Music;
import services.MusicDBUtil;

@WebServlet("/music")
public class MusicListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(MusicListServlet.class.getName());

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String songID = request.getParameter("songID");
        String searchParam = request.getParameter("search");

        try {
            if (songID != null && !songID.trim().isEmpty()) {
                try {
                    Music music = MusicDBUtil.getMusicById(songID);
                    if (music == null) {
                        response.getWriter().write("Music not found for ID: " + songID);
                        return;
                    }
                    request.setAttribute("music", music);
                    response.sendRedirect(request.getContextPath() + "/music");
                } catch (NumberFormatException e) {
                    response.getWriter().write("Invalid Song ID format.");
                    LOGGER.log(Level.WARNING, "Invalid songID format: " + songID, e);
                    return;
                }
            } else {
                List<Music> musics;
                if (searchParam != null && !searchParam.trim().isEmpty()) {
                    musics = MusicDBUtil.searchMusic(searchParam);
                } else {
                    musics = MusicDBUtil.getAllMusic();
                }
                if (musics == null || musics.isEmpty()) {
                    request.setAttribute("errorMessage", "No music data available.");
                    LOGGER.warning("No music data retrieved. Search: " + searchParam);
                }
                request.setAttribute("musics", musics);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/musicsModerator.jsp");
                dispatcher.forward(request, response);
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error retrieving music(s)", e);
            response.getWriter().write("Error retrieving music(s): " + e.getMessage());
        }
    }
}