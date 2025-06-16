package services;

import model.ArtistUser;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserService {

    // Create ArtistUser
    public boolean createUser(ArtistUser artistUser) {
        final String query = "INSERT INTO users (username, email, password, full_name, phone_number, address) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, artistUser.getUsername());
            stmt.setString(2, artistUser.getEmail());
            stmt.setString(3, artistUser.getPassword());
            stmt.setString(4, artistUser.getFullName());
            stmt.setString(5, artistUser.getPhoneNumber());
            stmt.setString(6, artistUser.getAddress());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Get ArtistUser by ID
    public ArtistUser getUserById(int userId) {
        final String query = "SELECT * FROM users WHERE user_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return mapResultSetToUser(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Get All Users
    public List<ArtistUser> getAllUsers() {
        List<ArtistUser> artistUsers = new ArrayList<>();
        final String query = "SELECT * FROM users";
        try (Connection connection = DBConnection.getConnection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                artistUsers.add(mapResultSetToUser(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return artistUsers;
    }

    // Update ArtistUser
    public boolean updateUser(ArtistUser artistUser) {
        final String query = "UPDATE users SET username = ?, email = ?, password = ?, full_name = ?, phone_number = ?, address = ? WHERE user_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, artistUser.getUsername());
            stmt.setString(2, artistUser.getEmail());
            stmt.setString(3, artistUser.getPassword());
            stmt.setString(4, artistUser.getFullName());
            stmt.setString(5, artistUser.getPhoneNumber());
            stmt.setString(6, artistUser.getAddress());
            stmt.setInt(7, artistUser.getUserId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Delete ArtistUser
    public boolean deleteUser(int userId) {
        final String query = "DELETE FROM users WHERE user_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, userId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Authenticate ArtistUser by Email and Password
    public ArtistUser authenticateUser(String email, String password) {
        final String query = "SELECT * FROM users WHERE email = ? AND password = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, email);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return mapResultSetToUser(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Helper Method to Map ResultSet to ArtistUser Object
    private ArtistUser mapResultSetToUser(ResultSet rs) throws SQLException {
        ArtistUser artistUser = new ArtistUser();
        artistUser.setUserId(rs.getInt("user_id"));
        artistUser.setUsername(rs.getString("username"));
        artistUser.setEmail(rs.getString("email"));
        artistUser.setPassword(rs.getString("password"));
        artistUser.setFullName(rs.getString("full_name"));
        artistUser.setPhoneNumber(rs.getString("phone_number"));
        artistUser.setAddress(rs.getString("address"));
        artistUser.setCreatedAt(rs.getTimestamp("created_at"));
        return artistUser;
    }
    // Create New Artist
    public boolean registerUser(ArtistUser artistUser) {
        final String query = "INSERT INTO users (username, email, password, full_name, phone_number, address) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, artistUser.getUsername());
            stmt.setString(2, artistUser.getEmail());
            stmt.setString(3, artistUser.getPassword());
            stmt.setString(4, artistUser.getFullName());
            stmt.setString(5, artistUser.getPhoneNumber());
            stmt.setString(6, artistUser.getAddress());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

        public boolean emailExists(String email) {
            String sql = "SELECT user_id FROM users WHERE email = ?";

            try (Connection conn = DBConnection.getConnection();
                 PreparedStatement stmt = conn.prepareStatement(sql)) {

                stmt.setString(1, email);
                ResultSet rs = stmt.executeQuery();

                return rs.next();

            } catch (SQLException e) {
                e.printStackTrace();
                return true; // Assume it exists to be safe
            }
        }   
    }


