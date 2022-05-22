package com.music.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.music.model.Song;

public class MusicDBUtil {

	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;

	/* validating the user */
	public static boolean validate(String username, String password) {

		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement(); // create statement to execute the SQL query
			String sql = "select * from regularuser where Username='" + username + "' and Password='" + password + "'";
			rs = stmt.executeQuery(sql); // execute SQL query  

			if (rs.next()) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}

			con.close(); // close the connection

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isSuccess;
	}
	
	/* get the search result by passing keyword */
	public static List<Song> getSearchResult(String keyword) {

		ArrayList<Song> song = new ArrayList<>();

		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "select * from song where SongName LIKE '%" + keyword + "%'";
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

}
