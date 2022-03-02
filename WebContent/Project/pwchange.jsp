<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
<%@ page import="com.soc.controller.DAO" %> 
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.*" %>
<html>
	 <head> 
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
           height:90%;
        }
        .submit{
         margin-left:125px;
         width:30%;
        }
        h5{
        	font-size:10px;
        }
		</style> 
	</head> 
		<body> 
				<div class="main"> 
				 <p class="sign" align="center">임시번호를 받으실 이메일주소</p>
				 <form action="pwchange2.jsp" method="post" class="form1">	
					 <div>
					 <input type="text" class="un" placeholder="사용자이메일" name="userID" maxlength="20" style="align:center" maxlength="20">   
					 </div>
					 <div>
					 <input type="submit" class="submit"  value="확인" style="align:center"> 
	 				</div>
	 				<h5 style="opacity:0.7">&#8251;1.사용자계정으로 사용한 이메일주소를 입력하고 확인버튼을 클릭 해당매일로 인증번호4자리가 전송됩니다.</h5>
	 				<h5 style="opacity:0.7">2.인증번호4자리와 새로운비밀번호와 새로운비밀번호 확인을 입력하시면 비밀번호가 변경됩니다.</h5>
	 			</form> 
			</div>
	  </body> 
 </html>



