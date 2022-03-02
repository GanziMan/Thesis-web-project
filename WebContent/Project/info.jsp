<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
 <%@ page import="java.io.PrintWriter" %>
<%String usr=(String)session.getAttribute("userID");%>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'></link>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
   <style>
   @import "https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css";    
   @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
     
   *{ 
     margin: 0;
     padding: 0;
     box-sizing: border-box;
     font-family: "Poppins" , sans-serif;
   }
   .menu-container{
   display:none;
   }
   body{
      height:100%;
   }
   hr {
  border-top: 1px solid #ccc;
  height: 1em;
  text-align: center;
  overflow: visible;
}

hr {
  height: 1px;
  background-image: -webkit-gradient(linear, left top, right top, from(transparent), color-stop(#ccc), to(transparent));
  background-image: linear-gradient(to right, transparent, #ccc, transparent);
}
.sidebar{
  position: fixed;
  left: 0;
  top: 0; 
  height: 100%;
  width: 78px;
  background: black;
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
  background:  #393d41;
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
  background: #393d41;
  color: #FFF;
}

.sidebar li a{
  display: flex;
  height: 100%;
  width: 100%;
  border-radius: 12px;
  align-items: center;
  text-decoration: none;
  transition: all 0.4s ease;
  background: #393d41;
}
.sidebar li a:hover{
  background:black;
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
#submit{
	width;
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
  background:black;
  width: 100%;
  height: 60px;
  line-height: 60px;
  border-radius: 0px;
  transition: all 0.5s ease;
}
.sidebar.open .profile #log_out{
  width: 50px;
  background:black;
}
.home-section{
  position: relative;
  background: black;
  min-height: 100vh;
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

              
   .select {
       padding: 15px 10px;
   }
   .select input[type=radio]{
       display: none; 
   }
   .select input[type=radio]+label{
       display: inline-block;
       cursor: pointer;
       height: 24px;
       width: 120px;
       border: 1px solid #4272d7;
       line-height: 24px;
       text-align: center;
       font-weight:bold;
       font-size:13px;
   }
   .select input[type=radio]+label{
       background-color: #fff;
       color: #333;
   }
   .select input[type=radio]:checked+label{
       background-color: #333;
       color: #fff;
   }
   
    body {
        
        font-family:Arial, Helvetica, sans-serif;
    }
    
    .main {
        
            position: fixed; 
            left:25%; top:7%; 
          
        width: x%;
        height: 100%;
        opacity:0.7;
        border-radius: 1.0em;
        box-shadow: 0px 11px 35px 2px rgba(0, 0, 0, 0.14);

        background-color:white;
    }
    
    .sign {
        padding-top: 40px;
        color:black;
        font-family: 'Ubuntu', sans-serif;
        font-weight: bold;
        font-size: 23px;
    }
    
    input {
  outline: none;
  margin: 0;
  border: none;
  -webkit-box-shadow: none;
  -moz-box-shadow: none;
  box-shadow: none;
  width: 30%;
  font-size: 14px;
  font-family: inherit;
  border:1px solid #4272d7;
}
    .input--style-4 {
  line-height: 50px;
  background: #fafafa;
  -webkit-box-shadow: inset 0px 1px 3px 0px rgba(0, 0, 0, 0.08);
  -moz-box-shadow: inset 0px 1px 3px 0px rgba(0, 0, 0, 0.08);
  box-shadow: inset 0px 1px 3px 0px rgba(0, 0, 0, 0.08);
  -webkit-border-radius: 5px;
  -moz-border-radius: 5px;
  border-radius: 5px;
  padding: 0 20px;
  font-size: 16px;
  color: #666;
  -webkit-transition: all 0.4s ease;
  -o-transition: all 0.4s ease;
  -moz-transition: all 0.4s ease;
  transition: all 0.4s ease;
}

.input--style-4::-webkit-input-placeholder {
  /* WebKit, Blink, Edge */
  color: #666;
}

.input--style-4:-moz-placeholder {
  /* Mozilla Firefox 4 to 18 */
  color: #666;
  opacity: 1;
}

.input--style-4::-moz-placeholder {
  /* Mozilla Firefox 19+ */
  color: #666;
  opacity: 1;
}

.input--style-4:-ms-input-placeholder {
  /* Internet Explorer 10-11 */
  color: #666;
}

.input--style-4:-ms-input-placeholder {
  /* Microsoft Edge */
  color: #666;
}
    
    form.form1 {
        padding-top: 40px;
    }
  
    .un:focus, .pass:focus {
        border: 2px solid rgba(0, 0, 0, 0.18) !important;
        
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




  @media screen and (max-width: 800px), 
       screen and (max-height: 700px)  {
        .main {
            border-radius: 0px;
        }
    .page-wrapper {
      min-height: 100vh;
   }
   .btn {
     display: inline-block;
     line-height: 50px;
     -webkit-transition: all 0.4s ease;
     -o-transition: all 0.4s ease;
     -moz-transition: all 0.4s ease;
     transition: all 0.4s ease;
     cursor: pointer;
     font-size: 18px;
     color: white;
     font-family: "Poppins", "Arial", "Helvetica Neue", sans-serif;
   }
   
   .btn--radius {
     -webkit-border-radius: 3px;
     -moz-border-radius: 3px;
     border-radius: 3px;
   }
   
   .btn--radius-2 {
     -webkit-border-radius: 5px;
     -moz-border-radius: 5px;
     border-radius: 5px;
   }
   
   .btn--pill {
     -webkit-border-radius: 20px;
     -moz-border-radius: 20px;
     border-radius: 20px;
   }
   
   .btn--green {
     background: #57b846;
   }
   
   .btn--green:hover {
     background: #4dae3c;
   }
   
   .btn--blue {
     background: #4272d7;
   }
   
   .btn--blue:hover {
     background: #3868cd;
   }
   

      @import url('https://fonts.googleapis.com/css?family=Open+Sans:400i,600,700,800&display=swap');
   hr{
   display:none;
   }
   h2{
   display:none;
   }
   .main{
   
   position:relative;
   top:1%;
   left:-0%;
   height:60%;
   width:100%;
   
   }
   .sidebar{
      display:none;
   }
     .menu-container{
        position: fixed;
        top: 5%;
        left: 5%;
        transform: translate(-50%, -50%);
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
  content: 'center';
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
.select {
       padding: 15px 10px;
   }
   .select input[type=radio]{
       display: none; 
   }
   .select input[type=radio]+label{
       display: inline-block;
       cursor: pointer;
       height: 24px;
       width: 80px;
       border: 1px solid #4272d7;
       line-height: 24px;
       text-align: center;
       font-weight:bold;
       font-size:10px;
   }
   .select input[type=radio]+label{
       background-color: #fff;
       color: #333;
   }
   .select input[type=radio]:checked+label{
       background-color: #333;
       color: #fff;
   }
   .pf{
      font-size:10px;
   }
   .input--style-4{
   width:200px;
   }
        }
        
 
     </style> 
     
     
   
</head>

<body>
<%request.setCharacterEncoding("UTF-8"); %>
<% String e=usr; %>
<h2 style="font-variation-settings: 'opsz' 36; position:fixed; left:10%;top:2%">Input Information</h2>
<hr style="position:fixed; top:6%; width:70%;"></hr>

    <div class="main"> 
           <div class="menu-container">
                  <div class="button">
                     <span class="fas fa-bars"></span>
                   </div>
                     <ul>
                        <li><a href="kchart.jsp">Data Chart</a></li>
                        <li><a href="patientsearch.jsp">Patient Table</a></li>
                        <li><a href="logout.jsp">Logout</a></li>
                     </ul>
               </div>
      <p class="sign" align="center">K-MMSE 환자정보입력</p>
      <form action="infock.jsp" method="post" class="form1">
         <div align="center"> <input type=text  id=num name=number size=20 placeholder="환자번호를 입력해주세요"  class="input--style-4"></div><br>
         <div align="center"><input type="number"  name=age id=age size=20 placeholder="나이를 입력해주세요"  class="input--style-4" min="45" max="90"></div><br>
         <div align="center"><input type="number"  id=점수 name=score size=20 placeholder="k-mmse점수입력"  class="input--style-4" max="30" ></div><br>
         
      <div class="select"align="center">
         <input type="radio" id="select"  name="sex" value="man"><label for="select">남성</label>
          <input type="radio" id="select2" name="sex" value="woman"><label for="select2">여성</label>
          <input type="radio" id="select11" name="sex" value="notsex"><label for="select11">null</label>
      </div><br>
      
      <div class="select"align="center">
         <input type="number" id="textbox" name="grade" placeholder="ex)5" style="width:10%; border-radius: 0.6em;">년
         <input type="radio" id="select5" name="grade"><label for="select5" onClick="this.form.textbox.disabled=false">교육을 받은경우</label>
         &nbsp;
         <input type="radio" id="select4" name="grade" value="b" ><label for="select4" onClick="this.form.textbox.disabled=true"  >무학 문해</label>
         <input type="radio" id="select3" name="grade" value="a"><label for="select3" onClick="this.form.textbox.disabled=true">무학 비문해</label>
         
         
        <!--  <input type="text" pattern="[0-9]+" id="select5"  name="grade" class="un" placeholder="교육1년 이상이면 입력해주세요" style="padding: 1px; width: 300px;"><label for="select5"></label>    -->         
      </div>   <br>
   
         
      <div  class="select" align="center">
         <strong class="pf">handedness</strong>:
         <input type="radio" id="select7" name="hand" value="오른손"> <label for="select7">오른손</label>
         <input type="radio" id="select6" name="hand" value="왼손">   <label for="select6">왼손</label>                 
          <input type="radio" id="select8" name="hand" value="양손잡이"><label for="select8">양손잡이</label>
      </div><br>
         
              
         <div class="select" align="center">   
            <strong class="pf">환자가 인지저하 호소 합니까?</strong>:
            <input type="radio" id="select9" name="remember" value="yes"><label for="select9">YES</label>
             <input type="radio"id="select10"  name="remember" value="no"><label for="select10">NO</label>
         </div>   <br>
         <div class="select" align="center">   
            <strong class="pf">보호자는 환자의 인지저하를 호소합니까?</strong>:
            <input type="radio" id="select14" name="remember1" value="yes"><label for="select14">YES</label>
             <input type="radio"id="select15"  name="remember1" value="no"><label for="select15">NO</label>
         </div>   <br>                                  
         
      <input type="hidden" name="userID" value=<%=usr%>>
      <div align="center"><input type="submit" id="submit" class="btn--blue"  value="확인" style="width:10%; height:5%;background-color:#4272d7; top:93.5%; right:47%; 
  line-height: 30px;
  -webkit-transition: all 0.4s ease;
  -o-transition: all 0.4s ease;
  -moz-transition: all 0.4s ease;
  transition: all 0.4s ease;
  cursor: pointer;
  font-size: 18px;
  color: white;
   -webkit-border-radius: 3px;
  -moz-border-radius: 3px;
  border-radius: 3px;

  "></div>
       </form>

   </div>
   
   <!--여기서부터 사이드바 -->
    <div class="sidebar">
    <div class="logo-details">
       <div class="logo_name">Service Menu</div>
        <i class='bx bx-menu' id="btn" ></i>
    </div>
    <ul class="nav-list">

   <!--    <li>
        <a href="main.jsp">
          <i class='bx bx-grid-alt'></i>
          <span class="links_name">Main</span>
        </a>
         <span class="tooltip">Main</span>
      </li> -->
   
     <li>
       <a href="kchart.jsp">
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
       <a href="logout.jsp" style="color:white;">
         <i class='bx bx-log-out'></i>
         <span class="links_name">Logout</span>
       </a>
       <span class="tooltip">Logout</span>
     </li>
     <li class="profile">
         <div class="profile-details">
           <img src="https://t4.ftcdn.net/jpg/02/29/75/83/240_F_229758328_7x8jwCwjtBMmC6rgFzLFhZoEpLobB6L8.jpg" alt="profileImg">
             <div class="job"><label style="margin-left:36px;"><%=usr%></label></div>
         </div>
        
     </li>
    </ul>
  </div>
       <div class="menu-container">
         <div class="button">
            <span class="fas fa-bars"></span>
         </div>
         <ul>
            <li><a href="patientsearch.jsp">Patient Search</a></li>
            <li><a href="kchart.jsp">Data Chart</a></li>
            <li><a href="logout.jsp">Logout</a></li>
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
   <script  type="text/javascript">

         $(document).ready(function(){ 
            $("#submit").click(function(){
                  if($("#num").val().length==0){ alert("환자번호를 입력하세요."); $("#num").focus(); return false; }
                  if($("#age").val().length==0){ alert("나이를 입력하세요"); $("#age").focus(); return false; }
                  if($("#점수").val().length==0){ alert("k-mmse점수를 입력하세요"); $("#점수").focus(); return false; }
                  if($("input:radio[id='select3']").is(":checked") == false && $("input:radio[id='select4']").is(":checked") == false && $("#textbox").val().length==0 ){ alert("학력 입력해주세요!"); $("#select3").focus(); $("#select4").focus(); $("#select5").focus(); return false; }
                  if($("input:radio[id='select3']").is(":checked") == true  && $("#textbox").val().length!=0 ){ alert("학력이 중복이 됩니다."); $("#select3").focus(); $("#select4").focus(); $("#textbox").focus(); return false; }
                  if($("input:radio[id='select4']").is(":checked") == true  && $("#textbox").val().length!=0 ){ alert("학력이 중복이 됩니다."); $("#select3").focus(); $("#select4").focus(); $("#textbox").focus(); return false; }
               });      
         });
         $(document).ready(function(){

              $("input[name=number]").keyup(function(event){ 

               if (!(event.keyCode >=37 && event.keyCode<=40)) {

                var inputVal = $(this).val();

                $(this).val(inputVal.replace(/[^a-z0-9]/gi,''));

               }

              });

            });

         $(document).ready(function(){

              $("input[name=age]").keyup(function(event){ 

               if (!(event.keyCode >=37 && event.keyCode<=40)) {

                var inputVal = $(this).val();

                $(this).val(inputVal.replace(/[^0-9]/gi,''));

               }

              });

            });
         $(document).ready(function(){

              $("input[name=score]").keyup(function(event){ 

               if (!(event.keyCode >=37 && event.keyCode<=40)) {

                var inputVal = $(this).val();

                $(this).val(inputVal.replace(/[^0-9]/gi,''));

               }

              });

            });
      
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