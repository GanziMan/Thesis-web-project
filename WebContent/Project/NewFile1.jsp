<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter"%>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'></link>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn3.devexpress.com/jslib/21.1.5/css/dx.common.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn3.devexpress.com/jslib/21.1.5/css/dx.light.css" />
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'></link>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    <script src="https://cdn3.devexpress.com/jslib/21.1.5/js/dx.all.js"></script>
    <script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<script src="https://code.highcharts.com/modules/variable-pie.js"></script>

   <style>
   
   .anythinglisting1 {
            padding: 15px 30px;
            position:relative;
            left:10%;
        }

        .anythinglisting1 ul {
            list-style: none;
            margin: 0;
            padding: 0;
        }

        .anythinglisting1 ul li {
            position: relative;
            font-size: 16px;
            padding: 5px 0 5px 20px;
        }

        .anythinglisting1 ul li::before {
            position: absolute;
            width: 9px;
            height: 9px;
            background: #0bf;
            left: 0;
            top: 8px;
            content: '';
            border-radius: 50%;
        }
 

#hor-minimalist-a
{
   font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
   font-size: 12px;
   background: #fff;
   margin: 45px;
   width: 480px;
   border-collapse: collapse;
   text-align: left;
   position:fixed; top:60%; left:43%; width:50%; height:25%;
}
#hor-minimalist-a th
{
   font-size: 14px;
   font-weight: normal;
   color: #039;
   padding: 10px 8px;
   border-bottom: 2px solid #6678b1;
}
#hor-minimalist-a td
{
   color: #669;
   padding: 9px 8px 0px 8px;
}
#hor-minimalist-a tbody tr:hover td
{
   color: #009;
}

hr {
  position:relative;
  top:40px;
  width:60%;   
  border-top: 1px solid #ccc;
  height: 1em;
  text-align: center;
  overflow: visible;
  height: 1px;
  background-image: -webkit-gradient(linear, left top, right top, from(transparent), color-stop(#ccc), to(transparent));
  background-image: linear-gradient(to right, transparent, #ccc, transparent);
}
h2{
   position:relative;
   top:20px;
   left:140px;
   font-variation-settings: 'opsz' 36; 
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
  background: black;
}
.sidebar.open input{
  padding: 0 20px 0 50px;
  width: 100%;
}


.sidebar li a{
  display: flex;
  height: 100%;
  width: 100%;
  border-radius: 12px;
  align-items: center;
  text-decoration: none;
  transition: all 0.4s ease;
  background:  #393d41;
}
.sidebar li a:hover{
  background: black;
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
  background: none;
}
.home-section{
  position: relative;
  background: #E4E9F7;
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
.home-section .text{
  display: inline-block;
  color: #11101d;
  font-size: 25px;
  font-weight: 500;
  margin: 18px
}

#container {
   position:relative;
    height: 350px;
    width:850px;
    left:35%; 
    top:90px;
   
}

.highcharts-figure, .highcharts-data-table table {
    min-width: 310px; 
    max-width: 800px;
    margin: 1em auto;
}

.highcharts-data-table table {
    font-family: Verdana, sans-serif;
    border-collapse: collapse;
    border: 1px solid #EBEBEB;
    margin: 10px auto;
    text-align: center;
    width: 100%;
    max-width: 500px;
}
.highcharts-data-table caption {
    padding: 1em 0;
    font-size: 1.2em;
    color: #555;
}
.highcharts-data-table th {
   font-weight: 600;
    padding: 0.5em;
}
.highcharts-data-table td, .highcharts-data-table th, .highcharts-data-table caption {
    padding: 0.5em;
}
.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even) {
    background: #f8f8f8;
}
.highcharts-data-table tr:hover {
    background: #f1f7ff;
}
#container1 {
   position:relative;
    height: 200px;
    width:500px;
    left:-40%;
    top:-250px;
    
}

.highcharts1-figure, .highcharts1-data-table table {
    min-width: 310px; 
    max-width: 800px;
    margin: 1em auto;
}

.highcharts1-data-table table {
    font-family: Verdana, sans-serif;
    border-collapse: collapse;
    border: 1px solid #EBEBEB;


}
.highcharts1-data-table caption {
    padding: 1em 0;
    font-size: 1.2em;
    color: #555;
}
.highcharts1-data-table th {
   font-weight: 600;
    padding: 0.5em;
}
.highcharts1-data-table td, .highcharts1-data-table th, .highcharts1-data-table caption {
    padding: 0.5em;
}
.highcharts1-data-table thead tr, .highcharts1-data-table tr:nth-child(even) {
    background: #f8f8f8;
}
.highcharts1-data-table tr:hover {
    background: #f1f7ff;
} 
   
 @media screen and (max-width: 995px) {
      @import url('https://fonts.googleapis.com/css?family=Open+Sans:400i,600,700,800&display=swap');
      body{
      	text-align:center;
      	
      }
   hr{
      display:none;
   }
   h2{
      display:none;
   }
 
   .sidebar{
      display:none;
   }
  
   #hor-minimalist-a{
    display:none;
   }
   
   #container{
 	left:5%;
 	top:50%;
   	width:90%;
   	height:20%;
   }
   #container1{
   		widtH:84%;
   		height:30%;
   		left:8%;
   		top:50%;
   }
   .anythinglisting1{
   display:none;
   }
   .menu-container{
      position:relative;
        top: 5%;
        left: 5%;
        transform: translate(-50%, -50%);
        width:200px;
        display: flex;
        align-items: center;
        justify-content: center;
      
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
}
   </style>
      
  </head>
  <body>

<h2>Data Chart</h2>
<hr ></hr>

    
   
    <%! String cognitive,sex,hand,sex1,hand1,grd,grd1,pati,patipa; int ncognitive=0,abncognitive=0,man=0,woman=0,man1=0,woman1=0,lhand1=0,rhand1=0,lhand=0,rhand=0,dhand=0,dhand1=0,grade0=0,grade1=0,grade2=0,grade3=0,grade4=0,grade00=0,grade11=0,grade22=0,grade33=0,grade44=0,patii,patii1,patipai,patipai1; %>
      <% String userID=(String)session.getAttribute("userID"); %>
   <%

      Connection conn=null;
      String url="jdbc:mysql://localhost:3307/jspPj";
      String id="root";
      String pw="0955";
      Class.forName("com.mysql.cj.jdbc.Driver");
      DriverManager.getConnection(url,id,pw);
      
      ResultSet rs=null;
      ResultSet rs1=null;
      ResultSet rs2=null;
      ResultSet rs3=null;
      ResultSet rs4=null;
      ResultSet rs5=null;
      ResultSet rs6=null;
      
     
      Statement stmt=null;
      Statement stmt1=null;
      Statement stmt2=null;
      Statement stmt3=null;
      Statement stmt4=null;
      Statement stmt5=null;
      Statement stmt6=null;
      
      ResultSetMetaData rsmd=null;
      ResultSetMetaData rsmd1=null;
      ResultSetMetaData rsmd2=null;
      ResultSetMetaData rsmd3=null;
      ResultSetMetaData rsmd4=null;
      ResultSetMetaData rsmd5=null;
      ResultSetMetaData rsmd6=null;
      
      int columnCount=0;
      int columnCount1=0;
      int columnCount2=0;
      int columnCount3=0;
      int columnCount4=0;
      int columnCount5=0;
      int columnCount6=0;
      String sql="select * from kmmse1 where useremail='"+userID+"'";
      String sql1="select * from kmmse1 where useremail='"+userID+"' and 기억력판단 = '정상 인지'";
      String sql2="select * from kmmse1 where useremail='"+userID+"' and 기억력판단 = '정상 인지'";
      String sql3="select * from kmmse1 where useremail='"+userID+"' and 기억력판단 = '인지 저하'";
      String sql4="select * from kmmse1 where useremail='"+userID+"' and 기억력판단 = '인지 저하'";
      String sql5="select * from kmmse1 where useremail='"+userID+"' and 기억력판단 = '정상 인지'";
      String sql6="select * from kmmse1 where useremail='"+userID+"' and 기억력판단 = '인지 저하'";
   %>
   
   
   
   <%
   try{
      conn=DriverManager.getConnection(url,id,pw);
      stmt=conn.createStatement();
      rs=stmt.executeQuery(sql);
      rsmd=rs.getMetaData();
      columnCount=rsmd.getColumnCount();
   
      stmt1=conn.createStatement();
      rs1=stmt1.executeQuery(sql1);
      rsmd1=rs1.getMetaData();
      columnCount1=rsmd1.getColumnCount();
   
      stmt2=conn.createStatement();
      rs2=stmt2.executeQuery(sql2);
      rsmd2=rs2.getMetaData();
      columnCount2=rsmd2.getColumnCount();
      
      stmt3=conn.createStatement();
      rs3=stmt3.executeQuery(sql3);
      rsmd3=rs3.getMetaData();
      columnCount3=rsmd3.getColumnCount();
      
      stmt4=conn.createStatement();
      rs4=stmt4.executeQuery(sql4);
      rsmd4=rs4.getMetaData();
      columnCount4=rsmd4.getColumnCount();
      
      stmt5=conn.createStatement();
      rs5=stmt5.executeQuery(sql5);
      rsmd5=rs5.getMetaData();
      columnCount5=rsmd5.getColumnCount();
      
      stmt6=conn.createStatement();
      rs6=stmt6.executeQuery(sql6);
      rsmd6=rs6.getMetaData();
      columnCount6=rsmd6.getColumnCount();
   
      while(rs.next()){
            cognitive=rs.getString("기억력판단");
         if("인지 저하".equals(cognitive))
            abncognitive++;
         else if("정상 인지".equals(cognitive))
            ncognitive++;
      }
   
      while(rs1.next()){
         sex=rs1.getString("성별");
      if("여자".equals(sex))
         woman++;
      else if("남자".equals(sex))
         man++;
      }
      
      
 //  while(rs1.next()){
     //     pati=rs1.getString("환자가 인지저하를 호소");
      // if("yes".equals(pati))
       //   patii++;
       //else if("no".equals(pati))
        //  patii1++;
    //   }
// while(rs1.next()){
  //        patipa=rs1.getString("부모가 환자의 인지저하를 호소");
    //   if("yes".equals(patipa))
      //    patipai++;
       //else if("no".equals(patipa))
        //  patipai1++;
      // }
   
     
      while(rs3.next()){
         sex1=rs3.getString("성별");
      if("여자".equals(sex1))
         woman1++;
      else if("남자".equals(sex1)){
         man1++;
      }
      }
      while(rs2.next()){
          hand=rs2.getString("손");
       if("왼손".equals(hand))
          lhand++;
       else if("오른손".equals(hand))
          rhand++;
       else if("양손".equals(hand))
          dhand++;
       }
      while(rs4.next()){
         hand1=rs4.getString("손");
      if("왼손".equals(hand1))
         lhand1++;
      else if("오른손".equals(hand1))
         rhand1++;
      else if("양손".equals(hand1))
         dhand1++;
      }

      while(rs5.next()){
          grd=rs5.getString("학력");
       if(Integer.parseInt(grd)==0)
          grade0++;
       else if("0.5".equals(grd))
          grade1++;
       else if(1<=Integer.parseInt(grd) && 3>=Integer.parseInt(grd))
          grade2++;
       else if(4<=Integer.parseInt(grd) && 6>=Integer.parseInt(grd))
          grade3++;
       else if(7<=Integer.parseInt(grd))
          grade4++;
       }
      
      while(rs6.next()){
          grd1=rs6.getString("학력");
          if(Integer.parseInt(grd1)==0)
             grade00++;
          else if("0.5".equals(grd1))
          grade11++;
       else if(1<=Integer.parseInt(grd1) && 3>=Integer.parseInt(grd1))
          grade22++;
       else if(4<=Integer.parseInt(grd1) && 6>=Integer.parseInt(grd1))
          grade33++;
       else if(7<=Integer.parseInt(grd1))
          grade44++;
       }
      conn.close();
      }catch(Exception e){
         out.println("오류");
           
      }
   
   

   %>
   <table id="hor-minimalist-a" summary="Employee Pay Sheet" >
    <thead>
       <tr>
          <th scope="col">인지기능</th>
           <th scope="col">남자</th>
            <th scope="col">여자</th>
            <th scope="col">왼손</th>
            <th scope="col">오른손</th>
            <th scope="col">양손</th>
            <th scope="col">학력:0</th>
            <th scope="col">학력:0.5</th>
            <th scope="col">학력:1~3</th>
            <th scope="col">학력:4~6</th>
            <th scope="col">학력:7이상</th>
      
        </tr>
    </thead>
    <tbody>
       <tr>
           <td>정상인지</td>
           <td><%=man%></td>
            <td><%=woman%></td>
            <td><%=lhand%></td>
            <td><%=rhand%></td>
            <td><%=dhand%></td>
            <td><%=grade0%></td>
            <td><%=grade1%></td>
            <td><%=grade2%></td>
            <td><%=grade3%></td>
            <td><%=grade4%></td>
   
        </tr>
        <tr>
           <td>인지저하</td>
           <td><%=man1%></td>
            <td><%=woman1%></td>
            <td><%=lhand1%></td>
            <td><%=rhand1%></td>
            <td><%=dhand1%></td>
            <td><%=grade00%></td>
            <td><%=grade11%></td>
            <td><%=grade22%></td>
            <td><%=grade33%></td>
            <td><%=grade44%></td>
    
        </tr>
        <tr>
           <td>합</td>
            <td><%=man+man1%></td>
            <td><%=woman+woman1%></td>
            <td><%=lhand+lhand1%></td>
            <td><%=rhand+rhand1%></td>
            <td><%=dhand+dhand1%></td>
            <td><%=grade0+grade00%></td>
            <td><%=grade1+grade11%></td>
            <td><%=grade2+grade22%></td>
            <td><%=grade3+grade33%></td>
            <td><%=grade4+grade44%></td>
     
        </tr>
     
    </tbody>
</table>

   
  
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
           <a href="info.jsp">
         <i class='bx bx-user' ></i>
         <span class="links_name">Input Information</span>
       </a>
       <span class="tooltip">Input Information</span>
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
             <div class="job"><label style="margin-left:30px;"><%=userID%></label></div>
         </div>
        
     </li>
    </ul>
  </div>
   
    <!-- <figure class="highcharts-figure">
    <div id="container"></div>
   </figure>--> 
   
   <figure class="highcharts-figure">
       <div id="container"></div>
   </figure>
   
   <figure class="highcharts1-figure">
    <div id="container1"></div>
</figure>
   
 <div class="anythinglisting1">
        <ul>
            <li>Pie Chart</li>
            <li>Bar Chart</li>
            <li>Data Table</li>

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
   <script>

// Age categories
var categories = [ '남자', '여자', '오른손', '왼손',
    '양손', '학력:0년', '학력:0.5년', '학력:1~3년', '학력:4~6년',
    '학력:7년이상'
];

Highcharts.chart('container', {
    chart: {
        type: 'bar'
    },
    title: {
        text: '정상인지 vs 인지저하 details',
      
    },
    subtitle: {
        text: ''
    },
    accessibility: {
        point: {
            valueDescriptionFormat: '{index}. Age {xDescription}, {value}%.'
        }
    },
    xAxis: [{
        categories: categories,
        reversed: false,
        labels: {
            step: 1
        },
        accessibility: {
            description: 'Age (male)'
        }
    }, { // mirror axis on right side
        opposite: true,
        reversed: false,
        categories: categories,
        linkedTo: 0,
        labels: {
            step: 1
        },
        accessibility: {
            description: 'Age (female)'
        }
    }],
    yAxis: {
        title: {
            text: null
        },
        labels: {
            formatter: function () {
                return Math.abs(this.value) ;
            }
        },
        accessibility: {
            description: 'Percentage population',
            rangeDescription: 'Range: 0 to 5%'
        }
    },

    plotOptions: {
        series: {
            stacking: 'normal'
        }
    },

    tooltip: {
        formatter: function () {
            return '<b>' + this.series.name + ', age ' + this.point.category + '</b><br/>' +
                'Population: ' + Highcharts.numberFormat(Math.abs(this.point.y), 1);
        }
    },

    series: [{
        name: '정상인지',
        data: [
            -10,-10,-<%=rhand%>, -<%=lhand%>,
             -<%=dhand%>, -10, -<%=grade1%>, -10,
             -<%=grade3%>,-<%=grade4%>
        ]
    }, {
        name: '인지저하',
        data: [
            10,10,<%=rhand1%>, <%=lhand1%>,
             10, <%=grade00%>, 10, <%=grade22%>,
             <%=grade33%>,<%=grade44%>
        ]
    }]
});

   </script>
  <script>
   Highcharts.chart('container1', {
       chart: {
           type: 'variablepie'
       },
       title: {
           text: '정상인지 vs 인지저하 ratio'
       },
       tooltip: {
           headerFormat: '',
           pointFormat: '<span style="color:{point.color}">\u25CF</span> <b> {point.name}</b><br/>' +
               'Area (square km): <b>{point.y}</b><br/>'
       },
       series: [{
           minPointSize: 10,
           innerSize: '100%',
           zMin: 0,
           name: '정상인지vs인지저하',
           data: [{
               name: '정상인지',
               y: 10,
           
           }, {
               name: '인지저하',
               y: 10,
           }]
       }]
   });

   </script>
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
 <%ncognitive=0; abncognitive=0; man=0; woman=0; man1=0; woman1=0; lhand=0; rhand=0; lhand1=0; rhand1=0; dhand=0;dhand1=0; grade0=0; grade00=0; grade1=0; grade11=0; grade2=0; grade22=0; grade3=0; grade33=0; grade4=0; grade44=0; %>
  </body>
</html>