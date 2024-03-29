package models;

import java.util.Date;

public class Activity {
	int id;
	String title;
	String location;
	String description;
	Date startTime;
	Date endTime;
	User owner;
	
	
	public Activity(int id, String title, String location, String description, Date startTime, Date endTime, User owner) {
		this.id = id;
		this.title = title;
		this.location = location;
		this.description = description;
		this.startTime = startTime;
		this.endTime = endTime;
		this.owner = owner;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getLocation() {
		return location;
	}


	public void setLocation(String location) {
		this.location = location;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public Date getStartTime() {
		return startTime;
	}


	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}


	public Date getEndTime() {
		return endTime;
	}


	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}


	public User getOwner() {
		return owner;
	}


	public void setOwner(User owner) {
		this.owner = owner;
	}
}
