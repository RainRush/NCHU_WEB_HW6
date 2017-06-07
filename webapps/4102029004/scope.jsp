<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
// 設置兩個屬性
pageContext.setAttribute("uname","HELLO") ;
pageContext.setAttribute("udate",new Date()) ;
// 取得屬性
String name = (String)pageContext.getAttribute("uname") ;
Date date = (Date)pageContext.getAttribute("udate") ;
%>
<h1>P name --> <%=name%></h1>
<h1>P date --> <%=date%></h1>

<form>
<input type="submit" value="submit" name="Submit">
</form>

<%
	if(request.getParameter("Submit")!=null) {
		request.setAttribute("rname","HELLO");
		request.setAttribute("rdate",new Date());
	}
%>

<%
if(request.getAttribute("rname")!=null){
	String rename = (String)request.getAttribute("rname") ;
	Date redate = (Date)request.getAttribute("rdate") ;
%>	

<h1>R name --> <%=rename%></h1>
<h1>R date --> <%=redate%></h1>
<% } %>





</body>
</html>