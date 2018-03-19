<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ page import="models.Activity" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
		
		<!-- Font awesome -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
		
		<title>Activities</title>
		
		<style>
			table {
				width: 94%;
				margin: 0 3% 0 3%;
			}
			
			.tableCol {
				width: 50%;
			}
			
			tr {
				vertical-align: top;
			}
			
			tr p {
				margin: 15px;
			}
			
			.tableTitle {
				text-align: center;
			}
			
			.addActBtn {
				margin: 15px 0 30px 0;
				padding: 10px 50px 10px 50px;
			}
			
			.share-form {
				margin: 0 0 0 0;
				padding: 0;
			}
			
			.form-group {
				margin: 7px 0 0 0;
			}
			
			.share-form-group {
				vertical-align: middle;
			}
		</style>
	</head>
	
	<body>
		<% DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy"); %>
		
		<center>
			<a class="btn btn-primary addActBtn" role="button" href="/Calendar/safe/ActivityEdit.jsp">New Activity</a>
		</center>
		<table>
			<tr>
				<td class="tableCol">
					<h3 class="tableTitle">My Activities</h3>
				</td>
				<td class="tableCol">
					<h3 class="tableTitle">Shared Activities</h3>
				<td>
			</tr>
			<tr>
			
			<td class="tableCol">
				<table class="actTable" border="1">
				<% ArrayList<Activity> myActList = (ArrayList<Activity>) session.getAttribute("activityList");
				   if (myActList != null) {
					   for(Activity myAct : myActList) {
						   out.println("<tr>");
						   out.print("<td><p><a href=\"/Calendar/safe/ActivityEdit.jsp?activityId=" + myAct.getId() + "\">");
						   out.println(myAct.getTitle() + "</a></p></td>");
						   out.println("<td><p>" + myAct.getLocation() + "</p></td>");
						   out.println("<td><p>" + myAct.getDescription() + "</p></td>");
						   out.println("<td><p>" + formatter.format(myAct.getStartTime()) + "</p></td>");
						   out.println("<td><p>" + formatter.format(myAct.getEndTime()) + "</p></td>");
				%>
						   <td style="width: 14%;"><center>
								<form class="form-horizontal share-form" action="/Calendar/CalendarServlet" method="post">
									<div class="form-group share-form-group">
										
										<input type="hidden" name="activityId" value="<% out.print(myAct.getId()); %>"></input>
										
										<input type="submit" class="btn btn-info" value="Share"></input>
										
										<input type="hidden" name="formType" value="activityShare"></input>
									</div>
								</form>
						   </center></td>
				<%
						   out.println("</tr>");
					   }
				   }
				%>
				</table>
			</td>
			<td class="tableCol">
				<table class="actTable" border="1">
				<% ArrayList<Activity> sharedActs = (ArrayList<Activity>) getServletContext().getAttribute("sharedActivities");
				   if (sharedActs != null) {
					   for(Activity sharedAct : sharedActs) {
						   out.print("<tr>");
						   out.print("<td><p>" + sharedAct.getOwner().getFirstName() + " " + sharedAct.getOwner().getLastName() + "</p></td>");
						   out.print("<td><p>" + sharedAct.getTitle() + "</p></td>");
						   out.print("<td><p>" + sharedAct.getLocation() + "</p></td>");
						   out.print("<td><p>" + sharedAct.getDescription() + "</p></td>");
						   out.print("<td><p>" + formatter.format(sharedAct.getStartTime()) + "</p></td>");
						   out.print("<td><p>" + formatter.format(sharedAct.getEndTime()) + "</p></td>");
						   out.print("</tr>");
					   }
				   }
				%>
				</table>
			</td>
			</tr>
		</table> 
		
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		
		<!-- Latest compiled JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</body>
</html>