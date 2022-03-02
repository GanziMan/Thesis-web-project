<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1.0"> 
		  <style>
	 body {
        background-color:whitesmoke;
        font-family: 'Ubuntu', sans-serif;
    }
    
    .main {
        background-color: #FFFFFF;
        width: 400px;
        height: 400px;
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
    background: lavender;
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
        margin-left: 35%;
        font-size: 13px;
        box-shadow: 0 0 20px 1px rgba(0, 0, 0, 0.04);
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
    
    @media (max-width: 480px) {
        .main {
            width:100%;
            height:100%;
            padding 0px 0px 20px 0px;
            
        }
        .submit{
        	margin-bottom:40px;
        }
        }
	  </style> 
</head>
	<body bgcolor="#333">
		<%! String cn,userID; %>
		<% cn=request.getParameter("cn"); userID=request.getParameter("userID"); %>
	
		<div class="main"> 
			<p class="sign" align="center">비밀번호변경</p>
			<form method="post" class="form1" action="pwchange3.jsp">
			<div> <input type="text" class="un" placeholder="인증번호" name="cn1" id="cn1" maxlength="20" style="align:center"> </div> 
			<div> <input type="password" class="un"  placeholder="새로운 비밀번호" name="password"  id="password" maxlength="20" style="align:center"></div>
			<div> <input type="password"class="un" placeholder="새로운 비밀번호 확인" name="passwordcf" id="passwordcf" maxlength="20" style="align:center"></div>
					<input type="hidden" name="cn" value="<%=cn%>">
					<input type="hidden" name="userID" value="<%=userID%>">
					<input type="submit" class= "submit" value="비밀번호 변경">
			</form> 
		</div>
		<script>
	
	</script>
	</body>
</html>