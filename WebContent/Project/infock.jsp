<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
 <%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<style type="text/css">
		
	h1{
	  	text-align:center;  
        color: #393d41;
        font-family: 'Ubuntu', sans-serif;
        font-weight: bold;
        font-size: 23px;
	}
	.pagination a{
	  display: inline-block;
	  margin-right: 5px;
	  cursor: pointer;
	}
	a:link {
	color: #666;
	font-weight: bold;
	text-decoration:none;
	}
	a:visited {
	color: #666;
	
	font-weight:bold;
	text-decoration:none;
	}	
	a:active,
	a:hover {
	color: #bd5a35;
	text-decoration:underline;
	}
	able a:link {
	color: #666;
	font-weight: bold;
	text-decoration:none;
	}
	table a:visited {
	color: #999999;
	font-weight:bold;
	text-decoration:none;
	}
	table a:active,
	table a:hover {
	color: #bd5a35;
	text-decoration:underline;
	}
	table {
	font-family:Arial, Helvetica, sans-serif;
	color:#666;
	font-size:15px;
	text-shadow: 1px 1px 0px #fff;
	width:70%;
	height:40%;
	-moz-border-radius:10px;
	-webkit-border-radius:10px;
	border-radius:10px;
	-moz-box-shadow: 0 1px 2px #d1d1d1;
	-webkit-box-shadow: 0 1px 2px #d1d1d1;
	box-shadow: 0 1px 2px #d1d1d1;
	margin:auto;
	
	border-collapse: separate;
	border-spacing: 0 20px;

	}
	table th {
	padding:15px;
	border-top:0px solid #fafafa;
	border-bottom:0px solid #e0e0e0;

	background: #ededed;
	background: -webkit-gradient(linear, left top, left bottom, from(#ededed), to(#ebebeb));
	background: -moz-linear-gradient(top,  #ededed,  #ebebeb);
	
	}
	table th:first-child{
	text-align: left;
	padding-left:20px;
	}
	table tr:first-child th:first-child{
	-moz-border-radius-topleft:3px;
	-webkit-border-top-left-radius:3px;
	border-top-left-radius:3px;
	}
	table tr:first-child th:last-child{
	-moz-border-radius-topright:3px;
	-webkit-border-top-right-radius:3px;
	border-top-right-radius:3px;
	}
	table tr{
	text-align: center;
	padding-left:20px;
	border-radius:10px;
	}
	table tr td:first-child{
	text-align: left;
	padding-left:20px;
	border-left: 0;
	}
	table tr td {
	border-radius:10px;
	padding:12px;
	border-top: 0px solid #ffffff;
	border-bottom:0px solid #e0e0e0;
	border-left: 0px solid #e0e0e0;
	
	background: #fafafa;
	background: -webkit-gradient(linear, left top, left bottom, from(#fbfbfb), to(#fafafa));
	background: -moz-linear-gradient(top,  #fbfbfb,  #fafafa);
	}
	table tr.even td{
	background: #f6f6f6;
	background: -webkit-gradient(linear, left top, left bottom, from(#f8f8f8), to(#f6f6f6));
	background: -moz-linear-gradient(top,  #f8f8f8,  #f6f6f6);
	}
	table tr:last-child td{
	border-bottom:0;
	}
	table tr:last-child td:first-child{
	
	-moz-border-radius-bottomleft:3px;
	-webkit-border-bottom-left-radius:3px;
	border-bottom-left-radius:3px;
	}
	able tr:last-child td:last-child{
	-moz-border-radius-bottomright:3px;
	-webkit-border-bottom-right-radius:3px;
	border-bottom-right-radius:3px;
	}
	table tr:hover td{
	background: #f2f2f2;
	background: -webkit-gradient(linear, left top, left bottom, from(#f2f2f2), to(#f0f0f0));
	background: -moz-linear-gradient(top,  #f2f2f2,  #f0f0f0);	
	}
	
		
	 body {
         background-color:white;
        font-family: 'Ubuntu', sans-serif;
    }
    
    .main {
        background-color:whitesmoke;
        width: 800px;
        height: 900px;
        margin: 7em auto;
        border-radius: 1.5em;
        box-shadow: 0px 11px 35px 2px rgba(0, 0, 0, 0.14);
    }
    
    .sign {
        padding-top: 40px;
        color: lightgrey;
        font-family: 'Ubuntu', sans-serif;
        font-weight: bold;
        font-size: 23px;
    }
    
    .un {
    width: 76%;
    color: black;
    font-weight: 700;
    font-size: 14px;
    letter-spacing: 1px;
    background: lightgrey;
    padding: 10px 20px;
    border: none;
    border-radius: 20px;
    outline: none;
    box-sizing: border-box;
    border: 2px solid rgba(0, 0, 0, 0.02);
    margin-bottom: 50px;
    margin-left: 46px;
    text-align: center;
    margin-bottom: 27px;
    font-family: 'Ubuntu', sans-serif;
    }
    
    form.form1 {
        padding-top: 40px;
    }
    
    .pass {
    width: 76%;
    color: rgb(38, 50, 56);
    font-weight: 700;
    font-size: 14px;
    letter-spacing: 1px;
    background: rgba(136, 126, 126, 0.04);
    padding: 10px 20px;
    border: none;
    border-radius: 20px;
    outline: none;
    box-sizing: border-box;
    border: 2px solid rgba(0, 0, 0, 0.02);
    margin-bottom: 50px;
    margin-left: 46px;
    text-align: center;
    margin-bottom: 27px;
    font-family: 'Ubuntu', sans-serif;
    }
    
   
    .un:focus, .pass:focus {
        border: 2px solid rgba(0, 0, 0, 0.18) !important;
        
    }
    
    .submit {
      cursor: pointer;
        border-radius: 5em;
        color: black;
        background: lightgrey;
        border: 0;
        padding-left: 40px;
        padding-right: 40px;
        padding-bottom: 10px;
        padding-top: 10px;
        font-family: 'Ubuntu', sans-serif;
        font-size: 13px;
        box-shadow: 0 0 20px 1px rgba(0, 0, 0, 0.04);
    }
    
     .submit1 {
      cursor: pointer;
        border-radius: 5em;
        color: black;
        background: lightgrey;
        border: 0;
        padding-left: 40px;
        padding-right: 40px;
        padding-bottom: 10px;
        padding-top: 10px;
        font-family: 'Ubuntu', sans-serif;
        font-size: 13px;
        box-shadow: 0 0 20px 1px rgba(0, 0, 0, 0.04);
        margin-left:130px;
    }
    
    .forgot {
        text-shadow: 0px 0px 3px rgba(117, 117, 117, 0.12);
        color: #E1BEE7;
        padding-top: 15px;
    }
    
    a {
        text-shadow: 0px 0px 3px rgba(117, 117, 117, 0.12);
        color: lightgrey;
        text-decoration: none
    }
    
    
    @media (max-width: 600px) {
        .main {
            border-radius: 0px;
        }
  	</style>
	</head>
	<body>
			<%String name="",value="",cookie=request.getHeader("");
	request.setCharacterEncoding("utf-8");
	// 쿠키 정보를 얻기
	Cookie[] cookies = request.getCookies();
	// 쿠키에 값이 있다면
	for(int i = 0; i<cookies.length; i++){
		 name = cookies[i].getName(); // 쿠키 이름
		 value = cookies[i].getValue(); // 쿠키 값
		if(name.equals("abc")){
			out.println("cokies[" + i + "] name : " + name);
			out.println("<br/>");
			out.println("cokies[" + i + "] value : " + value);
		}
	}
	String envalue=URLDecoder.decode(value,"utf-8");
	 
	%>
		<% 	
		 if(session.getAttribute("userID")==null){
			 PrintWriter script = response.getWriter(); 
	 	 	 script.println("<script>"); 
	  		 script.println("alert('로그인상태가 아닙니다 로그인해주세요!')"); 
	 		 script.println("location.href = 'login.jsp'"); 
	  		 script.println("</script>"); 
		 }
		%>
	<%! int age1,grade1; double score1=0,avg,std,pt;  %>
	<%! String hnum=null, sex=null, grade=null, hand=null, remember=null,userID; %>
	<%! String age=null,score=null,result=null; %>
	<%
		hnum=request.getParameter("number");
		age=request.getParameter("age");
		score=request.getParameter("score");	
		sex=request.getParameter("sex");
		userID=request.getParameter("userID");
		age1=Integer.parseInt(age);
		hand=request.getParameter("hand");
		score1=Double.parseDouble(score);
	%>
	<%
		if("man".equals(sex)){
			 sex="남자";
		}else if("woman".equals(sex)){
			sex="여자";
		}else
			sex="모름";
	%>
	<%
		grade1=0;
		grade=request.getParameter("grade");
		
		if("a".equals(grade)){
	         grade="무학이면서 비문해";
	      }else if("b".equals(grade)){
	         grade="무학이지만 비문해 아님";
	      }
		if("오른손".equals(hand)){
			hand="오른손";
		}else if("왼손".equals(hand)){
			hand="왼손";
		}else
			hand="양손잡이";
		
		remember=request.getParameter("remember");
		if("yes".equals(remember)){
			remember="정상";
		}else{
			remember="비정상";
		}
	%>

	<%
	if(age1>=45 && age1<=64){
        if("무학이면서 비문해".equals(grade)){
           avg=21.33;
           std=2.86;
           pt=18.47;
           if(score1>18.47)
              result="정상";
           else
              result="비정상";
        }else if("무학이지만 비문해 아님".equals(grade)){
           avg=25.85;
           std=2.84;
           pt=23.01;
           if(score1>23.01)
              result="정상";
           else
              result="비정상";
        }else if(grade1>=1 && grade1<=3){
           avg=25.85;
           std=2.84;
           pt=23.01;
           if(score1>23.08)
              result="정상";
           else
              result="비정상";
        }else if(grade1>=4 && grade1<=6){
           avg=27.20;
           std=2.12;
           pt=25.08;
           if(score1>25.08)
              result="정상";
           else
              result="비정상";
        }else if(grade1>=7){
           avg=27.77;
           std=2.75;
           pt=25.02;
           if(score1>25.02)
              result="정상";
           else
              result="비정상";
        }
     }
     else if(age1>=65 && age1<=69){
        if("무학이면서 비문해".equals(grade)){
           avg=20.13;
           std=3.33;
           pt=16.80;
           if(score1>16.80)
              result="정상";
           else
              result="비정상";
        }else if("무학이지만 비문해 아님".equals(grade)){
           avg=25.40;
           std=3.25;
           pt=22.15;
           if(score1>22.15)
              result="정상";
           else
              result="비정상";
        }else if(grade1>=1 && grade1<=3){
           avg=25.40;
           std=3.25;
           pt=22.15;
           if(score1>22.15)
              result="정상";
           else
              result="비정상";
        }else if(grade1>=4 && grade1<=6){
           avg=26.18;
           std=2.78;
           pt=23.40;
           if(score1>23.40)
              result="정상";
           else
              result="비정상";
        }else if(grade1>=7){
           avg=27.20;
           std=2.80;
           pt=24.40;
           if(score1>24.40)
              result="정상";
           else
              result="비정상";
        }
     }else if(age1>=70 && age1<=74){
        if("무학이면서 비문해".equals(grade)){
           avg=19.33;
           std=3.74;
           pt=15.59;
           if(score1>15.59)
              result="정상";
           else
              result="비정상";
        }else if("무학이지만 비문해 아님".equals(grade)){
           avg=25.19;
           std=3.36;
           pt=21.83;
           if(score1>21.83)
              result="정상";
           else
              result="비정상";
        }else if(grade1>=1 && grade1<=3){
           avg=25.19;
           std=3.36;
           pt=21.83;
           if(score1>21.83)
              result="정상";
           else
              result="비정상";
        }else if(grade1>=4 && grade1<=6){
           avg=26.05;
           std=3.46;
           pt=22.59;
           if(score1>22.59)
              result="정상";
           else
              result="비정상";
        }else if(grade1 >=7){
           avg=27.09;
           std=2.95;
           pt=24.14;
           if(score1>24.14)
              result="정상";
           else
              result="비정상";
        }
     }else if(age1>=75 && age1<=84){
        if("무학이면서 비문해".equals(grade)){
           avg=18.05;
           std=3.49;
           pt=14.56;
           if(score1>14.56)
              result="정상";
           else
              result="비정상";
        }else if("무학이지만 비문해 아님".equals(grade)){
           avg=24.26;
           std=3.85;
           pt=20.41;
           if(score1>20.41)
              result="정상";
           else
              result="비정상";
        }else if(grade1>=1 && grade1<=3){
           avg=24.26;
           std=3.85;
           pt=20.41;
           if(score1>20.41)
              result="정상";
           else
              result="비정상";
        }else if(grade1>=4 && grade1<=6){
           avg=25.23;
           std=4.11;
           pt=21.12;
           if(score1>21.12)
              result="정상";
           else
              result="비정상";
        }else if(grade1>=7){
           avg=26.41;
           std=3.76;
           pt=22.65;
           if(score1>22.65)
              result="정상";
           else
              result="비정상";
        }
     }else if(age1>=85 && age1<=90){
        if("무학이면서 비문해".equals(grade)){
           avg=15.73;
           std=4.01;
           pt=11.72;
           if(score1>11.72)
              result="정상";
           else
              result="비정상";
        }else if("무학이지만 비문해 아님".equals(grade)){
           avg=22.67;
           std=4.18;
           pt=18.49;               
           if(score1>18.49)
              result="정상";
           else
              result="비정상";
        }else if(grade1>=1 && grade1<=3){
           avg=22.67;
           std=4.18;
           pt=19.49;
           if(score1>18.49)
              result="정상";
           else
              result="비정상";
        }else if(grade1>=4 && grade1<=6){
           avg=24.00;
           std=4.17;
           pt=19.83;
           if(score1>19.83)
              result="정상";
           else
              result="비정상";
        }else if(grade1>=7){
           avg=28.50;
           std=2.12;
           pt=26.38;
           if(score1>26.38)
              result="정상";
           else
              result="비정상";
        }
     }
	%>

	 <div class="main"> 
	 	<h1>Input Confirm</h1>
		<table>
		
		<tr>
			<td>환자번호</td>
			<td><strong><%=hnum %></strong></td>
		</tr>
		
		<tr>
			<td>나이</td>
			<td><strong><%=age%></strong></td>
		</tr>
		<tr>
			<td>K-MMSE 점수</td>
			<td><strong><%=score %></strong></td>
		</tr>
		<tr>
			<td>성별</td>
			<td><strong><%=sex%></strong></td>
		</tr>
		<tr>
			<td>학력</td>
			<td><strong><%=grade %></strong></td>
		</tr>
		<tr>
			<td>handless</td>
			<td><strong><%=hand %></strong></td>
		</tr>
		<tr>
			<td>인지장애호소</td>
			<td><strong><%=remember%></strong></td>
		</tr>
		
		<tr>
			<td colspan="2" >입력한 정보가 맞지 않으면 <button  class="submit" onclick="history.back()">Back</button></td>
		</tr>
		
	</table>

		<table>
			<tr>
				<td colspan="2"><h2>입력한 환자의 K-MMSE 규준</h2></td>
				
				
			</tr>
			<tr>
				<td>K-MMSE 평균</td>
				<td><%=avg%></td>
			</tr>
			<tr>
				<td>K-MMSE 표준편차</td>
				<td><%=std%></td>
			</tr>
			<tr>
				<td>K-MMSE 16percentile</td>
				<td><%=pt%></td>
			</tr>
			<tr>
				<td>입력한 환자의 K-MMSE 결과</td>
				<td><%=result%></td>
			</tr>
		</table>
		

		<form action="infodb.jsp" method="post" >
			<input type="hidden" name="hnum" value="<%=hnum%>">
			<input type="hidden" name="age" value="<%=age%>">
			<input type="hidden" name="score" value="<%=score%>">
			<input type="hidden" name="remember" value="<%=remember%>">
			<input type="hidden" name="sex" value="<%=sex%>">
			<input type="hidden" name="grade" value="<%=grade%>">
			<input type="hidden" name="hand" value="<%=hand%>">
			<input type="hidden" name="userID" value="<%=userID%>">
			<input type="submit" class="submit1" value="DB저장">
		</form>
			 </div>
			 <%grade=null; grade1=0; %>
	</body>
</html>