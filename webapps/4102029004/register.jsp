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
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<div class="background">
		<div class="content">
			<h1>Register Page</h1><br>
			<div class="container">
			<div class="row">
			<form action="./register.jsp" method="post">
				<div class="form-group">
					<b>Name：</b><input name="Name" type="text" id="name" required>
					<div id="checkNameMessage" style="display: inline"></div>
					<%
					if(request.getParameter("submit") != null) {
						String failMessage = "<p style='color:red'>Name used!! Please use another one!</p>";
						String name = request.getParameter("Name");
						database.connectDB();
						database.query("SELECT id FROM users WHERE name = '" + name + "'");
						ResultSet rs = database.getRS();
						if(rs!=null) {	
							if(rs.next() == true) {
								out.println(failMessage);
							} else {
								String password = request.getParameter("Password");
								String birthday = request.getParameter("Birthday");
								String memo = request.getParameter("Memo");
								if (name != null && password != null && birthday != null) {
									database.connectDB();
									database.insertData(name, password, birthday, memo);
									response.sendRedirect("./index.jsp");
								}	
							}
						}
					}
					%>
				</div>
				<div class="form-group">
					<b>Password：</b><input name="Password" type="password" required><br>
				</div>
				<div class="form-group">
					<b>Birthday：</b>
					<input type="date" name="Birthday" required><br>
				</div>
				<div class="form-group">
					<label for="Memo">Memo:</label>
					<textarea class="form-control" rows="5" id="Memo" name="Memo"></textarea>
				</div>
				<input type="submit" class="btn btn-warning" value="Last Page" onclick="history.back(-1)" />
				<input type="submit" class="btn btn-primary" value="Register" name="submit">
			</form>
			</div>
			</div>
		</div>
	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="js/index.js"></script>
</body>
</html>