<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ page import="com.soc.controller.DAO" %> 
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.soc.controller.MailSend" %>
<%@ page import="com.soc.controller.CN" %>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
 .bt_login { font-size: 20px; padding: 5px; background-color: rgba(255, 255, 255, 1); border: none; border: solid 1px rgba(0, 0, 0, 1); cursor: pointer; }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="#333">
<%! String cn,userID=null; %>
<%userID=request.getParameter("userID"); %>

 <%		
			String url="jdbc:mysql://localhost:3307/jspPj";
			String id="root";
			String pw="0955";
			int n=0;
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection(url,id,pw);
			String sql="SELECT * FROM loginDB";
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			pstmt=conn.prepareStatement("select * from loginDB");
			rs=pstmt.executeQuery(sql);
			while(rs.next()){
				if(userID.equals(rs.getString("userID"))){ 
					n++;
				 }
				else{
					
				}
			}
	%>	

<% 	
	if(n==0)
	{
	 PrintWriter script = response.getWriter(); 
	 	 script.println("<script>"); 
 		 script.println("alert('없는 매일입니다.')"); 
 		 script.println("history.back()"); 
 		 script.println("</script>"); 
	}
	else{
 %>		<% cn=CN.numberGen(4,2); %>
		<%=MailSend.send(cn,userID)%>
	 <jsp:forward page="pwchange2-1.jsp">
	 	<jsp:param name="cn" value="<%=cn%>"/>
	 	<jsp:param name="userID" value="<%=userID%>"/>
	 </jsp:forward>
	 <%} %>
	
</body>
</html>