package com.music.util;

import java.util.List;
import com.music.model.Album;

public interface IAlbum {
	static List<Album> getAlbumDetails(String userID) {
		return null;
	}

	static boolean uploadalbum(String albumTitle, String artist, String albumDescription, String albumImg,
			String tracks, String userID) {
		return false;
	}

	static boolean updatealbum(String albumTitle, String artist, String albumDescription, String albumImg,
			String tracks, String userID) {
		return false;
	}

	static boolean deletealbum(String albumName) {
		return false;
	}

}
