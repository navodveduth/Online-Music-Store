package com.music.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.music.model.Song;

public class SongDBConnect implements ISong {
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	private static int TotalSong;

	/* insert song data into song table */
	public static boolean uploadsong(String songName, String artistName, String description, String songImage,
			String genre, String ReleaseDt, String songFile, String userID) {

		int userId = Integer.parseInt(userID);

		boolean isSuccess = false;

		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "insert into song (SongName, ArtistName, Description, SongImage, Genre, Year, SongFile, UserID) values ('"
					+ songName + "', '" + artistName + "', '" + description + "', '" + songImage + "', '" + genre
					+ "', '" + ReleaseDt + "', '" + songFile + "', '" + userId + "')";
			int result = stmt.executeUpdate(sql);

			if (result > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}
			stmt.close();
			con.close();

		} catch (SQLException ex) {
			ex.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return isSuccess;
	}

	/* get the song details by passing user id */
	public static List<Song> getSongDetails(String userID) {

		ArrayList<Song> song = new ArrayList<>();

		int userId = Integer.parseInt(userID);

		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "select * from song where UserID='" + userId + "'";
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String artist = rs.getString(3);
				String description = rs.getString(4);
				String image = rs.getString(5);
				String genre = rs.getString(6);
				String rlsDate = rs.getString(7);
				String songfile = rs.getString(8);

				Song sg = new Song(id, name, image, artist, description, songfile, genre, rlsDate);
				song.add(sg);
			}
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return song;
	}

	/* get the total songs from song tabel */
	public static int getTotalSongs(String userId) {

		int userID = Integer.parseInt(userId);

		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "select COUNT(SongID) from song where UserID='" + userID + "'";
			rs = stmt.executeQuery(sql);

			if (rs.next()) {
				String totsongs = rs.getString("count(SongID)");
				TotalSong = Integer.parseInt(totsongs);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return TotalSong;
	}

	/* update song details */
	public static boolean updatesong(String songId, String songTitle, String artistName, String description,
			String songImage, String genre, String ReleaseDt, String songFile, String userID) {

		int songID = Integer.parseInt(songId);
		int userId = Integer.parseInt(userID);

		boolean isSuccess = false;

		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "update song set SongName='" + songTitle + "', ArtistName='" + artistName + "', Description='"
					+ description + "', SongImage='" + songImage + "', Genre='" + genre + "', Year='" + ReleaseDt
					+ "', SongFile='" + songFile + "', UserID='" + userId + "'" + "where SongID='" + songID + "'";
			int result = stmt.executeUpdate(sql);

			if (result > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}
			con.close();
			stmt.close();

		} catch (SQLException ex) {
			ex.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return isSuccess;
	}

	/* delete song from song table by getting song id */
	public static boolean deletesong(String songId) {

		int songID = Integer.parseInt(songId);

		boolean isSuccess = false;

		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "delete from song where SongID='" + songID + "'";
			int result = stmt.executeUpdate(sql);

			if (result > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}
			con.close();
			stmt.close();

		} catch (SQLException ex) {
			ex.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return isSuccess;
	}
}
