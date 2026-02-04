package services;

import model.Artist;
import util.DBConnection;

import java.sql.*;

public class ArtistService {

    public boolean registerArtist(Artist artist) {
        final String query = "INSERT INTO users (username, email, password, full_name, phone_number, address) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {

            stmt.setString(1, artist.getUsername());
            stmt.setString(2, artist.getEmail());
            stmt.setString(3, artist.getPassword());
            stmt.setString(4, artist.getFullName());
            stmt.setString(5, artist.getPhoneNumber());
            stmt.setString(6, artist.getAddress());

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean emailExists(String email) {
        final String sql = "SELECT user_id FROM users WHERE email = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {

            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            return rs.next();

        } catch (SQLException e) {
            e.printStackTrace();
            return true;
        }
    }
}
