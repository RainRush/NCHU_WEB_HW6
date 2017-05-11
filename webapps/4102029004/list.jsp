<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*"%>
<jsp:useBean id="database" class="com.database.Database">
  <jsp:setProperty property="ip" name="database" value="140.120.49.205" />
  <jsp:setProperty property="port" name="database" value="3306" />
  <jsp:setProperty property="db" name="database" value="4102029004" />
  <jsp:setProperty property="user" name="database" value="4102029004" />
  <jsp:setProperty property="password" name="database" value="Ss4102029004!" />
</jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Basic Member System</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="css/app.css">
	<link rel="stylesheet" href="css/index.css">
</head>
<body>
<div class="background">
<div class="content">
	<h1>List of All Users</h1>
	
	<form action="./list.jsp" method="post">	
		Looking for those whose birthday is
		<select name="Comparison">
			<option>on</option>
			<option>before</option>
			<option>after</option>
		</select>
		<select name="Year">
			<%
				int y;
				for(y=1985; y<=2017; y++){
			%>
			<option><%= y %></option>
			<%
				}
			%>
		</select>
		<input type="submit" name="SubQuery" class="btn btn-primary" value="Search">
	</form>
	<%
	String queryCode = "SELECT id, name, birthday, created_at FROM users";
	if(request.getParameter("SubQuery")!=null){
		String comparison = request.getParameter("Comparison");
		String birthYear = request.getParameter("Year");
	%>
		<p style="color:blue;">The results of the users' birthday <%= comparison %> <%= birthYear %> are:</p>
	<%
		switch(comparison){
			case "on": comparison = "="; break;
			case "before": comparison = "<"; break;
			case "after": comparison = ">"; break;
			default: comparison = "=";
		}
		queryCode = "SELECT id, name, birthday, created_at FROM users WHERE YEAR(birthday) " + comparison + birthYear;
	}
	%>
	
	<div style="padding-bottom: 20px"></div>
	<table class="table table-hover">
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Birthday</th>
			<th>Created Time</th>
		</tr>
<%
	database.connectDB();
	database.query(queryCode);
	ResultSet rs = database.getRS();
	if(rs != null) {
		while(rs.next()) {
			String id = rs.getString("id");
			String name = rs.getString("name");
			String birthday = rs.getString("birthday");
			String created_at = rs.getString("created_at");
%>
		<tr>
			<td><%= id %></td>
			<td><%= name %></td>
			<td><%= birthday %></td>
			<td><%= created_at %></td>
		</tr>
<%			
		}
	}
	database.closeDB();
%>
	</table>
	<a href="./index.jsp" class="btn btn-warning" role="button">Back to Login</a>
</div>
</div>
</body>
</html>