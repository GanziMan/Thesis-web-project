<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<html>
	<head>
	<meta charset="UTF-8">
	</head>
		<body>
		 <%
		 	String name="",value="";
		 request.setCharacterEncoding("utf-8");
			
			Cookie[] cookies = request.getCookies();
			
			for(int i = 0; i<cookies.length; i++){
				 name = cookies[i].getName();
				value = cookies[i].getValue();
				if(name.equals("abc")){
					out.println("cokies[" + i + "] name : " + name);
					out.println("<br/>");
					out.println("cokies[" + i + "] value : " + value);
					// 유효시간을 0초 설정 삭제하는 효과
					cookies[i].setMaxAge(0);
					response.addCookie(cookies[i]);
					out.println("cokies[" + i + "] name : " + name);
					out.println("<br/>");
					out.println("cokies[" + i + "] value : " + value);
				}
			}
		%>
		 <% 
		 session.invalidate();
		
		  PrintWriter script = response.getWriter(); 
		  script.println("<script>"); 
		  script.println("alert('로그아웃 성공')"); 
		  script.println("location.href = 'login.jsp'"); 
		  script.println("</script>"); 
		  %>
	</body>
</html>