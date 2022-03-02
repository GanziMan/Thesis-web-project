<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
 <%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.*"%>

<script src="https://canvasjs.com/assets/script/canvasjs.min.js">
</script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">	
	<style>
	  @import "https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css";
	  
	  	 .select {
		  position: relative;
		  display: block;
		  margin: 0 auto;
		  width: 100%;
		  max-width: 100%;
		  color: #cccccc;
		  vertical-align: middle;
		  text-align: left;
		  -webkit-user-select: none;
		  -moz-user-select: none;
		  -ms-user-select: none;
		  user-select: none;
	 	  -webkit-touch-callout: none;
	}
	.select .placeholder {
	  position: relative;
	  display: block;
	  background-color: #393d41;
	  z-index: 1;
	  padding: 1em;
	  border-radius: 2px;
	  cursor: pointer;
	}
	.select .placeholder:hover {
	  background: #34383c;
	}
	.select .placeholder:after {
	  position: absolute;
	  right: 1em;
	  top: 50%;
	  -webkit-transform: translateY(-50%);
	          transform: translateY(-50%);
	  font-family: 'FontAwesome';
	  content: '\f078';
	  z-index: 10;
	}
	.select.is-open .placeholder:after {
	  content: '\f077';
	}
	.select.is-open ul {
	  display: block;
	}
	.select.select--white .placeholder {
	  background: #fff;
	  color: #999;
	}
	.select.select--white .placeholder:hover {
	  background: #fafafa;
	}
	.select ul {
	  display: none;
	  position: absolute;
	  overflow: hidden;
	  width: 100%;
	  background: #fff;
	  border-radius: 2px;
	  top: 100%;
	  left: 0;
	  list-style: none;
	  margin: 5px 0 0 0;
	  padding: 0;
	  z-index: 100;
	}
	.select ul li {
	  display: block;
	  text-align: left;
	  padding: 0.8em 1em 0.8em 1em;
	  color: #999;
	  cursor: pointer;
	}
	.select ul li:hover {
	  background: #4ebbf0;
	  color: #fff;
	}
	  
	  body{
		  margin:% auto;
		}
	 .invisible {
	      display: none;
	  }
	  .pagination a{
	  display: inline-block;
	  margin-right: 5px;
	  cursor: pointer;
	}
	

	  
	</style>
</head>
<body>
	
	<div class="select">
  		<span class="placeholder">Service Menu</span>
	  		<ul>
			  	<li onclick="javascript:location.href='main.jsp'">메인화면</li>
			  	<li onclick="javascript:location.href='patientsearch.jsp'">환자정보</li>
			    <li onclick="javascript:location.href='chart.jsp'">데이터차트</li>
			    <li onclick="javascript:location.href='info.jsp'">정보입력</li>
			    <li onclick="javascript:location.href='logout.jsp'">로그아웃</li>
	  		</ul>
	</div>
	<%! String cognitive,sex,hand,sex1,hand1; int ncognitive=0,abncognitive=0,man=0,woman=0,man1=0,woman1=0,lhand1=0,rhand1=0,lhand=0,rhand=0,c,d; double a,b;%>
<%
	Gson gsonObj=new Gson();
  	Map<Object,Object> map=null;
	List<Map<Object,Object>> list=new ArrayList<Map<Object,Object>>();
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
	String sql="select * from kmmse1";
	String sql1="select * from kmmse1 where 기억력판단 = '정상'";
	String sql2="select * from kmmse1 where 기억력판단 = '정상'";
	String sql3="select * from kmmse1 where 기억력판단 = '비정상'";
	String sql4="select * from kmmse1 where 기억력판단 = '비정상'";
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
		if("정상".equals(cognitive))
			ncognitive++;
		else
			abncognitive++;
	}

	while(rs1.next()){
		sex=rs1.getString("성별");
	if("남자".equals(sex))
		man++;
	if("여자".equals(sex))
		woman++;
	}

	while(rs2.next()){
		hand=rs2.getString("손");
	if("왼손".equals(hand))
		lhand++;
	else
		rhand++;
	}
	
	while(rs3.next()){
		sex1=rs3.getString("성별");
	if("남자".equals(sex))
		man1++;
	else
		woman1++;
	}
	
	while(rs4.next()){
		hand1=rs4.getString("손");
	if("왼손".equals(hand1))
		lhand1++;
	else
		rhand1++;
	}
	conn.close();
	}catch(Exception e){
		out.println("오류");
		dataPoints=null;
	}
	conn.close();
	rs.close();
	rs1.close();
	rs2.close();
	rs3.close();
	rs4.close();
	stmt.close();
	stmt1.close();
	stmt2.close();
	stmt3.close();
	stmt4.close();
	c=0;
	d=0;
	c=ncognitive;
	d=abncognitive;

%>

<%
	a=(ncognitive*100/(ncognitive+abncognitive));
	b=(abncognitive*100/(ncognitive+abncognitive));
	map = new HashMap<Object,Object>(); map.put("y", c); map.put("name", "정상"); map.put("color", "#E7823A"); list.add(map);
	map = new HashMap<Object,Object>(); map.put("y",d); map.put("name", "비정상"); map.put("color", "#546BC1"); list.add(map);

	String resultDataPoint = gsonObj.toJson(list);
	 
	list = new ArrayList<Map<Object,Object>>();
	map = new HashMap<Object,Object>(); map.put("label", "남자"); map.put("y", man);map.put("color", "#2EB2FA"); list.add(map);
	map = new HashMap<Object,Object>(); map.put("label", "여자"); map.put("y", woman); map.put("color", "#FA1919"); list.add(map);
	map = new HashMap<Object,Object>(); map.put("label", "왼손"); map.put("y", lhand); map.put("color", "#0C0C0C");list.add(map);
	map = new HashMap<Object,Object>(); map.put("label", "오른손"); map.put("y", rhand); map.put("color", "#A1A29D"); list.add(map);
	
	 
	String NormalDataPoint = gsonObj.toJson(list);
	 
	list = new ArrayList<Map<Object,Object>>();
	 
	map = new HashMap<Object,Object>(); map.put("label", "남자"); map.put("y", man1);map.put("color", "#2EB2FA"); list.add(map);
	map = new HashMap<Object,Object>(); map.put("label", "여자"); map.put("y", woman1); map.put("color", "#FA1919"); list.add(map);
	map = new HashMap<Object,Object>(); map.put("label", "왼손"); map.put("y", lhand1); map.put("color", "#0C0C0C");list.add(map);
	map = new HashMap<Object,Object>(); map.put("label", "오른손"); map.put("y", rhand1); map.put("color", "#A1A29D"); list.add(map);
	String abNormalDataPoint  = gsonObj.toJson(list);
	c=0;
	d=0;
	%>

 
		
	<div id="chartContainer" style="height: 500px; width: 100%;"></div>

	<script type="text/javascript">

		window.onload = function () {
			var totalVisitors = <%out.print(resultDataPoint);%>;
			var visitorsData = {
				"Normal vs abNormal": [{
					click: visitorsChartDrilldownHandler,
					cursor: "pointer",
					explodeOnClick: false,
					innerRadius: "75%",
					legendMarkerType: "square",
					name: "Normal vs abNormal",
					radius: "100%",
					showInLegend: true,
					startAngle: 90,
					type: "pie", 
					dataPoints: <%out.print(resultDataPoint);%>
				}],
				"정상": [{
					color: "#E7823A",
					name: "Normal",
					type: "column",
					dataPoints: <%out.print(NormalDataPoint);%>
				}],
				"비정상": [{
					color: "#546BC1",
					name: "abNormal",
					type: "column",
					dataPoints: <%out.print(abNormalDataPoint);%>
				}]
			};
			
			var newVSReturningVisitorsOptions = {
				animationEnabled: true,
				theme: "light2",
				title: {
					text: "인지장애 정상 vs 비정상"
				},
				subtitles: [{
					text: "차트를 눌러주시면 자세하게 볼 수 있습니다.",
					backgroundColor: "#999",
					fontSize: 16,
					fontColor: "white",
					padding: 5
				}],
				legend: {
					fontFamily: "calibri",
					fontSize: 14,
					itemTextFormatter: function (e) {
						return e.dataPoint.name + ": " +e.dataPoint.y+ "명";  
					}
				},
				data: []
			};
			var visitorsDrilldownedChartOptions = {
				animationEnabled: true,
				theme: "light2",
				axisX: {
					labelFontColor: "#717171",
					lineColor: "#a2a2a2",
					tickColor: "#a2a2a2"
				},
				axisY: {
					gridThickness: 0,
					includeZero: false,
					labelFontColor: "#717171",
					lineColor: "#a2a2a2",
					tickColor: "#a2a2a2",
					lineThickness: 1
				},
				data: []
			};
			 
			var chart = new CanvasJS.Chart("chartContainer", newVSReturningVisitorsOptions);
			chart.options.data = visitorsData["Normal vs abNormal"];
			chart.render();
			 
			function visitorsChartDrilldownHandler(e) {
				chart = new CanvasJS.Chart("chartContainer", visitorsDrilldownedChartOptions);
				chart.options.data = visitorsData[e.dataPoint.name];
				chart.options.title = { text: e.dataPoint.name }
				chart.render();
				$("#backButton").toggleClass("invisible");
			}
			 
			$("#backButton").click(function() { 
				$(this).toggleClass("invisible");
				chart = new CanvasJS.Chart("chartContainer", newVSReturningVisitorsOptions);
				chart.options.data = visitorsData["Normal vs abNormal"];
				chart.render();mychart.clear();
			});
			chart.render();}


	</script>
	

</body>
</html>                              