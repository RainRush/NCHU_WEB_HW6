<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<%
			if(session.getAttribute("loginName") == null){
				response.sendRedirect("./index.jsp");	
			}
			String name = (String)session.getAttribute("loginName");
			
			if(request.getParameter("logout") != null) {
				session.removeAttribute("loginName");
				response.sendRedirect("./index.jsp");
			}
		%>
		<div class="content">
			<div id="title">
				Guten Tag, <%= name %>
			</div>
			<form>
				<input type="submit" class="btn btn-warning" value="LogOut" name="logout"/>
			</form>
		</div>
	</div>
</body>
</html>