package com.music.model;

public class Album {
	private int albumID;
	private String album_title;
	private String artist_name;
	private String album_description;
	private String album_image;
	private String songName;

	public Album(int albumID, String album_title, String artist_name, String album_description, String album_image, String songName) {
		this.albumID = albumID;
		this.album_title = album_title;
		this.artist_name = artist_name;
		this.album_description = album_description;
		this.album_image = album_image;
		this.songName = songName;
	}

	public int getAlbumID() {
		return albumID;
	}

	public String getAlbum_title() {
		return album_title;
	}

	public String getArtist_name() {
		return artist_name;
	}

	public String getAlbum_description() {
		return album_description;
	}

	public String getAlbum_image() {
		return album_image;
	}

	public String getSongName() {
		return songName;
	}

	public void setSongName(String songName) {
		this.songName = songName;
	}

	public void setAlbumID(int albumID) {
		this.albumID = albumID;
	}

	public void setAlbum_title(String album_title) {
		this.album_title = album_title;
	}

	public void setArtist_name(String artist_name) {
		this.artist_name = artist_name;
	}

	public void setAlbum_description(String album_description) {
		this.album_description = album_description;
	}

	public void setAlbum_image(String album_image) {
		this.album_image = album_image;
	}

}
