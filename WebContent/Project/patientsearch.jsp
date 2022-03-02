<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
   <%@ page import="java.sql.*" %>
   <%@ page import="java.io.PrintWriter" %>
   
    <%@ page import="java.net.URLDecoder" %>
<html>
   <head>
   <meta charset="UTF-8">
   <meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1.0"> 
	
    <title>환자정보</title>
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
       <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'></link>
       <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <link rel='stylesheet prefetch' href='http://koalyptus.github.io/TableFilter/tablefilter/style/tablefilter.css'>
		<script src='TableFilter.js'></script>
 
       <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
		<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
   <style>
   @import "https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css";
     @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
      @import url("/data/201107/IJ13098534210144/style.css"); 
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
     background:black;
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
   body{
   font-family:Arial, Helvetica, sans-serif;
   }
   .pagination a{
     position:fixed;
      top:50%;
   
     cursor: pointer;
   
   }
   

   
   #demo
   {
      font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
      font-size: 12px;
      background: #fff;
      margin: 3%;
      width: 40%;
      border-collapse: collapse;
      text-align: left;
   }
   #demo th
   {
      font-size: 14px;
      font-weight: normal;
      color: #039;
      padding: 1% 1%;
      border-bottom: 2px solid #6678b1;
   }
   #demo td
   {
      color: #669;
      padding: 9px 8px 0% 8px;
   }
   #demo tbody tr:hover td
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
       div.paginate{
    padding: 5px 0px;
    margin: auto;
}
	@media(max-width:480px){
		.main{
			width:70%;
			height:70%;
			margin-right:100px;
		}
		#demo{
			width:70%;
			height:70%;
			margin-right:100px;
		}
		.sidebar{
		height:100%;
		display:none;
		}
		.pagination{
		display:none;
		width:5%;
		padding:3px;
		margin-left:150px;
		}
	}
</style>
   </head>
   <body>
   
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
       <a href="kchart.jsp?id=<%=usr%>">
         <i class='bx bx-pie-chart-alt-2' ></i>
         <span class="links_name">Data Chart</span>
       </a>
       <span class="tooltip">Data chart</span>
     </li>
 
     <li>
       <a href="#">
         <i class='bx bx-cog' ></i>
         <span class="links_name">Setting</span>
       </a>
       <span class="tooltip">Setting</span>
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
             <div class="job"><label style="margin-left:30px;"><%=usr%></label></div>
         </div>
        
     </li>
    </ul>
  </div>
      <%      
      
      String url="jdbc:mysql://localhost:3307/jspPj";
      String id="root";
      String pw="0955";
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection conn=DriverManager.getConnection(url,id,pw);
      String userID=request.getParameter("userID");
      String sql="SELECT * FROM kmmse1 where useremail='"+usr+"'";
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
      
      <div class="main">
         <div class="table-responsive">
         <table id="demo"  name="example-table" class="table" summary="Employee Pay Sheet" style=" position:fixed;  left:5%; top:-5%;width:90%; height:80%;">
         <thead>
         <tr style="text-align: center;">
            <th data-tsort-type="number" scope="col">나이</th>
            <th data-tsort-type="number" scope="col">kmmse점수</th>
            <th scope="col">성별</th>
            <th scope="col">학력</th>
            <th scope="col">hand</th>
            <th scope="col">인지장애호소</th>
            <th data-tsort-type="number" scope="col">입력시간</th>   
         </tr>
         </thead>
         <tbody id="myTable_tbody">
         <%while(rs.next()){%>
            <tr >
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
         %>
            </tbody>
      </table>
         <hr style=" position:fixed;top:84%;width:100%; border:1px solid lightblue;">
         <ul class="pagination" style="position:fixed; top:85%; left:12%;" ></ul><label style="position:fixed; top:88%; left:9%;">PAGE</label>
   
      </div> 
      </div>

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
    
   <!--       <form name="search" style="position:fixed;" method = "get"  action ="patientlist.jsp" >
      
 <div class="form-inline" style="position:fixed; top:87%; left:10%;">

   <select id="searchType" class="sl"name="kbs">
      <option value="1th">first</option>
      <option value="나이">나이</option>
      <option value="손">handless</option> 
      <option value="성별">성별</option>
      <option value="학력">학력</option>
      <option value="기억력판단">인지장애호소</option>
      <option value="점수">K-MMSE점수</option>
   </select>
   <input class="form-control" type="text" id="filter0" name="kbs1" 
      value="${pageMaker.cri.keyword}" placeholder="first condition"/><p><p>
      
   <select id="searchType" class="sl"name="ebs">
      <option value="2th">second</option>
      <option value="나이">나이</option>
      <option value="손">handless</option> 
      <option value="성별">성별</option>
      <option value="학력">학력</option>
      <option value="기억력판단">인지장애호소</option>
      <option value="점수">K-MMSE점수</option>
   </select>
   <input class="form-control" type="text" id="filter1" name="ebs1" 
      value="${pageMaker.cri.keyword}" placeholder="second condition"/><p>
   
   <select id="searchType" class="sl"name="sbs">
      <option value="3th">third</option>
      <option value="나이">나이</option>
      <option value="손">handless</option> 
      <option value="성별">성별</option>
      <option value="학력">학력</option>
      <option value="기억력판단">인지장애호소</option>
      <option value="점수">K-MMSE점수</option>
   </select>
   <input class="form-control" type="text" id="filter2" name="sbs1" 
      value="${pageMaker.cri.keyword}" placeholder="third condition"/>
   
   <button id="searchBtn" class="btn btn-primary" style="background-color:#393d41; border: 3px solid grey;" >Search</button>
</div>

      </form>   
      -->

   <script type="text/javascript">
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

   <script data-config="">
    var filtersConfig = {
     auto_filter: {
       
                 },
                 filters_row_index: 1,
                 state: true,
                 alternate_rows: true,
                 btn_reset: true,
                 status_bar: true,
                 msg_filter: 'Filtering…'
               };
               var tf = new TableFilter('demo', filtersConfig);
               tf.init();
   </script>
   <script>

 
(function($) {

	var methods = {
	
		init : function(settings) {
		
			return this.each(function() {
			
				var configs = {

					// input que vãi filtrar as tabelas
					'input' : 'input[type=search]',

					'trigger': {
						
						'element' 	: undefined // Elemento que será aplicado o evento, undefined será o próprio input do filtro
					},

					'caseSensitive'	:  false,
					
					'timeout'	: -1, // Timeout for keyboard events (keyup, keypress ...)
					
					'sort'	: false, // Aplica a função de ordenação das linhas

					'notFoundElement' : null,

					'callback'	:	function(){}
				};
				
				if(typeof(settings) === "object")
					$.extend(true, configs, settings);
				
				var $table = $(this);
				var $timeout = null;

				if(!configs.trigger.element)
					configs.trigger.element = configs.input;
					
				if(!configs.trigger.element.length)
					$.error('Trigger element not found.');

				configs.notFoundElement = $(configs.notFoundElement);

				/* Filtro das tabelas */
				$(configs.trigger.element).bind(configs.trigger.event, function() {

					if(configs.trigger.event.indexOf("key") < 0)
						configs.timeout = 0;

					try {
						
						clearTimeout($timeout);

					} catch(err){}
		
					$timeout = setTimeout(function(){

						console.time("filter");
						filterTable.call(undefined, $table, configs);
						console.timeEnd("filter");
						
					}, configs.timeout);
				});

				// Configuração para o sort das tabelas
				if(configs.sort) {

					var ths = $table.find("th:not([data-tsort=disabled])");
					
					ths.append("<span class=\"caret\"></span>").attr("data-tsort", "desc");

					ths.css("cursor", "pointer").addClass("tfsort").bind("click", function() {
						
						console.time("sort");
						sort.call(undefined, this)
						console.timeEnd("sort");
					});
				}
			});
		}
	}
	
	var filterTable = function(table, configs) {

		var textFound;
		var tdText;
		var values = $(configs.input).val() || $(configs.input).text();
		var toHide = [];
		var toShow = [];

		values = values.trim().split(" ");
		values = values.map(function(v){return v.trim();});

		if(!configs.caseSensitive)
			values = values.map(function(val){return val.toLowerCase();});

		values.map(function(val, index) {
			
			if(!val.trim().length)
				values.splice(index, 1);
		});

		if(!values.length) {
			
			toShow = table.find('tbody tr:hidden').toArray();

		} else {

			var disableds = [];

			table.find('thead th').each(function(index) {

				if($(this).attr("data-tfilter") == "disabled")
					disableds.push(index);
			});

			var trs = table.find('tbody tr').toArray();

			for(var i in trs) {

				if(i == "length")
					continue;

				var tr = trs[i];

				var textFound = 0;
				var arrayText = []; // TD texts

				$(tr).find('td:not([data-tfilter=disabled])').each(function(ind) {

					for(var i2 in disableds)
						if(disableds[i2] == ind)
							return;

					var tdText = $(this).text().trim();

					if(tdText.length)
						arrayText.push(!configs.caseSensitive ? tdText.toLowerCase() : tdText);
				});

				values.forEach(function(v){

					arrayText.every(function(t){

						if(t.indexOf(v) >= 0) {
							
							textFound++;
							return false;
						}
				
						return true;
					});
				});

				textFound = textFound == values.length;

				if(!textFound && $(tr).is(":visible"))
					toHide.push(tr);
				else if(textFound && $(tr).is(":hidden"))
					toShow.push(tr);
			}
		}

		if(toShow.length) {

			if(table.is(":hidden"))
				toShow.push(table.get(0));

			fastShow(toShow, "show");
		}

		if(toHide.length)
			fastShow(toHide, "hide");

		if(!toShow.length && !toHide.length)
			return;

		configs.callback.call();
		notFoundMessage(table, configs.notFoundElement);
	}
	
	var sort = function(th) {
	
	th = $(th);

	var tds 	= th.closest("table").find("tbody td:nth-child("+(th.parent().find("th").index(th.get(0))+1)+")");
	var array 	= [];
	var tsort   = th.attr("data-tsort") == "asc" ? "desc" : "asc";

	tsort == "asc" ? th.attr("data-tsort", "asc").find("span.caret").css("transform", "rotate(0deg)") : th.attr("data-tsort", "desc").find("span.caret").css("transform", "rotate(180deg)");

	/* Copia as linhas para serem ordenadas */
	tds.each(function(a) {

		array[array.length] = {
			
			text: null,
			obj : $(this).closest("tr")
		};

		var text;
		
		switch(th.attr("data-tsort-type")){
			
			case "number" : text = parseFloat($(this).text().replace(/[,]/g, ".").replace(/[^0-9\.\-]/g, ""));break;
			case "date" : try{text = new Date($(this).text()).getTime();}catch(err){text = 0};break;
			
			case "date-br" : 
			
				if($(this).text().match(/[0-9\/]+[\s]+[0-9]+[:]/g)) //Datetime
					text = ($(this).text().split(" ")[0].split("/").reverse().join("-"))+" "+($(this).text().split(" ")[1]);
				else if($(this).text().match(/[0-9]{2}[\/]{1}[0-9]{2}[\/]{1}[0-9]{4}/g))
					text = $(this).text().split("/").reverse().join("-");
				else
					text = 0;

				text = new Date(text).getTime();
				break;
			
			default : text = $(this).text().toLowerCase();
		};
		
		array[array.length-1]["text"] = text;
	});

	/* Ordena as linhas */
	for(var i=0, len1=array.length; i< len1; i++) {

		for(var i2=0, len2=array.length; i2< len2; i2++) {
	
			if((array[i].text < array[i2].text && tsort == "asc") || (array[i].text > array[i2].text && tsort == "desc")) {
			
				temp 		= array[i];
				array[i] 	= array[i2];
				array[i2] 	= temp;
			}
		}
	}

	var tbody = $(th).closest("table").find("tbody");
	
	/* Adiciona as linhas novamente na tabela */
	for(i=0, len=array.length; i< len; i++)
		tbody.append(array[i].obj);
}

	var notFoundMessage = function(table, notfound) {

		if(!notfound.length)
			return;

		if(!table.find("tbody tr:visible").length) {
			fastShow(notfound, "show");
			fastShow(table, "hide");
		} else		
			fastShow(notfound, "hide");
	};

	var fastShow = function(array, type) {

		var leng = array.length;

		for(var i=0; i<leng;i++)
			array[i].style.display = type == "show" ? "" : "none";
	}

	$.fn.tableFilter = function(method) {

		if (methods[method])
			return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
		else if(typeof method === 'object' || !method)
			return methods.init.apply(this, arguments);
		else
			$.error( 'the method ' +  method + ' does not exist on tableFilter' );
	};
})(jQuery);
</script>
</body>
</html>