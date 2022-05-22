package com.music.model;

public class Song {
	private int songID;
	private String songName;
	private String songImage;
	private String artist;
	private String description;
	private float songLength;
	private String songFile;
	private String genre;
	private String releaseDate;
	
	public Song(int songID, String songName, String songImage, String artist, String description, String songFile,
			String genre, String releaseDate) {
		this.songID = songID;
		this.songName = songName;
		this.songImage = songImage;
		this.artist = artist;
		this.description = description;
		this.songFile = songFile;
		this.genre = genre;
		this.releaseDate = releaseDate;
	}

	public int getSongID() {
		return songID;
	}

	public String getSongName() {
		return songName;
	}

	public String getSongImage() {
		return songImage;
	}

	public String getArtist() {
		return artist;
	}

	public float getSongLength() {
		return songLength;
	}

	public String getsongFile() {
		return songFile;
	}

	public String getGenre() {
		return genre;
	}

	public String getReleaseDate() {
		return releaseDate;
	}

	public void setSongID(int songID) {
		this.songID = songID;
	}

	public void setSongName(String songName) {
		this.songName = songName;
	}

	public void setSongImage(String songImage) {
		this.songImage = songImage;
	}

	public void setArtist(String artist) {
		this.artist = artist;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setSongLength(float songLength) {
		this.songLength = songLength;
	}

	public void setsongFile(String songFile) {
		this.songFile = songFile;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}

}
