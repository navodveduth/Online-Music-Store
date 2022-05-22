package com.music.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.music.model.Album;

public class AlbumDBConnect {
	
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	private static int TotalAlbum;

	/* upload album details */
	public static boolean uploadalbum(String albumName, String artist, String albumDescription, String albumImg,
			String tracks, String userID) {

		int userId = Integer.parseInt(userID);

		boolean isSuccess = false;

		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "insert into album (AlbumName, ArtistName, AlbumDescription, AlbumCover, SongName, UserID) values ('"
					+ albumName + "', '" + artist + "', '" + albumDescription + "', '" + albumImg + "', '" + tracks
					+ "', '" + userId + "')";
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

	/* get the all album details */
	public static List<Album> getAlbumDetails(String userID) {

		ArrayList<Album> album = new ArrayList<>();

		int userId = Integer.parseInt(userID);

		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "select * from album where UserID='" + userId + "' group by AlbumName";
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				int id = rs.getInt(1);
				String title = rs.getString(2);
				String name = rs.getString(3);
				String description = rs.getString(4);
				String image = rs.getString(5);
				String song = rs.getString(6);

				Album al = new Album(id, title, name, description, image, song);
				album.add(al);
			}
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return album;
	}

	/* count total number of albums */
	public static int getTotalAlbums(String userId) {

		int userID = Integer.parseInt(userId);

		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "select COUNT(distinct AlbumName) from album where UserID='" + userID + "'";
			rs = stmt.executeQuery(sql);

			if (rs.next()) {
				String totalbums = rs.getString("count(distinct AlbumName)");
				TotalAlbum = Integer.parseInt(totalbums);
			}
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return TotalAlbum;
	}

	/* update album details by getting user input details */
	public static boolean updatealbum(String albumTitle, String artist, String albumDescription, String albumImg,
			String tracks, String userID) {

		boolean isSuccess = false;

		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "update album set AlbumName='" + albumTitle + "', ArtistName='" + artist
					+ "', AlbumDescription='" + albumDescription + "', AlbumCover='" + albumImg + "', UserID='" + userID
					+ "'" + "where SongName='" + tracks + "'";
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

	/* delete album from album table */
	public static boolean deletealbum(String albumName) {

		boolean isSuccess = false;

		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "delete from album where AlbumName='" + albumName + "'";
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
