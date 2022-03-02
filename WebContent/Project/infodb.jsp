<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.Iterator" %>
<%@ include file="DB.jsp" %>
<%@ page import="java.sql.*"  %>
<%@ page import="java.util.Date" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% Date nowTime = new Date(); %>
<%! int age1,grade1; double score1; %>
<%! String hnum, sex, grade, hand, remember,result=null,userID; %>
<%! String age,score; %>

<html>
	<head>
	<meta charset="UTF-8">
	</head>
		<body bgcolor="#999">
		<%
			Statement stmt=null;
			
			userID=request.getParameter("userID");
			age=request.getParameter("age");
			hnum=request.getParameter("hnum");
			grade=request.getParameter("grade");
			hand=request.getParameter("hand");
			remember=request.getParameter("remember");
			score=request.getParameter("score");
			sex=request.getParameter("sex");
			age1=Integer.parseInt(age);
			score1=Double.parseDouble(score);
			
		
			if(age1>=45 && age1<=64){
				if(grade.equalsIgnoreCase("무학이면서 비문해")){
					
					if(score1>18.47)
						result="정상";
					else
						result="비정상";
				}else if(grade.equalsIgnoreCase("무학이지만 비문해 아님")){
			
					if(score1>23.01)
						result="정상";
					else
						result="비정상";
				}else if(Integer.parseInt(grade)>2 && Integer.parseInt(grade)<7){
				
					if(score1>25.08)
						result="정상";
					else
						result="비정상";
				}else{
				
					if(score1>25.02)
						result="정상";
					else
						result="비정상";
				}
			}
			else if(age1>=65 && age1<=69){
				if(grade.equalsIgnoreCase("무학이면서 비문해")){
			
					if(score1>16.80)
						result="정상";
					else
						result="비정상";
				}else if(grade.equalsIgnoreCase("무학이지만 비문해 아님")){
					
					if(score1>22.15)
						result="정상";
					else
						result="비정상";
				}else if(Integer.parseInt(grade)>2 && Integer.parseInt(grade)<7){
				
					if(score1>23.40)
						result="정상";
					else
						result="비정상";
				}else{
				
					if(score1>24.40)
						result="정상";
					else
						result="비정상";
				}
			}else if(age1>=70 && age1<=74){
				if(grade.equalsIgnoreCase("무학이면서 비문해")){
				
					if(score1>15.59)
						result="정상";
					else
						result="비정상";
				}else if(grade.equalsIgnoreCase("무학이지만 비문해 아님")){
				
					if(score1>21.83)
						result="정상";
					else
						result="비정상";
				}else if(Integer.parseInt(grade)>2 && Integer.parseInt(grade)<7){
				
					if(score1>22.59)
						result="정상";
					else
						result="비정상";
				}else{
					
					if(score1>24.14)
						result="정상";
					else
						result="비정상";
				}
			}else if(age1>=75 && age1<=84){
				if(grade.equalsIgnoreCase("무학이면서 비문해")){
					
					if(score1>14.56)
						result="정상";
					else
						result="비정상";
				}else if(grade.equalsIgnoreCase("무학이지만 비문해 아님")){
					
					if(score1>20.41)
						result="정상";
					else
						result="비정상";
				}else if(Integer.parseInt(grade)>2 && Integer.parseInt(grade)<7){
					
					if(score1>21.12)
						result="정상";
					else
						result="비정상";
				}else{
					
					if(score1>22.65)
						result="정상";
					else
						result="비정상";
				}
			}else if(age1>=85 && age1<=90){
				if(grade.equalsIgnoreCase("무학이면서 비문해")){
				
					if(score1>11.72)
						result="정상";
					else
						result="비정상";
				}else if(grade.equalsIgnoreCase("무학이지만 비문해 아님")){
				
					if(score1>18.49)
						result="정상";
					else
						result="비정상";
				}else if(Integer.parseInt(grade)>2 && Integer.parseInt(grade)<7){
				
					if(score1>19.83)
						result="정상";
					else
						result="비정상";
				}else{
					
					if(score1>26.38)
						result="정상";
					else
						result="비정상";
				}
			}
		  	 try{
		  		 String sql="insert into kmmse1(useremail,환자번호,나이,점수,성별,학력,손,기억력판단,입력시간) values('"+userID+"',hex(aes_encrypt('"+hnum+"','a')),'"+age1+"','"+score+"','"+sex+"','"+grade+"','"+hand+"','"+result+"','"+nowTime+"')";
						  	stmt=conn.createStatement();
						  	stmt.executeUpdate(sql);
			  }catch(SQLException ex){
				 
					out.println("SQLException: "+ ex.getMessage());
			  }		  	
		%>
 		 <% 	
			 PrintWriter script = response.getWriter(); 
	 	 	 script.println("<script>"); 
	  		 script.println("alert('정보가 입력되었습니다.')"); 
	 		 script.println("location.href = 'main.jsp'"); 
	  		 script.println("</script>"); 
		 
		 %>
</body>
</html>