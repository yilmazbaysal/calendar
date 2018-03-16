package calendar;

import java.util.ArrayList;
import java.util.Date;

import models.Activity;
import models.User;

public class Manager {

	ArrayList<User> users;
	ArrayList<String> usernames;
	
	int lastActivityId = 1;

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

	public Activity activityEdit(ArrayList<Activity> activities, int id, String title, String location, String description, Date startTime,
			Date endTime, User owner) {
		if (id == 0) {
			Activity activity = new Activity(this.lastActivityId, title, location, description, startTime, endTime, owner);
			this.lastActivityId += 1;
			
			return activity;
		}
		else {
			for (Activity activity : activities) {
				if(activity.getId() == id) {
					activity.setTitle(title);
					activity.setLocation(location);
					activity.setDescription(description);
					activity.setStartTime(startTime);
					activity.setEndTime(endTime);
				}
			}
		}
		
		return null;
	}
}
