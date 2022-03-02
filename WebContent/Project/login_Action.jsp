<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="com.soc.controller.DAO" %> 
<%@ page import="java.io.PrintWriter" %>
 <% request.setCharacterEncoding("UTF-8"); %> 
 <!DOCTYPE html> <html lang="ko">
  	<head> 
	<meta charset="UTF-8"> 
 	</head>
  	<body>
  	  <% String userID = request.getParameter("userID"); String userPassword = request.getParameter("userPassword");%>
	  <% 
	  DAO userDAO = new DAO(); 
	  int result = userDAO.login(userID, userPassword); 
	  if(result == 1) { 
		  session.setAttribute("userID",userID);
	      Cookie cookie = new Cookie("userID",userID);
	      cookie.setMaxAge(60*60);
	      cookie.setPath("/");
	      response.addCookie(cookie);
		  PrintWriter script = response.getWriter(); 
		  script.println("<script>"); 
		  script.println("alert('로그인 성공')"); 
		  script.println("location.href = 'main.jsp'"); 
		  script.println("</script>"); 
	  %>
	
	  <%
	  }else if(result == 0) { 
		  PrintWriter script = response.getWriter();
		  script.println("<script>"); 
		  script.println("alert('비밀번호가 틀립니다.')"); 
		  script.println("location.href = './login.jsp'"); 
		  script.println("</script>"); 
		  } 
	  else if(result == -2) {
		  PrintWriter script = response.getWriter(); 
		  script.println("<script>"); 
		  script.println("alert('아이디를 확인해주세요.')"); 
		  script.println("location.href = './login.jsp'"); 
		  script.println("</script>"); 
		  } 
	  else if(result == -1) { 
		  PrintWriter script = response.getWriter(); 
		  script.println("<script>"); 
		  script.println("alert('서버 오류 입니다.')");
		  script.println("location.href = '../login.jsp'"); 
		  script.println("</script>"); 
		  } 
	%> 
 
	</body>
 </html>


