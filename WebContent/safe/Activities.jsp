<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="models.Activity" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Activities</title>
		
		<style>
			table {
				width: 100%;
			}
			
			.tableCol {
				width: 50%;
			}
			
			tr p {
				margin: 15px;
			}
			
			.tableTitle {
				text-align: center;
			}
			
		</style>
	</head>
	
	<body>
		<table>
			<tr>
				<td class="tableCol">
					<p class="tableTitle">My Activities</p>
				</td>
				<td class="tableCol">
					<p class="tableTitle">Shared Activities</p>
				<td>
			</tr>
			<tr>
			<td class="tableCol">
				<table border="1">
				<% ArrayList<Activity> myActList = (ArrayList<Activity>) session.getAttribute("activityList");
				   if (myActList != null) {
					   for(Activity myAct : myActList) {
						   out.println("<tr>");
						   out.println("<td><p>" + myAct.getId() + "</p></td>");
						   out.print("<td><p><a href=\"/Calendar/safe/ActivityEdit.jsp?activityId=" + myAct.getId() + "\">");
						   out.println(myAct.getTitle() + "</a></p></td>");
						   out.println("<td><p>" + myAct.getLocation() + "</p></td>");
						   out.println("<td><p>" + myAct.getDescription() + "</p></td>");
						   out.println("<td><p>" + myAct.getStartTime() + "</p></td>");
						   out.println("<td><p>" + myAct.getEndTime() + "</p></td>");
						   out.println("</tr>");
					   }
				   }
				%>
				</table>
			</td>
			<td class="tableCol">
				<table border="1">
				<% ArrayList<Activity> atl = (ArrayList<Activity>) session.getAttribute("activityList");
				   if (myActList != null) {
					   for(Activity myAct : atl) {
						   out.print("<tr>");
						   out.print("<td><p>" + myAct.getId() + "</p></td>");
						   out.print("<td><p>" + myAct.getTitle() + "</p></td>");
						   out.print("<td><p>" + myAct.getLocation() + "</p></td>");
						   out.print("<td><p>" + myAct.getDescription() + "</p></td>");
						   out.print("<td><p>" + myAct.getStartTime() + "</p></td>");
						   out.print("<td><p>" + myAct.getEndTime() + "</p></td>");
						   out.print("</tr>");
					   }
				   }
				%>
				</table>
			</td>
			</tr>
		</table> 
		
		
	</body>
</html>