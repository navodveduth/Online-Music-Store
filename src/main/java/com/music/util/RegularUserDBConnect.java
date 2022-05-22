package com.music.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.music.model.RegularUser;

public class RegularUserDBConnect implements IRegularUser{
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;

	public static List<RegularUser> getUserDetails(String userName) {

		ArrayList<RegularUser> userlt = new ArrayList<>();

		try {

			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "select * from regularuser where Username='" + userName + "'";
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				int userID = rs.getInt(1);
				String username = rs.getString(2);
				String email = rs.getString(3);
				String password = rs.getString(4);
				String firstName = rs.getString(5);
				String lastName = rs.getString(6);
				String dateOfBirth = rs.getString(7);
				String profilePic = rs.getString(8);
				String userType = rs.getString(9);

				RegularUser us = new RegularUser(userID, username, email, password, firstName, lastName, dateOfBirth,
						profilePic, userType);
				userlt.add(us);
			}

			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return userlt;
	}
}
