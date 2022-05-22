package com.music.model;

public class RegularUser {
	private int userID;
	private String username;
	private String email;
	private String password;
	private String firstName;
	private String lastName;
	private String dateOfBirth;
	private String profilePic;
	private String userType;

	public RegularUser(int userID, String username, String email, String password, String firstName, String lastName,
			String dateOfBirth, String profilePic, String userType) {
		this.userID = userID;
		this.username = username;
		this.email = email;
		this.password = password;
		this.firstName = firstName;
		this.lastName = lastName;
		this.dateOfBirth = dateOfBirth;
		this.profilePic = profilePic;
		this.userType = userType;
	}

	public int getUserID() {
		return userID;
	}

	public String getUsername() {
		return username;
	}

	public String getEmail() {
		return email;
	}

	public String getPassword() {
		return password;
	}

	public String getFirstName() {
		return firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public String getDateOfBirth() {
		return dateOfBirth;
	}

	public String getProfilePic() {
		return profilePic;
	}
	
	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}
	
	public void setUserID(int userID) {
		this.userID = userID;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public void setProfilePic(String profilePic) {
		this.profilePic = profilePic;
	}
	
}
