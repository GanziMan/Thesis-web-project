<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%!String a,b; %>
<% a=request.getParameter("score");b=request.getParameter("score1"); %>
<body>
	<% if(a==null && b!=null )
	{
		response.sendRedirect("infock.jsp");	
	}else if(a!=null && b==null){
		response.sendRedirect("mocainfock.jsp");
	}else if(a!=null && b!=null){
		response.sendRedirect("mmsemocainfock.jsp");
	}
		%>	
</body>
</html>