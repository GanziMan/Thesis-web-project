<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.io.PrintWriter" %>
 <%@ page import="java.net.URLDecoder" %>
<html>
	<head>
	<meta charset="UTF-8">
	<link href='https://fonts.googleapis.com/css?family=Rock+Salt' rel='stylesheet' type='text/css'>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="style.css"></link>
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'></link>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<style>
	@import "https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css";
 	 @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
	   @import url("/data/201107/IJ13098534210144/style.css"); 
	body{
	font-family:Arial, Helvetica, sans-serif; 
	margin:% auto;
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
	
	.pagination a{


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
	table a:link {
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
	

	#hor-minimalist-a
	{
		font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
		font-size: 12px;
		background: #fff;
		margin: 3%;
		width: 40%;
		border-collapse: collapse;
		text-align: left;
	}
	#hor-minimalist-a th
	{
		font-size: 14px;
		font-weight: normal;
		color: #039;
		padding: 1% 1%;
		border-bottom: 2px solid #6678b1;
	}
	#hor-minimalist-a td
	{
		color: #669;
		padding: 9px 8px 0% 8px;
	}
	#hor-minimalist-a tbody tr:hover td
	{
		color: #009;
	}


	.sl{
	font-size:15px;
	text-aligin:center;
	}
	th,td{
		text-align:center;
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
	 <%String usr = (String)session.getAttribute("userID");%>
		<% 	
		 if(session.getAttribute("userID")==null){
			 PrintWriter script = response.getWriter(); 
	 	 	 script.println("<script>"); 
	  		 script.println("alert('로그인상태가 아닙니다 로그인해주세요!')"); 
	 		 script.println("location.href = 'login.jsp'"); 
	  		 script.println("</script>"); 
		 }
		%>
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
       <a href="kchart.jsp">
         <i class='bx bx-pie-chart-alt-2' ></i>
         <span class="links_name">Data Chart</span>
       </a>
       <span class="tooltip">Data Chart</span>
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
              <div class="job"><%=envalue%></div>

         </div>
         <a href="logout.jsp"> 
         	<i class='bx bx-log-out' id="log_out" ></i>
          </a>
  
     </li>
    </ul>
  </div>

	
	
	<%@ page import="java.sql.*" %>
		<%		
			String url="jdbc:mysql://localhost:3307/jspPj";
			String id="root";
			String pw="0955";
			String userID=request.getParameter("userID");
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection(url,id,pw);
			String sql="SELECT * FROM kmmse1 where email='"+envalue+"'";
			PreparedStatement pstmt=null;
			PreparedStatement pstmt1=null;
			ResultSet rs=null;
			
		%>
		 
			  
			<table  id="hor-minimalist-a" summary="Employee Pay Sheet" style=" position:fixed;  left:7%; top:-2%;width:90%; height:80%;">
			<thead>
			<tr>
				<th scope="col">나이</th>
				<th scope="col">kmmse점수</th>
				<th scope="col">성별</th>
				<th scope="col">학력</th>
				<th scope="col">hand</th>
				<th scope="col">인지장애호소</th>
				<th scope="col">입력시간</th>	
			</tr>
			</thead>
			<tbody>		
		<%
			try{
				request.setCharacterEncoding("UTF-8");
				String kbs=request.getParameter("kbs");
				String kbs1=request.getParameter("kbs1");
				String ebs=request.getParameter("ebs");
				String ebs1=request.getParameter("ebs1");
				String sbs=request.getParameter("sbs");
				String sbs1=request.getParameter("sbs1");
			if(kbs==null & kbs1==null){
				pstmt=conn.prepareStatement("SELECT * FROM kmmse1 where useremail='"+usr+"'");
			}else if(kbs != null & kbs1.equals("")){
				pstmt=conn.prepareStatement("SELECT * FROM kmmse1 where useremail='"+usr+"'");
			}else if(kbs =="나이" & kbs1 != null  ){
				if(ebs ==null & ebs1 == null)
				{
					pstmt=conn.prepareStatement("select * from kmmse1 where useremail='"+usr+"' and "+kbs+">=?");
					pstmt.setString(1,kbs1);
				}else if(ebs !=null & ebs1.equals("")){
					pstmt=conn.prepareStatement("select * from kmmse1 where useremail='"+usr+"' and "+kbs+">=?");	
					pstmt.setString(1,kbs1);
				}else if(ebs == "점수" & ebs1 != null)
				{
					if(sbs ==null & sbs1 ==null){
						pstmt=conn.prepareStatement("select * from kmmse1 where useremail='"+usr+"' and "+kbs+">="+Integer.parseInt(kbs1)+" and "+ebs+">='"+ebs1+"'");
						
					}else if(sbs !=null & sbs1.equals(""))
					{
						pstmt=conn.prepareStatement("select * from kmmse1 where useremail='"+usr+"' and "+kbs+">="+kbs1+" and "+ebs+">='"+ebs1+"'");
					}else if(sbs != null & sbs1 !=null)
					{
						pstmt=conn.prepareStatement("select * from kmmse1 where useremail='"+usr+"' and "+kbs+">="+kbs1+" and "+ebs+">='"+ebs1+"' and "+sbs+"='"+sbs1+"'");
					}
				}else if(ebs != null & ebs1 != null){
					if(sbs =="3th" & sbs1 ==null){
						pstmt=conn.prepareStatement("select * from kmmse1 where useremail='"+usr+"' and "+kbs+"<="+Integer.parseInt(kbs1)+" and "+ebs+"='"+ebs1+"'");
						
					}else if(sbs !=null & sbs1.equals(""))
					{
						pstmt=conn.prepareStatement("select * from kmmse1 where useremail='"+usr+"' and "+kbs+">="+kbs1+" and "+ebs+"='"+ebs1+"'");
					}else if(sbs !="점수" & sbs1 !=null)
					{
						pstmt=conn.prepareStatement("select * from kmmse1 where useremail='"+usr+"' and "+kbs+">="+Integer.parseInt(kbs1)+" and "+ebs+"='"+ebs1+"' and "+sbs+">="+Integer.parseInt(sbs1)+"");
					}else if(sbs != null & sbs1 !=null)
					{
						pstmt=conn.prepareStatement("select * from kmmse1 where useremail='"+usr+"' and "+kbs+">="+kbs1+" and "+ebs+"='"+ebs1+"' and "+sbs+"='"+sbs1+"'");
					}
				}
			}
			else if(kbs !="점수" & kbs1 != null){
				
				if(ebs ==null & ebs1 == null)
				{
					pstmt=conn.prepareStatement("select * from kmmse1 where useremail='"+usr+"' and "+kbs+">=?");
					pstmt.setString(1,kbs1);
				
				}else if(ebs !=null & ebs1.equals("")){
					pstmt=conn.prepareStatement("select * from kmmse1 where useremail='"+usr+"' and "+kbs+">=?");	
					pstmt.setString(1,kbs1);
				}	
				else if(ebs != "나이" & ebs1 != null)
				{
					if(sbs ==null & sbs1 ==null){
						pstmt=conn.prepareStatement("select * from kmmse1 where useremail='"+usr+"' and "+kbs+">="+kbs1+" and "+ebs+">='"+ebs1+"'");
						
					}else if(sbs !=null & sbs1.equals(""))
					{
						pstmt=conn.prepareStatement("select * from kmmse1 where useremail='"+usr+"' and "+kbs+">="+kbs1+" and "+ebs+">='"+ebs1+"'");
					}else if(sbs != null & sbs1 !=null)
					{
						pstmt=conn.prepareStatement("select * from kmmse1 where useremail='"+usr+"' and "+kbs+">="+kbs1+" and "+ebs+">='"+ebs1+"' and "+sbs+"='"+sbs1+"'");
					}
				}else if(ebs != null & ebs1 != null)
				{
					if(sbs ==null & sbs1 ==null){
						pstmt=conn.prepareStatement("select * from kmmse1 where useremail='"+usr+"' and "+kbs+">="+kbs1+" and "+ebs+"='"+ebs1+"'");
						
					}else if(sbs !=null & sbs1.equals(""))
					{
						pstmt=conn.prepareStatement("select * from kmmse1 where useremail='"+usr+"' and "+kbs+">="+kbs1+" and "+ebs+"='"+ebs1+"'");
					}else if(sbs != "나이" & sbs1 !=null)
					{
						pstmt=conn.prepareStatement("select * from kmmse1 where useremail='"+usr+"' and "+kbs+">="+kbs1+" and "+ebs+">='"+ebs1+"' and "+sbs+"='"+sbs1+"'");
					}else if(sbs != null & sbs1 !=null)
					{
						pstmt=conn.prepareStatement("select * from kmmse1 where useremail='"+usr+"' and "+kbs+">="+kbs1+" and "+ebs+"='"+ebs1+"' and "+sbs+"='"+sbs1+"'");
					}
				}
			}
			else if(kbs !=null & kbs1 != null){
			
				if(ebs ==null & ebs1 == null)
				{
					pstmt=conn.prepareStatement("select * from kmmse1 where useremail='"+usr+"' and "+kbs+"=?");
					pstmt.setString(1,kbs1);
				
				}else if(ebs !=null & ebs1.equals("")){
					pstmt=conn.prepareStatement("select * from kmmse1 where useremail='"+usr+"' and "+kbs+"=?");	
					pstmt.setString(1,kbs1);
				}	
				else if(ebs != "점수" & ebs1 != null)
				{
					if(sbs ==null & sbs1 ==null){
						pstmt=conn.prepareStatement("select * from kmmse1 where useremail='"+usr+"' and "+kbs+"="+kbs1+" and "+ebs+">='"+ebs1+"'");
						
					}else if(sbs !=null & sbs1.equals(""))
					{
						pstmt=conn.prepareStatement("select * from kmmse1 where useremail='"+usr+"' and "+kbs+"="+kbs1+" and "+ebs+">='"+ebs1+"'");
					}else if(sbs != "나이" & sbs1 !=null)
					{
						pstmt=conn.prepareStatement("select * from kmmse1 where useremail='"+usr+"' and "+kbs+"="+kbs1+" and "+ebs+">='"+ebs1+"' and "+sbs+">='"+sbs1+"'");
					}else if(sbs != null & sbs1 !=null)
					{
						pstmt=conn.prepareStatement("select * from kmmse1 where useremail='"+usr+"' and "+kbs+"="+kbs1+" and "+ebs+">='"+ebs1+"' and "+sbs+"='"+sbs1+"'");
					}
				}
				else if(ebs != "나이" & ebs1 != null)
				{
					if(sbs ==null & sbs1 ==null){
						pstmt=conn.prepareStatement("select * from kmmse1 where useremail='"+usr+"' and "+kbs+"="+kbs1+" and "+ebs+">='"+ebs1+"'");
						
					}else if(sbs !=null & sbs1.equals(""))
					{
						pstmt=conn.prepareStatement("select * from kmmse1 where useremail='"+usr+"' and "+kbs+"="+kbs1+" and "+ebs+">='"+ebs1+"'");
					}else if(sbs != "점수" & sbs1 !=null)
					{
						pstmt=conn.prepareStatement("select * from kmmse1 where useremail='"+usr+"' and "+kbs+"="+kbs1+" and "+ebs+">='"+ebs1+"' and "+sbs+">='"+sbs1+"'");
					}else if(sbs != null & sbs1 !=null)
					{
						pstmt=conn.prepareStatement("select * from kmmse1 where useremail='"+usr+"' and "+kbs+"="+kbs1+" and "+ebs+">='"+ebs1+"' and "+sbs+"='"+sbs1+"'");
					}
				}
				else if(ebs != null & ebs1 != null)
				{
					if(sbs ==null & sbs1 ==null){
						pstmt=conn.prepareStatement("select * from kmmse1 where useremail='"+usr+"' and "+kbs+"="+kbs1+" and "+ebs+"='"+ebs1+"'");
						
					}else if(sbs !=null & sbs1.equals(""))
					{
						pstmt=conn.prepareStatement("select * from kmmse1 where useremail='"+usr+"' and "+kbs+"="+kbs1+" and "+ebs+"='"+ebs1+"'");
					}else if(sbs != "점수" & sbs1 !=null)
					{
						pstmt=conn.prepareStatement("select * from kmmse1 where useremail='"+usr+"' and "+kbs+"="+kbs1+" and "+ebs+"='"+ebs1+"' and "+sbs+">='"+sbs1+"'");
					}else if(sbs != "나이" & sbs1 !=null)
					{
						pstmt=conn.prepareStatement("select * from kmmse1 where useremail='"+usr+"' and "+kbs+"="+kbs1+" and "+ebs+"='"+ebs1+"' and "+sbs+">='"+sbs1+"'");
					}else if(sbs != null & sbs1 !=null)
					{
						pstmt=conn.prepareStatement("select * from kmmse1 where useremail='"+usr+"' and "+kbs+"="+kbs1+" and "+ebs+"='"+ebs1+"' and "+sbs+"='"+sbs1+"'");
					}
				}
			}

			
			
				rs=pstmt.executeQuery();
				
				while(rs.next()){
		%>
		
				<tr class='even'>
				<td><%=rs.getString("나이") %></td>
				<td><%=rs.getString("점수") %></td>
				<td><%=rs.getString("성별") %></td>
				<td><%=rs.getString("학력") %></td>
				<td><%=rs.getString("손") %></td>
				<td><%=rs.getString("기억력판단") %></td>
				<td><%=rs.getString("입력시간") %></td>
				</tr>
		
			<% 		
			}
			}catch(SQLException ex){
				out.println(ex.getMessage());
				ex.printStackTrace();
			}finally{
				if(pstmt !=null) try{pstmt.close();} catch(SQLException ex){}
			}
		%>
			<tbody>	
		</table>
		<hr style=" position:fixed;top:84%;width:100%; border:1px solid lightblue;">
		<ul class="pagination" style="position:fixed; top:85%; left:12%;" ></ul><label style="position:fixed; top:88%; left:9%;">PAGE</label>
		<script type="text/javascript">
		function pagination(){
			var req_num_row=15;
			var $tr=jQuery('tbody tr');
			var total_num_row=$tr.length;
			var num_pages=0;
			if(total_num_row % req_num_row ==0){
				num_pages=total_num_row / req_num_row;
			}
			if(total_num_row % req_num_row >=1){
				num_pages=total_num_row / req_num_row;
				num_pages++;
				num_pages=Math.floor(num_pages++);
			}
	  
			for(var i=1; i<=num_pages; i++){
				jQuery('.pagination').append("<li><a>"+i+"</a></li>");
	      jQuery('.pagination li:nth-child(2)').addClass("active");
	      jQuery('.pagination a').addClass("pagination-link");
			}
	  
	  
			$tr.each(function(i){
	      jQuery(this).hide();
	      if(i+1 <= req_num_row){
					$tr.eq(i).show();
				}
			});
	  
			jQuery('.pagination a').click('.pagination-link', function(e){
				e.preventDefault();
				$tr.hide();
				var page=jQuery(this).text();
				var temp=page-1;
				var start=temp*req_num_row;
	      var current_link = temp;
	      
	      jQuery('.pagination li').removeClass("active");
				jQuery(this).parent().addClass("active");
	    
				for(var i=0; i< req_num_row; i++){
					$tr.eq(start+i).show();
				}
	      
	      if(temp >= 1){
	        jQuery('.pagination li:first-child').removeClass("disabled");
	      }
	      else {
	        jQuery('.pagination li:first-child').addClass("disabled");
	      }
	            
			});
	  
	    jQuery('.prev').click(function(e){
	        e.preventDefault();
	        jQuery('.pagination li:first-child').removeClass("active");
	    });

	    jQuery('.next').click(function(e){
	        e.preventDefault();
	        jQuery('.pagination li:last-child').removeClass("active");
	    });

		}

	jQuery('document').ready(function(){
		pagination();
	  
	  jQuery('.pagination li:first-child').addClass("disabled");
	  
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