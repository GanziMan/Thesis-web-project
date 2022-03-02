<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
<html> 
	<head> 
	<meta charset="UTF-8"> <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		 <style>
 	 body {
      background-color:whitesmoke;
      font-family: 'Ubuntu', sans-serif;
   	 }
    
    .main {
        background-color: #FFFFFF;
        width: 400px;
        height: 500px;
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
    color:black;
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
        	position:fixed;
        	top:-20%;
        	right:1%;
            height:100%;
            width:100%;
            margin:0auto;
        }
        .submit{
        	margin-left:150px;
        	margin-bottom:40px;
        }
		</style>

	</head>
 	<body> 
   			<div class="main"> 
  		   <p class="sign" align="center">회원가입</p>
   			<form method="post" action="./join_Action.jsp" class="form1" > 
   			<div> <input type="text" class="un" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" id="email"style="ime-mode:disabled;" placeholder="이메일" name="userID" maxlength="20" required autofocus></div> 
  			<div> <input type="password" class="un" placeholder="새로운 비밀번호" name="Password" id="userPassword"></div>
  			<div> <input type="password" class="un" placeholder="새로운 비밀번호 확인" name="Passwordcf"  id="userPasswordcf"></div>

    			  <input type="submit" OnClick = "test(); emailCheck();"class="submit" value="회원가입"> 
    		</form> 
    		</div>  
    	
    		
    		 <script type="text/javascript">
    			    function test() {
    			      var p1 = document.getElementById('userPassword').value;
    			      var p2 = document.getElementById('userPasswordcf').value;
    			          if( p1 != p2 ) {
    			            alert("비밀번호불일치");
    			            return false;
    			          } else{
    			            return true;
    			          }		
    			    } 
    		</script>
    		<script>
    		$(document).ready(function(){ 
		$("#submit").click(function(){
				
			if($("#cn1").val().length==0){ alert("k-mmse점수를 입력하세요"); $("#점수").focus(); return false; }				
			if($("#userPassword").val().length==0){ alert("새로운 비밀번호 입력해주세요."); $("#userPassword").focus(); return false; }
			if($("#userPasswordcf").val().length==0){ alert("새로운 비밀번호 확인 입력해주세요!"); $("#userPasswordcf").focus(); return false; }
					});		
			});
    		</script>
    		
    	



     </body>
</html>

