package com.music.model;

public class AdminUser extends RegularUser {

	public AdminUser(int userID, String username, String email, String password, String firstName, String lastName,
			String dateOfBirth, String profilePic, String userType) {
		super(userID, username, email, password, firstName, lastName, dateOfBirth, profilePic, userType);
	}

}
