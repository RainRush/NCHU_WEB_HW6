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
			<div id="title">
				Overcomer
			</div>

			<div class="container">
				<div class="row">
				<form action="./index.jsp" method="post">
					<div class="form-group">
						<b>Name：</b><input name="Name" type="text" required>&nbsp;&nbsp;&nbsp;&nbsp;
						<b>Password：</b><input name="Password" type="password" required>
					</div>
					<%
						if(request.getParameter("submit") != null){
							String name = request.getParameter("Name");
							String inputPassword = request.getParameter("Password");
							String failMessage = "<p style='color:red'>Wrong Name or Password</p>";
							database.connectDB();
							database.query("SELECT password FROM users WHERE name = '" + name + "'");
							ResultSet rs = database.getRS();
							if(rs != null) {
								while(rs.next()){
									String dbPassword = rs.getString("password");
									if(dbPassword.equals(inputPassword))
										response.sendRedirect("./success.jsp");
								}
							}
							out.println(failMessage);
						}
					%>
					<div class="inForm" style="text-align:center">
						<input type="submit" class="btn btn-primary" value="Log In" name="submit">
						<a href="./register.jsp" class="btn btn-success" role="button">Register</a>
					</div>
				</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>