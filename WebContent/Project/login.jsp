<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
 <%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<!-- Created by CodingLab |www.youtube.com/CodingLabYT-->
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
     <meta name="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
   
     <meta name="HandheldFriendly" content="true" />
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
     <title>Login</title>
    <script src="https://kit.fontawesome.com/51db22a717.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Alata&display=swap" rel="stylesheet">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
          <meta http-equiv="ScreenOrientation" content="autoRotate:disabled">
      <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
   <!--  <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
     
     <style>
     @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
		  

	.main {
		text-align:center;
      background-color: #FFFFFF;
      position:relative;
   	margin-top:130px;
      width: 70%;
      height: 600px;	
      border-radius: 1.5em;
      box-shadow: 0px 11px 35px 2px rgba(0, 0, 0, 0.14);
     	
    }
    .un {
   
    width: 50%;
  		position:relative;
  		top:120px;
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
    text-align: center;
    font-family: 'Ubuntu', sans-serif;
    }
    .sign {
    	position:relative;
    	top:50px;
    	
        color: lightgrey;
        font-family: 'Ubuntu', sans-serif;
        font-weight: bold;
        font-size: 23px;
    }
    
    .pass {
   	position:relative;
   	top:160px;
    width: 50%;
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
    text-align: center;
    font-family: 'Ubuntu', sans-serif;
    }
     .un:focus, .pass:focus {
        border: 2px solid rgba(0, 0, 0, 0.18) !important;
        
    }
      .submit {
    	
		position:relative;
		top:200px;
      cursor: pointer;
        border-radius: 5em;
        color: black;
        background: whitesmoke;
        border: 0;
        padding-left: 40px;
        padding-right: 40px;
        padding-bottom: 10px;
        padding-top: 10px;
        font-family: 'Ubuntu', sans-serif;
        font-size: 13px;
        box-shadow: 0 0 20px 1px rgba(0, 0, 0, 0.04);
    }
    
    .forgot {
		position:relative;
		top:300px;
	
        text-shadow: 0px 0px 3px rgba(117, 117, 117, 0.12);
        color: #E1BEE7;
      
    }

    a {
        text-shadow: 0px 0px 3px rgba(117, 117, 117, 0.12);
        color: lightgrey;
        text-decoration: none
    }
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Poppins" , sans-serif;
}
.sidebar{
  position: fixed;
  left: 0;
  top: 0;
  height: 100%;
  width: 78px;
  background: #11101D;
  padding: 6px 14px;
  z-index: 99;
  transition: all 0.5s ease;
}


.sidebar{
  position: fixed;
  left: 0;
  top: 0;
  height: 100%;
  width: 78px;
  background: #11101D;
  padding: 6px 14px;
  z-index: 99;
  transition: all 0.5s ease;
}

.sidebar.open{
  width: 250px;
}
.sidebar .logo-details{
  height: 60px;
  display: flex;
  align-items: center;
  position: relative;
}
.sidebar .logo-details .icon{
  opacity: 0;
  transition: all 0.5s ease;
}
.sidebar .logo-details .logo_name{
  color: #fff;
  font-size: 20px;
  font-weight: 600;
  opacity: 0;
  transition: all 0.5s ease;
}
.sidebar.open .logo-details .icon,
.sidebar.open .logo-details .logo_name{
  opacity: 1;
}
.sidebar .logo-details #btn{
  position: absolute;
  top: 50%;
  right: 0;
  transform: translateY(-50%);
  font-size: 22px;
  transition: all 0.4s ease;
  font-size: 23px;
  text-align: center;
  cursor: pointer;
  transition: all 0.5s ease;
}
.sidebar.open .logo-details #btn{
  text-align: right;
}
.sidebar i{
  color: #fff;
  height: 60px;
  min-width: 50px;
  font-size: 28px;
  text-align: center;
  line-height: 60px;
}
.sidebar .nav-list{
  margin-top: 20px;
  height: 100%;
}
.sidebar li{
  position: relative;
  margin: 8px 0;
  list-style: none;
}
.sidebar li .tooltip{
  position: absolute;
  top: -20px;
  left: calc(100% + 15px);
  z-index: 3;
  background: #fff;
  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.3);
  padding: 6px 12px;
  border-radius: 4px;
  font-size: 15px;
  font-weight: 400;
  opacity: 0;
  white-space: nowrap;
  pointer-events: none;
  transition: 0s;
}
.sidebar li:hover .tooltip{
  opacity: 1;
  pointer-events: auto;
  transition: all 0.4s ease;
  top: 50%;
  transform: translateY(-50%);
}
.sidebar.open li .tooltip{
  display: none;
}
.sidebar input{
  font-size: 15px;
  color: #FFF;
  font-weight: 400;
  outline: none;
  height: 50px;
  width: 100%;
  width: 50px;
  border: none;
  border-radius: 12px;
  transition: all 0.5s ease;
  background: #1d1b31;
}
.sidebar.open input{
  padding: 0 20px 0 50px;
  width: 100%;
}
.sidebar .bx-search{
  position: absolute;
  top: 50%;
  left: 0;
  transform: translateY(-50%);
  font-size: 22px;
  background: #1d1b31;
  color: #FFF;
}
.sidebar.open .bx-search:hover{
  background: #1d1b31;
  color: #FFF;
}
.sidebar .bx-search:hover{
  background: #FFF;
  color: #11101d;
}
.sidebar li a{
  display: flex;
  height: 100%;
  width: 100%;
  border-radius: 12px;
  align-items: center;
  text-decoration: none;
  transition: all 0.4s ease;
  background: #11101D;
}
.sidebar li a:hover{
  background: #FFF;
}
.sidebar li a .links_name{
  color: #fff;
  font-size: 15px;
  font-weight: 400;
  white-space: nowrap;
  opacity: 0;
  pointer-events: none;
  transition: 0.4s;
}
.sidebar.open li a .links_name{
  opacity: 1;
  pointer-events: auto;
}
.sidebar li a:hover .links_name,
.sidebar li a:hover i{
  transition: all 0.5s ease;
  color: #1101D;
}
.sidebar li i{
  height: 50px;
  line-height: 50px;
  font-size: 18px;
  border-radius: 12px;
}
.sidebar li.profile{
  position: fixed;
  height: 60px;
  width: 78px;
  left: 0;
  bottom: -8px;
  padding: 10px 14px;
  background: black;
  transition: all 0.5s ease;
  overflow: hidden;
}
.sidebar.open li.profile{
  width: 250px;
}
.sidebar li .profile-details{
  display: flex;
  align-items: center;
  flex-wrap: nowrap;
}
.sidebar li img{
  height: 45px;
  width: 45px;
  object-fit: cover;
  border-radius: 6px;
  margin-right: 10px;
}
.sidebar li.profile .name,
.sidebar li.profile .job{
  font-size: 15px;
  font-weight: 400;
  color: #fff;
  white-space: nowrap;
}
.sidebar li.profile .job{
  font-size: 12px;
}
.sidebar .profile #log_out{
  position: absolute;
  top: 50%;
  right: 0;
  transform: translateY(-50%);
  background: black;
  width: 100%;
  height: 60px;
  line-height: 60px;
  border-radius: 0px;
  transition: all 0.5s ease;
}
.sidebar.open .profile #log_out{
  width: 50px;
  background: black;
}
.home-section{
  position: relative;
  background: black;
 
  top: 0;
  left: 78px;
  width: calc(100% - 78px);
  transition: all 0.5s ease;
  z-index: 2;
}
.sidebar.open ~ .home-section{
  left: 250px;
  width: calc(100% - 250px);
}
.home-section .text{
  display: inline-block;
  color: #11101d;
  font-size: 25px;
  font-weight: 500;
  margin: 18px
}

*{
  
    box-sizing: border-box;
    font-family: 'Alata', sans-serif;
}

.page-container{
    width: 100%;
    height: 100%;
    background: #eff0f2;
    position:fixed;
    justify-content: center;
    align-items: center;

}
.shadow{
    -webkit-box-shadow: 27px 43px 43px -26px rgba(89,89,89,0.39);
    -moz-box-shadow: 27px 43px 43px -26px rgba(89,89,89,0.39);
    box-shadow: 27px 43px 43px -26px rgba(89,89,89,0.39);
}/*
.shadow-light{
    -webkit-box-shadow: 45px 45px 104px -33px rgba(38,38,38,0.92);
    -moz-box-shadow: 45px 45px 104px -33px rgba(38,38,38,0.92);
    box-shadow: 45px 45px 104px -33px rgba(38,38,38,0.92);

}*/
.login-form-container{
 
    background:#f5f5f5 ;
    width:100%;
    height:100%;
    display: flex;
    flex-direction: row;
    box-shadow: 10px black;
    border-radius: 10px;

}
.login-form-right-side{
    width: 55%; 
    border-radius: 10px 0px 0px 10px;
    padding:75px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    color: white;
    background-image: 
  radial-gradient(ellipse farthest-corner at 0 140%, black 5%, #2178ff 70%, #3585ff 70%);
}
.login-form-right-side h1{
    color: white;
    width:100%;
    font-size:40px;
    margin-right:300px;
    margin-top:100px;
    text-align: right;
    opacity: 0.9;

}
.login-form-right-side p{
    padding-top: 50px;
    font-size:13px;
    text-align: right;
    opacity: 0.8;
    margin-bottom:50px;
}
.login-form-left-side{
    width: 45%;
    border-radius: 0px 10px 10px 0px;
    display: flex;

    flex-direction: column;
    align-items: center;
    padding:40px;
    background: rgb(255,255,255);
background: linear-gradient(287deg, rgba(255,255,255,1) 0%, rgba(243,244,244,1) 0%, rgba(255,255,255,1) 100%);
}

.login-input-container{
    padding-top:120px;
    width:300px;
}
.login-input-container .login-input-wrap{
    width:300px;
    height: 45px;
    margin-top: 0px;
    border-radius: 2px;
    border-bottom: solid 1px #2178ff;
   
}
.menu-container{
	display:none;
}
	@media ( max-width: 900px){
	 @import url('https://fonts.googleapis.com/css?family=Open+Sans:400i,600,700,800&display=swap');
	      * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
		html{		
			-ms-content-zooming: none;
			-ms-touch-action: pan-x pan-y;
			
		}
  
	.login-form-container{
	position: relative;
	width:auto;
	height:100%;
	}
    .login-form-right-side{
	display:none;
	position:fixed;
	}
	.login-form-left-side{
	position: relative;
	float:none;
	width:100%;
	height:100%;
	}
	.sign{
			margin: 0 auto;
			top:130px;
			left:10px;
	}
	.main{
	margin-top:30px;
	margin-right:150px;
	margin-bottom:-400px;	
	width:350px;
	height:400px;

	}
	.un{
		 top:180px;
		 left:5px;
		 margin:0 auto;
		 width:150px;
	}
	.pass{
		
		top:240px;
		left:5px;
		margin:0 auto;
		width:150px;
	}
	.submit{
		top:310px;
		left:5px;
		margin:0 auto;
		width:100px;
		margin-bottom:300px;
	}
	.forgot{
	 	top:370px;
	 	left:5px;
	 	margin:0 auto;
	 	width:200px;
	
	
	}
	.sidebar{
		display:none;
	}
	  .menu-container{
		 

		  transform: translate(-35%, -50%);
		  width:200px;
		  display: flex;
		  align-items: center;
		  justify-content: center;
}
.button{
  position: relative;
  background: white;
  color:black;
  font-size: 20px;
  padding: 8px 20px;
  width:50px;
  line-height: 30px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  border-radius: 25px;
  cursor: pointer;
  transition: width .4s;
}
.fas.expand:before{
  content: '\f00d';
}
ul{
  left:50px;
  list-style: none;
  position: absolute;
  top: 65px;
  display: block;
  background: #1b1b1b;
  width: 100%;
  text-align: center;
  border-radius: 5px;
  display: none;
  box-shadow: 0 3px 6px rgba(0,0,0,0.3);
}
	ul:before{
	  position: absolute;
	  content: '';
	  width: 20px;
	  height: 20px;
	  background: #1b1b1b;
	  top: -10px;
	  right: 130px;
	  transform: rotate(45deg);
	  z-index: -1;
	}
	ul li{
	  line-height: 35px;
	  padding: 8px 20px;
	  cursor: pointer;
	  border: 1px solid transparent;
	  border-bottom: 1px solid rgba(255,255,255,.1);
	}
	ul li:last-child{
	  border-bottom: none;
	}
	ul li:hover{
	  box-shadow: inset 0 0 5px #33ffff,
	              inset 0 0 10px #66ffff;
	}
	ul li:hover:first-child{
	  border-radius: 5px 5px 0 0;
	}
	ul li:hover:last-child{
	  border-radius: 0 0 5px 5px;
	}
	ul li a{
	  color: white;
	  font-size: 18px;
	  text-decoration: none;
	}
	ul li:hover a{
	  color: cyan;
	}
	        
}
@media ( max-width: 823px) and (orientation:landscape){
	 @import url('https://fonts.googleapis.com/css?family=Open+Sans:400i,600,700,800&display=swap');
	      * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
		html{		
			-ms-content-zooming: none;
			-ms-touch-action: pan-x pan-y;
		}
  
	.login-form-container{
	position: relative;
	width:auto;
	height:100%;
	}
    .login-form-right-side{
	display:none;

	}
	.login-form-left-side{
	position:fixed;
	float:none;
	top:10%;
	overflow:scroll;

	}
	.sign{
			margin: 0 auto;
			top:30px;
			left:10px;
	}
	.main{
		position:fixed;
		width:900px;
		left:0%;
		top:-40%;
	    height:500px;
		overflow:scroll;
	}
	.un{
		 top:80px;
		 left:5px;
		 margin:0 auto;
		 width:150px;
	}
	.pass{
		
		top:140px;
		left:5px;
		margin:0 auto;
		width:150px;
	}
	.submit{
		top:210px;
		left:5px;
		margin:0 auto;
		width:150px;
		margin-bottom:300px;
	}
	.forgot{
	 	top:270px;
	 	left:5px;
	 	margin:0 auto;
	 	width:200px;
	
	
	}
	.sidebar{
		display:none;
	}
	  .menu-container{
		  margin:0 auto;
		  width:200px;
		  display: flex;
		  align-items: center;
		  justify-content: center;
		   transform: translate(-35%, -50%);
}
.button{
  position: relative;
  background: white;
  color:black;
  font-size: 20px;
  padding: 8px 20px;
  width:50px;
  line-height: 30px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  border-radius: 25px;
  cursor: pointer;
  transition: width .4s;
}
.fas.expand:before{
  content: '\f00d';
}
ul{
  left:50px;
  list-style: none;
  position: absolute;
  top: 65px;
  display: block;
  background: #1b1b1b;
  width: 100%;
  text-align: center;
  border-radius: 5px;
  display: none;
  box-shadow: 0 3px 6px rgba(0,0,0,0.3);
}
	ul:before{
	  position: absolute;
	  content: '';
	  width: 20px;
	  height: 20px;
	  background: #1b1b1b;
	  top: -10px;
	  right: 130px;
	  transform: rotate(45deg);
	  z-index: -1;
	}
	ul li{
	  line-height: 35px;
	  padding: 8px 20px;
	  cursor: pointer;
	  border: 1px solid transparent;
	  border-bottom: 1px solid rgba(255,255,255,.1);
	}
	ul li:last-child{
	  border-bottom: none;
	}
	ul li:hover{
	  box-shadow: inset 0 0 5px #33ffff,
	              inset 0 0 10px #66ffff;
	}
	ul li:hover:first-child{
	  border-radius: 5px 5px 0 0;
	}
	ul li:hover:last-child{
	  border-radius: 0 0 5px 5px;
	}
	ul li a{
	  color: white;
	  font-size: 18px;
	  text-decoration: none;
	}
	ul li:hover a{
	  color: cyan;
	}
	        
}

     </style>
   </head>
<body>

<script type="text/javascript">
function move(){
	 location.replace("main.jsp");
}
</script>
		<%String name="",value="",cookie=request.getHeader("");
	
	%>
		<%String id = (String)session.getAttribute("userID");
		
		%>
  <section class="home-section">
      <div class="page-container">
        <div class="login-form-container shadow">
            <div class="login-form-right-side">
                <div class="top-logo-wrap">
                    
                </div>
                <h1>K-MMSE Program</h1>
                <p>환자정보입력(Input Information), 환자데이터차트(Data Chart), 환자데이터테이블(Patient Data Table)</p>
              	  <div class="login-input-container">
                
                <h1 style=" margin-top:100px;color: #dedede;width:280px;font-size:40px;text-align:center;opacity: 0.9;">Current Time</h1>
                </div>
                <div style="border:0px solid #dedede; width:400px; height:220px; line-height:250px; color:#666;font-size:50px; text-align:center;" id="clock">
				</div>
            </div>
            <div class="login-form-left-side">
         		<div class="main">
			<p class="sign" align="center">Login</p>
			<form method="post" action="login_Action.jsp" class="form1"> 	
				 <div> 
				 	<input type="text"  placeholder="이메일"  name="userID" class="un" style="align:center" maxlength="20"> 
				 </div> 
				 <div> 
					 <input type="password"  placeholder="비밀번호"style="align:center" name="userPassword" class="pass">
				 </div>
				  &emsp;
				  &emsp;
				 <div>
				 	 <input type="submit" class="submit"  style="text-align:center"value="로그인" onClick="noBack()"> 
				 	 <div class="set"><p class="forgot" align="center"><a href='window.location.href="pwchange.jsp"' style="color:grey; font-weight:bold;">비밀번호 변경</a> or <a href="join.jsp" style="color:grey; font-weight:bold;">회원가입</a></p></div>
				 </div>
			</form> 

	 <div class="menu-container">
        			 <div class="button">
           			 <span class="fas fa-bars"></span>
        		     </div>
				         <ul>
				            <li><a href="info.jsp">Input</a></li>
				            <li><a href="kchart.jsp">Data Chart</a></li>
				            <li><a href="kchart.jsp">Patient Table</a></li>
				            <li><a href="logout.jsp">Logout</a></li>
				         </ul>
  			    </div>
 	   </div>    
            </div>
        </div>
    </div>
     
  </section>
  
  
  <div class="sidebar">
    <div class="logo-details">
       <div class="logo_name">Service Menu</div>
        <i class='bx bx-menu' id="btn" ></i>
    </div>
    <ul class="nav-list">

      <li>
       	 <a href="info.jsp">
         <i class='bx bx-user' ></i>
         <span class="links_name">Input Information</span>
       </a>
       <span class="tooltip">Input Information</span>
     </li>
   
     <li>
       <a href="kchart.jsp?id=<%=id%>">
         <i class='bx bx-pie-chart-alt-2' ></i>
         <span class="links_name">Data Chart</span>
       </a>
       <span class="tooltip">Data chart</span>
     </li>
     <li>
       <a href="patientsearch.jsp">
         <i class='bx bx-folder' ></i>
         <span class="links_name">Patient Data Table</span>
       </a>
       <span class="tooltip">Patient Data Table</span>
     </li>
     <li>
       <a href="#">
         <i class='bx bx-cog' ></i>
         <span class="links_name">Setting</span>
       </a>
       <span class="tooltip">Setting</span>
     </li>
    
    </ul>
  </div>
   
     

  <script  type="text/javascript">
  let sidebar = document.querySelector(".sidebar");
  let closeBtn = document.querySelector("#btn");
  let searchBtn = document.querySelector(".bx-search");

  closeBtn.addEventListener("click", ()=>{
    sidebar.classList.toggle("open");
    menuBtnChange();//calling the function(optional)
  });

  searchBtn.addEventListener("click", ()=>{ // Sidebar open when you click on the search iocn
    sidebar.classList.toggle("open");
    menuBtnChange(); //calling the function(optional)
  });

  // following are the code to change sidebar button(optional)
  function menuBtnChange() {
   if(sidebar.classList.contains("open")){
     closeBtn.classList.replace("bx-menu", "bx-menu-alt-right");//replacing the iocns class
   }else {
     closeBtn.classList.replace("bx-menu-alt-right","bx-menu");//replacing the iocns class
   }
  }
</script>
<script>

function printClock() {
    
    var clock = document.getElementById("clock");            // 출력할 장소 선택
    var currentDate = new Date();                                     // 현재시간
    var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth()+1) + "-" + currentDate.getDate() // 현재 날짜
    var amPm = 'AM'; // 초기값 AM
    var currentHours = addZeros(currentDate.getHours(),2); 
    var currentMinute = addZeros(currentDate.getMinutes() ,2);
    var currentSeconds =  addZeros(currentDate.getSeconds(),2);
    
    if(currentHours >= 12){ // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
    	amPm = 'PM';
    	currentHours = addZeros(currentHours - 12,2);
    }

    if(currentSeconds >= 50){// 50초 이상일 때 색을 변환해 준다.
       currentSeconds = '<span style="color:#de1951;">'+currentSeconds+'</span>'
    }
    clock.innerHTML = currentHours+":"+currentMinute+":"+currentSeconds +" <span style='font-size:50px;'>"+ amPm+"</span>"; //날짜를 출력해 줌
    
    setTimeout("printClock()",1000);         // 1초마다 printClock() 함수 호출
}

function addZeros(num, digit) { // 자릿수 맞춰주기
	  var zero = '';
	  num = num.toString();
	  if (num.length < digit) {
	    for (i = 0; i < digit - num.length; i++) {
	      zero += '0';
	    }
	  }
	  return zero + num;
}

</script>
<script>
window.history.forward();
function noBack() {window.history.forward();}
</script>
 <script>
         $(document).ready(function(){
           $('.button').click(function(){
             if($(this).hasClass('expand')){
               $('ul').slideUp(function(){
                 $('.button').removeClass('expand');
                 $('.fas').removeClass('expand')
               });
             }else{
               $(this).addClass('expand');
               setTimeout(function(){
                 $('.fas').addClass('expand');
                 $('ul').stop().slideDown();
               },200);
             }
           });
         });
      </script>
 
</body>
</html>
