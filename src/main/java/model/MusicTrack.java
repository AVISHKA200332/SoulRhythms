package model;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class MusicTrack {
    private int trackId;
    private String title;
    private String artist;
    private String genre;
    private BigDecimal price;
    private Timestamp uploadDate;
    private int uploadedBy;
    private String description;

    // Getters
    public int getTrackId() {
        return trackId;
    }

    public String getTitle() {
        return title;
    }

    public String getArtist() {
        return artist;
    }

    public String getGenre() {
        return genre;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public Timestamp getUploadDate() {
        return uploadDate;
    }

    public int getUploadedBy() {
        return uploadedBy;
    }

    // Setters
    public void setTrackId(int trackId) {
        this.trackId = trackId;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setArtist(String artist) {
        this.artist = artist;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public void setUploadDate(Timestamp uploadDate) {
        this.uploadDate = uploadDate;
    }

    public void setUploadedBy(int uploadedBy) {
        this.uploadedBy = uploadedBy;
    }
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
