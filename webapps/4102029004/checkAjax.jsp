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
<%
	String name = request.getParameter("name");
	database.connectDB();
	database.query("SELECT id FROM users WHERE name = '" + name + "'");
	ResultSet rs = database.getRS();
	if(rs.next()) {
		out.print("1");
	}
%>