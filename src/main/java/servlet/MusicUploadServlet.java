package servlet;

import model.MusicTrack;
import services.MusicTrackService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

@WebServlet("/tracks")
public class MusicUploadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final MusicTrackService trackService = new MusicTrackService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/user/login");
            return;
        }

        String mode = request.getParameter("mode");
        int userId = (int) session.getAttribute("userId");

        if ("create".equalsIgnoreCase(mode)) {
            request.setAttribute("mode", "create");

        } else if ("edit".equalsIgnoreCase(mode)) {
            int id = Integer.parseInt(request.getParameter("id"));
            MusicTrack track = trackService.getTrackById(id);
            request.setAttribute("mode", "edit");
            request.setAttribute("currentTrack", track);

        } else if ("view".equalsIgnoreCase(mode)) {
            int id = Integer.parseInt(request.getParameter("id"));
            MusicTrack track = trackService.getTrackById(id);
            request.setAttribute("mode", "view");
            request.setAttribute("currentTrack", track);

        } else {
            List<MusicTrack> tracks = trackService.getTracksByUser(userId);
            request.setAttribute("mode", "list");
            request.setAttribute("tracks", tracks);
        }

        request.getRequestDispatcher("/user/musicUpload.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/user/login");
            return;
        }

        int userId = (int) session.getAttribute("userId");
        String action = request.getParameter("action");

        if ("create".equalsIgnoreCase(action)) {
            MusicTrack track = extractTrackFromRequest(request);
            track.setUploadedBy(userId);
            boolean success = trackService.addMusicTrack(track);
            session.setAttribute(success ? "success" : "error",
                    success ? "Track uploaded successfully." : "Failed to upload track.");

        } else if ("update".equalsIgnoreCase(action)) {
            MusicTrack track = extractTrackFromRequest(request);
            track.setTrackId(Integer.parseInt(request.getParameter("id")));
            boolean success = trackService.updateMusicTrack(track);
            session.setAttribute(success ? "success" : "error",
                    success ? "Track updated successfully." : "Failed to update track.");

        } else if ("delete".equalsIgnoreCase(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            boolean success = trackService.deleteMusicTrack(id);
            session.setAttribute(success ? "success" : "error",
                    success ? "Track deleted successfully." : "Failed to delete track.");
        }

        response.sendRedirect(request.getContextPath() + "/tracks");
    }

    // Helper method to extract form data into MusicTrack
    private MusicTrack extractTrackFromRequest(HttpServletRequest request) {
        MusicTrack track = new MusicTrack();
        track.setTitle(request.getParameter("title"));
        track.setArtist(request.getParameter("artist"));
        track.setGenre(request.getParameter("genre"));

        try {
            BigDecimal price = new BigDecimal(request.getParameter("price"));
            track.setPrice(price);
        } catch (NumberFormatException e) {
            track.setPrice(BigDecimal.ZERO);
        }

        return track;
    }
}
