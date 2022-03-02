<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.soc.controller.DAO" %> 
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.Date" %>
<% request.setCharacterEncoding("UTF-8"); %> 
<!DOCTYPE html> 
	<html>
   		<head> 
   			<meta charset="UTF-8">
		</head> 
		<body> 
			<% 
			   String userID = request.getParameter("userID");
			   String userPassword = request.getParameter("Password");
			   String userPasswordcf = request.getParameter("Passwordcf"); 
			   String userDate = request.getParameter("userDate");	
			%>
 			<% Date nowTime = new Date(); %>
			<% 
				if(userID == "" || userPassword == ""  || userPasswordcf=="" ) { 
					PrintWriter script = response.getWriter(); 
					script.println("<script>");
					script.println("alert('빈칸을 확인해 주세요')");
					script.println("history.back()"); 
					script.println("</script>"); }
				else { 
					DAO userDAO = new DAO(); userDAO.setUserID(userID);
					userDAO.setUserPassword(userPassword); 
					userDAO.setUserDate(userDate);
					int result = userDAO.join(userDAO);
					if(result == -1) { 
						PrintWriter script = response.getWriter(); 
						script.println("<script>"); 
						script.println("alert('서버오류')"); 
						script.println("history.back()"); 
						script.println("</script>"); 
									}
					else if(result == 0) { 
						PrintWriter script = response.getWriter(); 
						script.println("<script>");
						script.println("alert('이미 아이디가 존재합니다.')"); 
						script.println("history.back()"); 
						script.println("</script>");
										} 
					else { 
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('회원가입을 축하드립니다.')");
						script.println("location.href = 'login.jsp'");
						script.println("</script>"); 
						} 
					}
			%> 
		</body>
	</html>