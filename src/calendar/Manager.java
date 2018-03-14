package calendar;

import java.util.ArrayList;

import models.User;

public class Manager {
	
	ArrayList<User> users;
	ArrayList<String> usernames;
	
	public Manager() {
		users = new ArrayList<User>();
		usernames = new ArrayList<String>();
	}
	
	
	public User login(String username, String password) {
		// Iterate through all users and find the matched one
		for (User user : users) {
			if (user.getUsername().equals(username) && user.getPassword().equals(password)) {
				return user;
			}
		}
		
		return null;
	}
	
	
	public boolean register(String firstName, String lastName, String username, String password1, String password2) {
		
		// Check if the two passwords are identical or not
		if (!password1.equals(password2)) {
			return false;
		}
		// Assure username uniqueness
		else if (this.usernames.contains(username)) {
			return false;
		}
		// No errors, create the instance
		else {
			// Create the user
			User new_user = new User(firstName, lastName, username, password1);
			
			// Add it to the user list
			users.add(new_user);
			
			// Add username to username list
			usernames.add(username);
		}
		
		return true;
	}
}
