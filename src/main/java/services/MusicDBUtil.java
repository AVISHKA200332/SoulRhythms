package services;

import util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import model.Music;
import model.moderatorModel;

public class MusicDBUtil {

    private static final Logger LOGGER = Logger.getLogger(MusicDBUtil.class.getName());

    // Insert ================================
    public static boolean insertMusic(String title, String artist, String albumID) {
        boolean isSuccess = false;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(
                     "INSERT INTO music (songID, title, artist, albumID) VALUES (0, ?, ?, ?)")) {

            pstmt.setString(1, title);
            pstmt.setString(2, artist);
            if (albumID != null && !albumID.trim().isEmpty()) {
                pstmt.setInt(3, Integer.parseInt(albumID));
            } else {
                pstmt.setNull(3, java.sql.Types.INTEGER);
            }

            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                isSuccess = true;
                LOGGER.info("Music inserted successfully: " + title + ", " + artist);
            } else {
                LOGGER.warning("Music insertion failed: " + title + ", " + artist);
            }

        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error inserting music: " + title + ", " + artist + ". SQLException: " + e.getMessage(), e);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Unexpected error inserting music: " + title + ", " + artist, e);
        }

        return isSuccess;
    }

    // View ================================
    public static Music getMusicById(String songID) {
        Music music = null;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement("SELECT * FROM music WHERE songID = ?")) {

            pstmt.setInt(1, Integer.parseInt(songID));
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    music = new Music(
                            rs.getInt("songID"),
                            rs.getString("title"),
                            rs.getString("artist"),
                            rs.getObject("albumID") != null ? rs.getInt("albumID") : null
                    );
                    LOGGER.info("Music retrieved successfully: ID = " + songID);
                } else {
                    LOGGER.warning("No music found with ID: " + songID);
                }
            }

        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error retrieving music with ID: " + songID + ". SQLException: " + e.getMessage(), e);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Unexpected error retrieving music with ID: " + songID, e);
        }

        return music;
    }

    // Get all music ================================
    public static List<Music> getAllMusic() {
        List<Music> musicList = new ArrayList<>();

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement("SELECT * FROM music");
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Music music = new Music(
                        rs.getInt("songID"),
                        rs.getString("title"),
                        rs.getString("artist"),
                        rs.getObject("albumID") != null ? rs.getInt("albumID") : null
                );
                musicList.add(music);
            }

            LOGGER.info("All music retrieved successfully. Total music: " + musicList.size());

        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error retrieving all music. SQLException: " + e.getMessage(), e);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Unexpected error retrieving all music", e);
        }

        return musicList;
    }

    // Search music ================================
    public static List<Music> searchMusic(String query) {
        List<Music> musicList = new ArrayList<>();

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(
                     "SELECT * FROM music WHERE title LIKE ? OR artist LIKE ?")) {

            String searchPattern = "%" + query + "%";
            pstmt.setString(1, searchPattern);
            pstmt.setString(2, searchPattern);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Music music = new Music(
                            rs.getInt("songID"),
                            rs.getString("title"),
                            rs.getString("artist"),
                            rs.getObject("albumID") != null ? rs.getInt("albumID") : null
                    );
                    musicList.add(music);
                }
            }

            LOGGER.info("Music search completed. Query: " + query + ", Results: " + musicList.size());

        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error searching music with query: " + query + ". SQLException: " + e.getMessage(), e);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Unexpected error searching music with query: " + query, e);
        }

        return musicList;
    }

    // Update ================================
    public static boolean updateMusic(String songID, String title, String artist, String albumID) {
        boolean isSuccess = false;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(
                     "UPDATE music SET title = ?, artist = ?, albumID = ? WHERE songID = ?")) {

            pstmt.setString(1, title);
            pstmt.setString(2, artist);
            if (albumID != null && !albumID.trim().isEmpty()) {
                pstmt.setInt(3, Integer.parseInt(albumID));
            } else {
                pstmt.setNull(3, java.sql.Types.INTEGER);
            }
            pstmt.setInt(4, Integer.parseInt(songID));

            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                isSuccess = true;
                LOGGER.info("Music updated successfully: ID = " + songID);
            } else {
                LOGGER.warning("Music update failed: ID = " + songID);
            }

        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error updating music with ID: " + songID + ". SQLException: " + e.getMessage(), e);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Unexpected error updating music with ID: " + songID, e);
        }

        return isSuccess;
    }

    // Delete ================================
    public static boolean deleteMusic(String songID) {
        boolean isSuccess = false;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement("DELETE FROM music WHERE songID = ?")) {

            pstmt.setInt(1, Integer.parseInt(songID));
            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                isSuccess = true;
                LOGGER.info("Music deleted successfully: ID = " + songID);
            } else {
                LOGGER.warning("Music deletion failed: ID = " + songID);
            }

        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error deleting music with ID: " + songID + ". SQLException: " + e.getMessage(), e);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Unexpected error deleting music with ID: " + songID, e);
        }

        return isSuccess;
    }
    
  //login validation
    public static List<moderatorModel> loginvalidate(String email, String password) {
        List<moderatorModel> adminList = new ArrayList<>();

        String query = "SELECT * FROM moderator WHERE email = ? AND password = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(query)) {

            pstmt.setString(1, email);
            pstmt.setString(2, password);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    int id = rs.getInt(1);
                    String name = rs.getString(2);
                    String nic = rs.getString(3);
                    String gmail = rs.getString(4);
                    String phone = rs.getString(5);
                    String pass = rs.getString(6);

                    moderatorModel admin = new moderatorModel(id, name, nic, gmail, phone, pass);
                    adminList.add(admin);
                }

                if (!adminList.isEmpty()) {
                    LOGGER.info("Admin login successful for email: " + email);
                } else {
                    LOGGER.warning("Admin login failed for email: " + email);
                }
            }

        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "SQL error during admin login for email: " + email + ". " + e.getMessage(), e);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Unexpected error during admin login for email: " + email, e);
        }

        return adminList;
    }
}