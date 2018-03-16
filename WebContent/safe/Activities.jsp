<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="models.Activity" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Activities</title>
	</head>
	<body>
	 
		 <% ArrayList<Activity> myActList = (ArrayList<Activity>) session.getAttribute("activityList"); %>
		 
		<table>
		    <%
		    for(int i=0; i < myActList.size(); i++){%>
		    <p>test</p>
		        <tr>
		            <td><% myActList.get(i).getId() %></td>
		        </tr>
		      <%}%>
		</table>
		
	</body>
</html>