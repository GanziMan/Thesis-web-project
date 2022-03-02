<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%@ page import= "java.sql.*" %>
	<%
 	Connection conn=null;
	String url="jdbc:mysql://localhost:3307/jspPj";
	String id="root";
	String pw="0955";
	Class.forName("com.mysql.jdbc.Driver");
	conn=DriverManager.getConnection(url,id,pw);
	%>
</body>
</html>