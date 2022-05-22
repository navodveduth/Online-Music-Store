package com.music.util;

import java.util.List;
import com.music.model.Song;

public interface ISong {
	
	static List<Song> getSongDetails(String userID) {
		return null;
	}
	
	static boolean uploadsong(String songTitle, String artistName, String description, String songImage, String genre,
			String ReleaseDt, String songFile, String userID) {
		return false;
	}

	static boolean updatesong(String songId, String songTitle, String artistName, String description, String songImage,
			String genre, String ReleaseDt, String songFile, String userID) {
		return false;
	}
	
	static boolean deletesong(String songId) {
		return false;
	}
	
}
