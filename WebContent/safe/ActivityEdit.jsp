<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
	
<%@ page import="models.Activity" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
		
		<style>
			.form-control {
				margin-bottom: 15px;
			}
		</style>
		
		<title>Activity Edit</title>
	</head>
	
	<body>
		<center>
			<h1 style="font-size: 60px; padding-bottom: 70px;">Activity</h1>
			
			<% ArrayList<Activity> actList = (ArrayList<Activity>) session.getAttribute("activityList");
				DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
				
				String editedActivityId = "";
				String editedActivityTitle = "";
				String editedActivityLocation = "";
				String editedActivityDescription = "";
				String editedActivityStartTime = "";
				String editedActivityEndTime = "";
				if (actList != null && request.getParameter("activityId") != null) {
					for(Activity activity : actList) {
						if (activity.getId() == Integer.parseInt(request.getParameter("activityId"))) {
							editedActivityId = Integer.toString(activity.getId());
							editedActivityTitle = activity.getTitle();
							editedActivityLocation = activity.getLocation();
							editedActivityDescription = activity.getDescription();
							editedActivityStartTime = formatter.format(activity.getStartTime());
							editedActivityEndTime = formatter.format(activity.getEndTime());
						}
					}
				}
			%>
			
			<form class="form-horizontal" action="/Calendar/CalendarServlet" method="post">
				<div class="form-group" style="width: 300px;">
					
					<input type="hidden" name="activityId" value="<%
						if (editedActivityId.equals("")) {
							out.print(0);
						}
						else {
							out.print(editedActivityId);
						}
					%>"></input>
					
					<input type="text" required class="form-control" name="title" placeholder="Title" value="<% out.print(editedActivityTitle); %>"></input>
					<input type="text" required class="form-control" name="location" placeholder="Location" value="<% out.print(editedActivityLocation); %>"></input>
					<input type="text" required class="form-control" name="description" placeholder="Description" value="<% out.print(editedActivityDescription); %>"></input>
					<input type="date" required class="form-control" name="startTime" value="<% out.print(editedActivityStartTime); %>"></input>
					<input type="date" required class="form-control" name="endTime" value="<% out.print(editedActivityEndTime); %>"></input>
					
					<input type="submit" class="form-control btn-info" value="Save"></input>
					
					<input type="hidden" name="formType" value="activityEdit"></input>
				</div>
			</form>
			
			<% if (!editedActivityId.equals("")) { %>
				<form class="form-horizontal" action="/Calendar/CalendarServlet" method="post">
					<div class="form-group" style="width: 300px;">
						
						<input type="hidden" name="activityId" value="<% out.print(editedActivityId); %>"></input>
						
						<input type="submit" class="form-control btn-danger" value="Delete"></input>
						
						<input type="hidden" name="formType" value="activityDelete"></input>
					</div>
				</form>
			<% } %>
			
		</center>
		
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		
		<!-- Latest compiled JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</body>
</html>