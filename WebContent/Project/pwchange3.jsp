<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%! String sql,cn,cn1,userID=null,password,passwordcf;%>
<%password=request.getParameter("password"); passwordcf=request.getParameter("passwordcf"); userID=request.getParameter("userID"); cn=request.getParameter("cn");cn1=request.getParameter("cn1");%>

	<% 
	if(cn1.equals(cn))
	 {
		if(!password.equals(passwordcf)){
		 PrintWriter script = response.getWriter(); 
		 script.println("<script>"); 
  		 script.println("alert('입력하신 비밀번호와 비밀번호확인이 일치하지 않습니다. 다시 입력해주세요!')"); 
 		 script.println("location.href ='javascript:history.back()'"); 
  		 script.println("</script>"); 
		}
		else if(password.equals(passwordcf))
		{
			out.print(passwordcf);
		String url="jdbc:mysql://localhost:3307/jspPj";
		String id="root";
		String pw="0955";
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn=DriverManager.getConnection(url,id,pw);
		PreparedStatement pstmt=null; 
		ResultSet rs=null;
			try{
				sql="update loginDB set userPassword = '"+password+"' where userID= '"+userID+"'";
				
				pstmt=conn.prepareStatement(sql);
				pstmt.executeUpdate();
				
			}catch(Exception e){
		}finally{
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		}
			
	%>
		
		<% 	
		
		 PrintWriter script = response.getWriter(); 
 	 	 script.println("<script>"); 
  		 script.println("alert('비밀번호 변경완료. 로그인 화면으로 이동하겠습니다.')"); 
 		 script.println("location.href = 'login.jsp'"); 
  		 script.println("</script>"); 
	}
	 }
	else{
		 PrintWriter script = response.getWriter(); 
		 script.println("<script>"); 
  		 script.println("alert('입력하신 인증번호가 옳바르지 않습니다. 다시 입력해주세요!')"); 
 		 script.println("location.href ='javascript:history.back()'"); 
  		 script.println("</script>"); 
	}
	 %>
</body>
</html>