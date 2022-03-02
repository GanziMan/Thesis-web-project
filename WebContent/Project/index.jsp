<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.sql.*" %>
        <%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<meta charset="UTF-8">

    <link rel="stylesheet" type="text/css" href="https://cdn3.devexpress.com/jslib/21.1.5/css/dx.common.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn3.devexpress.com/jslib/21.1.5/css/dx.light.css" />
	<link rel="stylesheet" type="text/css" href="styles.css" />
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'></link>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    <script src="https://cdn3.devexpress.com/jslib/21.1.5/js/dx.all.js"></script>
    <script src="data.js"></script>
    <script>window.jQuery || document.write(decodeURIComponent('%3Cscript src="js/jquery.min.js"%3E%3C/script%3E'))</script>
  

<title>Insert title here</title>
<style>
   @import "https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css";
     @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
      @import url("/data/201107/IJ13098534210144/style.css"); 
#gridContainer {
    height: 900px;
    position:fixed;
    left:20%;
   	width:80%;
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
  background: lightblue;
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
  background: lightblue;
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
  background: lightblue;
}
.sidebar li a:hover{
  background: lightblue;
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
  background: lightblue;
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
  background: lightblue;
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
.menu-container{
	display:none;
}


 @media (max-width: 480px) {
        @import url('https://fonts.googleapis.com/css?family=Open+Sans:400i,600,700,800&display=swap');
       #gridContainer{
       position:fixed;
 		left:-1%;
       	height:100%;
       	width:100%;
       }
       .sidebar{
       	display:none;
       }
       .menu-container{
		  position: absolute;
		  top: 4%;
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
.button.expand{
	
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
<body class="dx-viewport">
	  <%String usr = (String)session.getAttribute("userID");%>
	
  <div class="sidebar">
    <div class="logo-details">

        <div class="logo_name">Service Menu</div>
        <i class='bx bx-menu' id="btn" ></i>
    </div>
    <ul class="nav-list">
     
      <li>
        <a href="main.jsp">
          <i class='bx bx-grid-alt'></i>
          <span class="links_name">Main</span>
        </a>
         <span class="tooltip">Main</span>
      </li>
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
       <a href="#">
         <i class='bx bx-cog' ></i>
         <span class="links_name">Setting</span>
       </a>
       <span class="tooltip">Setting</span>
     </li>
     
     <li class="profile">
   
         <div class="profile-details">
           <img src="https://t4.ftcdn.net/jpg/02/29/75/83/240_F_229758328_7x8jwCwjtBMmC6rgFzLFhZoEpLobB6L8.jpg" alt="profileImg">
               <div class="job"><%=usr%></div>
         </div>
          <a href="logout.jsp"> 
         	<i class='bx bx-log-out' id="log_out" ></i>
          </a>
     </li>
    </ul>
  </div>
  <div class="demo-container" >        
        <div id="gridContainer" ></div>
        <div class="options"></div>
  </div>
    <!--  밑에서부터는  아니다. -->
       <div class="menu-container">
         <div class="button">

            <span class="fas fa-bars"></span>
         </div>
         <ul>
            <li><a href="info.jsp">Input</a></li>
            <li><a href="kchart.jsp">Data Chart</a></li>
            <li><a href="logout.jsp">Logout</a></li>
         </ul>
      </div>
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
  <%      
      
      String url="jdbc:mysql://localhost:3307/jspPj";
      String id="root";
      String pw="0955";
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection conn=DriverManager.getConnection(url,id,pw);
      String userID=request.getParameter("userID");
      String sql="SELECT * FROM kmmse1 ";
      PreparedStatement pstmt=conn.prepareStatement(sql);
      ResultSet rs=pstmt.executeQuery();
   %>

   	<script>
			$(document).ready(function() {

				$('table[name=example-table]').tableFilter({
				
					//input : "input[type=search]", Default element
				

					//timeout: 80,

					sort : true,

					//caseSensitive : false, Default

					callback : function() { /* Callback após o filtro */

					},
					
					notFoundElement : ".not-found"
				});

			
			});


		</script>
      

 
<script>
var orders = [
	<% while(rs.next()){%>
	{
    "ID": 1,
    "나이": <%=rs.getString("나이")%>,
    "성별": "<%=rs.getString("성별")%>",
    "K-MMSE점수": <%=rs.getString("점수")%>,
    "CustomerStoreCity": "<%=rs.getString("학력")%>", 
    "Handedless": "<%=rs.getString("손")%>",
    "인지장애호소": "<%=rs.getString("기억력판단")%>",
    "DeliveryDate": "<%=rs.getString("입력시간")%>"
	},
	 
      
      <%       
         }
      %>
];
</script>
<script>
$(function(){
    var dataGrid = $("#gridContainer").dxDataGrid({
        dataSource: orders,
        keyExpr: "ID",
        columnsAutoWidth: true,
        showBorders: true,
        filterRow: {
            visible: true,
            applyFilter: "auto"
        },
        searchPanel: {
            visible: true,
            width: 120,
            placeholder: "Search..."
        },
        headerFilter: {
            visible: true
        },
        columns: [{
            dataField: "나이",
            alignment: "center",
            width: 140,
            headerFilter: {
                groupInterval: 10000
            }
        },   {
            dataField: "K-MMSE점수",
            alignment: "center",
            width:130
        },
        {
        dataField:"성별",
        alignment:"center",
        width:130
        },
        {
        caption: "학력",
        dataField: "CustomerStoreCity",
        alignment:"center",
        headerFilter: {
        allowSearch: true
        },
        width:150
        },
        {
        dataField:"Handedless",
        alignment:"center",
        width:130
        },
        {
        dataField:"인지장애호소",
        alignment:"center",
        width:150
        },
        {
        dataField: "DeliveryDate",
        alignment: "center",
        width: 100
            }]
    }).dxDataGrid('instance');
    
 
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
</body>
</html>