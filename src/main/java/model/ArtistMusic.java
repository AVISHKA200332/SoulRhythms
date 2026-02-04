package model;

public class ArtistMusic {
    private int songID;
    private String title;
    private String artist;
    private Integer albumID;

    public ArtistMusic(int songID, String title, String artist, Integer albumID) {
        this.songID = songID;
        this.title = title;
        this.artist = artist;
        this.albumID = albumID;
        
        
    }

	public int getSongID() {
		return songID;
	}

	public void setSongID(int songID) {
		this.songID = songID;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getArtist() {
		return artist;
	}

	public void setArtist(String artist) {
		this.artist = artist;
	}

	public Integer getAlbumID() {
		return albumID;
	}

	public void setAlbumID(Integer albumID) {
		this.albumID = albumID;
	}
}
