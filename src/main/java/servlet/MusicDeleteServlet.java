package servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.MusicDBUtil;

@WebServlet("/delete/music")
public class MusicDeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String songID = request.getParameter("songID");

        // Validate input
        if (songID == null || songID.trim().isEmpty()) {
            RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
            dis.forward(request, response);
            return;
        }

        boolean isTrue = MusicDBUtil.deleteMusic(songID);

        if (isTrue) {
            response.sendRedirect(request.getContextPath() + "/music");
        } else {
            RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
            dis.forward(request, response);
        }
    }
}