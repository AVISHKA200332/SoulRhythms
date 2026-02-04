package services;

import model.MusicTrack;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MusicTrackService {

    // Add new music track
    public boolean addMusicTrack(MusicTrack track) {
        final String query = "INSERT INTO music_tracks (title, artist, genre, price, uploaded_by) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, track.getTitle());
            stmt.setString(2, track.getArtist());
            stmt.setString(3, track.getGenre());
            stmt.setBigDecimal(4, track.getPrice());
            stmt.setInt(5, track.getUploadedBy());

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Get music track by ID
    public MusicTrack getTrackById(int trackId) {
        final String query = "SELECT * FROM music_tracks WHERE track_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, trackId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return mapResultSetToTrack(rs);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Get all music tracks
    public List<MusicTrack> getAllTracks() {
        List<MusicTrack> tracks = new ArrayList<>();
        final String query = "SELECT * FROM music_tracks ORDER BY upload_date DESC";
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                tracks.add(mapResultSetToTrack(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tracks;
    }

    // Get tracks uploaded by a specific user
    public List<MusicTrack> getTracksByUser(int userId) {
        List<MusicTrack> tracks = new ArrayList<>();
        final String query = "SELECT * FROM music_tracks WHERE uploaded_by = ? ORDER BY upload_date DESC";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                tracks.add(mapResultSetToTrack(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tracks;
    }

    // Update a music track
    public boolean updateMusicTrack(MusicTrack track) {
        final String query = "UPDATE music_tracks SET title = ?, artist = ?, genre = ?, price = ? WHERE track_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, track.getTitle());
            stmt.setString(2, track.getArtist());
            stmt.setString(3, track.getGenre());
            stmt.setBigDecimal(4, track.getPrice());
            stmt.setInt(5, track.getTrackId());

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Delete a music track
    public boolean deleteMusicTrack(int trackId) {
        final String query = "DELETE FROM music_tracks WHERE track_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, trackId);
            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Helper method to map ResultSet to MusicTrack object
    private MusicTrack mapResultSetToTrack(ResultSet rs) throws SQLException {
        MusicTrack track = new MusicTrack();
        track.setTrackId(rs.getInt("track_id"));
        track.setTitle(rs.getString("title"));
        track.setArtist(rs.getString("artist"));
        track.setGenre(rs.getString("genre"));
        track.setPrice(rs.getBigDecimal("price"));
        track.setUploadDate(rs.getTimestamp("upload_date"));
        track.setUploadedBy(rs.getInt("uploaded_by"));
        return track;
    }
}
