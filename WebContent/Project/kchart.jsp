<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
 <%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter" %>
 <%@ page import="java.net.URLDecoder" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
   <meta charset="UTF-8">
   <link rel="stylesheet" href="style.css"></link>
   <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'></link>
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
   @import url("/data/201107/IJ13098534210144/style.css"); 
  @import "https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css";
  @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
  
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
@media (max-width: 420px) {
  .sidebar li .tooltip{
    display: none;
  }
}
 		
  #colchartdiv {
  width: 40%;
  height:50%;
  position:fixed;
  top:0%;
  left:7%;

}
#colchartdiv2 {
  width: 40%;
  height:50%;
  position:fixed;
  top:49%;
  left:7%;

}

  #piechartdiv {
  width: 35%;
  height:45%;;
  position:fixed;
  top:5%;
  left:55%;
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
	
@media (max-width: 420px) {
  .sidebar li .tooltip{
    display: none;
  }
}
   
  </style>
	<script src="https://cdn.amcharts.com/lib/4/core.js"></script>
	<script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
	<script src="https://cdn.amcharts.com/lib/4/themes/dark.js"></script>
	<script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 


  </head>
  <body>
  		
  	  <%String userID = (String)session.getAttribute("userID");%>
		<% 	
		 if(userID==null){
			 PrintWriter script = response.getWriter(); 
	 	 	 script.println("<script>"); 
	  		 script.println("alert('로그인상태가 아닙니다 로그인해주세요!')"); 
	 		 script.println("location.href = 'login.jsp'"); 
	  		 script.println("</script>"); 
		 }
		%>
  	
	<%String name="",value="",cookie=request.getHeader(""),usrid=request.getParameter("id"); int a,b;
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
 
	
   <%! String cognitive,sex,hand,sex1,hand1; int ncognitive=0,abncognitive=0,man=0,woman=0,man1=0,woman1=0,lhand1=0,rhand1=0,lhand=0,rhand=0,dhand=0,dhand1=0; double a,b;%>
	<%
		
		String dataPoints=null;
		Connection conn=null;
		String url="jdbc:mysql://localhost:3307/jspPj";
		String id="root";
		String pw="0955";
		Class.forName("com.mysql.jdbc.Driver");
		DriverManager.getConnection(url,id,pw);
		
		ResultSet rs=null;
		ResultSet rs1=null;
		ResultSet rs2=null;
		ResultSet rs3=null;
		ResultSet rs4=null;
		
		Statement stmt=null;
		Statement stmt1=null;
		Statement stmt2=null;
		Statement stmt3=null;
		Statement stmt4=null;
		
		ResultSetMetaData rsmd=null;
		ResultSetMetaData rsmd1=null;
		ResultSetMetaData rsmd2=null;
		ResultSetMetaData rsmd3=null;
		ResultSetMetaData rsmd4=null;
		
		int columnCount=0;
		int columnCount1=0;
		int columnCount2=0;
		int columnCount3=0;
		int columnCount4=0;
		String sql="select * from kmmse1 where useremail='"+userID+"'";
		String sql1="select * from kmmse1 where useremail='"+userID+"' and 기억력판단 = '정상'";
		String sql2="select * from kmmse1 where useremail='"+userID+"' and 기억력판단 = '정상'";
		String sql3="select * from kmmse1 where useremail='"+userID+"' and 기억력판단 = '비정상'";
		String sql4="select * from kmmse1 where useremail='"+userID+"' and 기억력판단 = '비정상'";
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
	
		while(rs.next()){
				cognitive=rs.getString("기억력판단");
			if("비정상".equals(cognitive))
				abncognitive++;
			else if("정상".equals(cognitive))
				ncognitive++;
		}
	
		while(rs1.next()){
			sex=rs1.getString("성별");
		if("여자".equals(sex))
			woman++;
		else if("남자".equals(sex))
			man++;
		}
	
		while(rs2.next()){
			hand=rs2.getString("손");
		if("왼손".equals(hand))
			lhand++;
		else if("오른손".equals(hand))
			rhand++;
		else
			dhand++;
		}
		while(rs3.next()){
			sex1=rs3.getString("성별");
		if("여자".equals(sex1))
			woman1++;
		else if("남자".equals(sex1)){
			man1++;
		}
		}
		while(rs4.next()){
			hand1=rs4.getString("손");
		if("왼손".equals(hand1))
			lhand1++;
		else if("오른손".equals(hand))
			rhand1++;
		else
			dhand1++;
		}
		conn.close();
		}catch(Exception e){
			out.println("오류");
			dataPoints=null;
		}
		a=ncognitive/(ncognitive+abncognitive);
		b=abncognitive/(ncognitive+abncognitive);
	%>
 
<table id="hor-minimalist-a" summary="Employee Pay Sheet" style="position:fixed; top:55%; left:47%; width:50%; height:30%;">
    <thead>
    	<tr>
    		<th scope="col">인지기능</th>
        	<th scope="col">남자</th>
            <th scope="col">여자</th>
            <th scope="col">왼손</th>
            <th scope="col">오른손</th>
            <th scope="col">양손</th>
        </tr>
    </thead>
    <tbody>
    	<tr>
    	 	<td>정상</td>
        	<td><%=man%></td>
            <td><%=woman%></td>
            <td><%=lhand%></td>
            <td><%=rhand%></td>
            <td><%=dhand%></td>
        </tr>
        <tr>
        	<td>비정상</td>
        	<td><%=man1%></td>
            <td><%=woman1%></td>
            <td><%=lhand1%></td>
            <td><%=rhand1%></td>
            <td><%=dhand1%></td>
        </tr>
        <tr>
        	<td></td>
            <td><%=man+man1%></td>
            <td><%=woman+woman1%></td>
            <td><%=lhand+lhand1%></td>
            <td><%=rhand+rhand1%></td>
            <td><%=dhand+dhand1%></td>
        </tr>
     
    </tbody>
</table>
 
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
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
               <div class="job"><%=userID%></div>
         </div>
      
          <a href="logout.jsp"> 
         	<i class='bx bx-log-out' id="log_out" ></i>
          </a>
     </li>
    </ul>
  </div>

<div id="colchartdiv"></div>
<div id="colchartdiv2"></div>
<div id="piechartdiv"></div>
    
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
am4core.ready(function() {

// Themes begin
am4core.useTheme(am4themes_animated);

// Themes end

// Create chart instance
var chart = am4core.create("colchartdiv", am4charts.XYChart);

// Add data
chart.data = [{
  "category": "남자",
  "visits": <%=man%>

}, {
  "category": "여자",
  "visits": <%=woman%>
}, {
  "category": "왼손",
  "visits": <%=lhand%>
}, {
  "category": "오른손",
  "visits": <%=rhand%>
},{  
  "category": "양손잡이",
  "visits": <%=dhand%>
}];

// Create axes

var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
categoryAxis.dataFields.category = "category";
categoryAxis.renderer.grid.template.location = 0;
categoryAxis.renderer.minGridDistance = 30;

categoryAxis.renderer.labels.template.adapter.add("dy", function(dy, target) {
  if (target.dataItem && target.dataItem.index & 2 == 2) {
    return dy + 25;
  }
  return dy;
});

var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());

// Create series
var series = chart.series.push(new am4charts.ColumnSeries());
series.dataFields.valueY = "visits";
series.dataFields.categoryX = "category";
series.name = "Visits";
series.columns.template.tooltipText = "{categoryX}: [bold]{valueY}[/]";
series.columns.template.fillOpacity = 0.5;
series.columns.template.adapter.add("fill", function(fill, target) {
	if (target.dataItem && (target.dataItem.categoryX == "남자") ) {
	    return am4core.color(chart.colors.getIndex(0));
	  }
	else if(target.dataItem && (target.dataItem.categoryX == "여자") )  {
		return am4core.color(chart.colors.getIndex(0));
	  }
	else if(target.dataItem && (target.dataItem.categoryX == "왼손") ){
		return am4core.color(chart.colors.getIndex(0));
	}
	else if(target.dataItem && (target.dataItem.categoryX == "오른손")){
		return am4core.color(chart.colors.getIndex(0));
	}
	else if(target.dataItem && (target.dataItem.categoryX == "양손잡이")){
		return am4core.color(chart.colors.getIndex(0));
	}
	});

var columnTemplate = series.columns.template;
columnTemplate.strokeWidth = 2;
columnTemplate.strokeOpacity = 1;
//--------------------------------------------------




//------------------------- 밑에 파이차트
am4core.useTheme(am4themes_animated);
//Themes end


//Create chart instance
var chart = am4core.create("piechartdiv", am4charts.PieChart);

//Set data
var selected;
var types = [{
type: "정상",
percent: <%=ncognitive%>,
color: chart.colors.getIndex(0),
subs: [{
 type: "남자",
 percent: <%=man%>
}, {
 type: "여자",
 percent: <%=woman%>
}, {
 type: "왼손",
 percent: <%=lhand%>
},{
 type: "오른손",
 percent: <%=rhand%>
},{
  type: "양손잡이",
  percent: <%=dhand%>
}
]
}, {
type: "비정상",
percent: <%=abncognitive%>,
color: chart.colors.getIndex(1),
subs: [{
 type: "남자",
 percent:<%=man1%>
}, {
 type: "여자",
 percent: <%=woman1%>
}, {
 type: "왼손",
 percent:<%=lhand1%>
},{
 type:"오른손",
 percent:<%=rhand1%>
},{
type: "양손잡이",
percent: <%=dhand1%>
}
]
}];

//Add data
chart.data = generateChartData();

//Add and configure Series
var pieSeries = chart.series.push(new am4charts.PieSeries());
pieSeries.dataFields.value = "percent";
pieSeries.dataFields.category = "type";
pieSeries.slices.template.propertyFields.fill = "color";
pieSeries.slices.template.propertyFields.isActive = "pulled";
pieSeries.slices.template.strokeWidth = 0;
pieSeries.slices.template.fillOpacity = 0.8;

function generateChartData() {
var chartData = [];
for (var i = 0; i < types.length; i++) {
 if (i == selected) {
   for (var x = 0; x < types[i].subs.length; x++) {
     chartData.push({
       type: types[i].subs[x].type,
       percent: types[i].subs[x].percent,
       color: types[i].color,
       pulled: true
     });
   }
 } else {
   chartData.push({
     type: types[i].type,
     percent: types[i].percent,
     color: types[i].color,
     id: i
   });
 }
}
return chartData;
}

pieSeries.slices.template.events.on("hit", function(event) {
if (event.target.dataItem.dataContext.id != undefined) {
 selected = event.target.dataItem.dataContext.id;
} else {
 selected = undefined;
}
chart.data = generateChartData();
});

}); // end am4core.ready()


</script>
<!-- ------------------------------------------------ -->

<script>
am4core.ready(function() {

	// Themes begin
	am4core.useTheme(am4themes_animated);

	// Themes end

	// Create chart instance
	var chart = am4core.create("colchartdiv2", am4charts.XYChart);

	// Add data
	chart.data = [{
		  "category": "남자",
		  "visits": <%=man1%>
		}, {
		  "category": "여자",
		  "visits": <%=woman1%>
		}, {
		  "category": "왼손",
		  "visits": <%=lhand1%>
		}, {
		  "category": "오른손",
		  "visits": <%=rhand1%>
		},{
			  "category": "양손잡이",
			  "visits": <%=dhand1%>
			}];

	// Create axes

	var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
	categoryAxis.dataFields.category = "category";
	categoryAxis.renderer.grid.template.location = 0;
	categoryAxis.renderer.minGridDistance = 30;

	categoryAxis.renderer.labels.template.adapter.add("dy", function(dy, target) {
	  if (target.dataItem && target.dataItem.index & 2 == 2) {
	    return dy + 25;
	  }
	  return dy;
	});

	var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());

	// Create series
	var series = chart.series.push(new am4charts.ColumnSeries());
	series.dataFields.valueY = "visits";
	series.dataFields.categoryX = "category";
	series.name = "Visits";
	series.columns.template.tooltipText = "{categoryX}: [bold]{valueY}[/]";
	series.columns.template.fillOpacity = 0.5;
	series.columns.template.adapter.add("fill", function(fill, target) {
		if (target.dataItem && (target.dataItem.categoryX == "남자") ) {
		    return am4core.color(chart.colors.getIndex(1));
		  }
		else if(target.dataItem && (target.dataItem.categoryX == "여자") )  {
			return am4core.color(chart.colors.getIndex(1));
		  }
		else if(target.dataItem && (target.dataItem.categoryX == "왼손") ){
			return am4core.color(chart.colors.getIndex(1));
		}
		else if(target.dataItem && (target.dataItem.categoryX == "오른손")){
			return am4core.color(chart.colors.getIndex(1));
		}
		else if(target.dataItem && (target.dataItem.categoryX == "양손잡이")){
			return am4core.color(chart.colors.getIndex(1));
		}
		});

	var columnTemplate = series.columns.template;
	columnTemplate.strokeWidth = 2;
	columnTemplate.strokeOpacity = 1;
	
});
</script>
  <%ncognitive=0; abncognitive=0; man=0; woman=0; man1=0; woman1=0; lhand=0; rhand=0; lhand1=0; rhand1=0; dhand=0;dhand1=0; %>
  <script type="text/javascript">
history.pushState(null,null,'login.jsp');
window.onpopstate = function(event) {
	history.go(-1);
};
</script>
  </body>
</html>
