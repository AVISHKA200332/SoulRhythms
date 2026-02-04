package servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Music;
import services.MusicDBUtil;

@WebServlet("/music/update")
public class MusicUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String songID = request.getParameter("songID");

        if (songID != null && !songID.trim().isEmpty()) {
            Music music = MusicDBUtil.getMusicById(songID);

            if (music != null) {
                request.setAttribute("music", music);
                request.getRequestDispatcher("../updateModerator.jsp").forward(request, response);
                
            } else {
                response.getWriter().write("Music not found.");
            }
        } else {
            response.getWriter().write("Invalid Song ID.");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String songID = request.getParameter("songID");
        String title = request.getParameter("title");
        String artist = request.getParameter("artist");
        String albumID = request.getParameter("albumID");

        // Validate inputs
        if (songID == null || title == null || artist == null ||
            songID.trim().isEmpty() || title.trim().isEmpty() || artist.trim().isEmpty()) {
            RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
            dis.forward(request, response);
            return;
        }

        boolean isTrue = MusicDBUtil.updateMusic(songID, title, artist, albumID);

        if (isTrue) {
            response.sendRedirect(request.getContextPath() + "/music?songID=" + songID);
            
        } else {
            RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
            dis.forward(request, response);
        }
    }
}