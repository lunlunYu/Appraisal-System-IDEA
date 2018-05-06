<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
<%-- contentType指定了服务器响应的HTTP内容的类型，charset指定了服务器以何种编码响应给浏览器 --%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML> 

<html>
<head>
    <base href="<%=basePath%>">
    
    <title>计算机科学与工程学院教师考核系统</title>
	
	<link rel="stylesheet" href="./CSS/Login_alert/2.css" type="text/css">
    <link rel="stylesheet" href="./CSS/Login_alert/3.css" type="text/css">
    <script type="text/javascript" src="./JS/login_alert_1.js"></script>
    <script type="text/javascript" src="./JS/login_alert_2.js"></script>


	<link rel="stylesheet" href="./CSS/Login/login.css" type="text/css"/>
	
	<script type="text/javascript" src="./JS/check.js"></script>

	<!-- display -->
	<link rel="stylesheet" href="./CSS/Login/display-style.css" type="text/css" /> 
	
	<!--  <script type="text/javascript" src="./JS/jquery.min.js"></script>-->

	<script type="text/javascript" src="./JS/coinslider.min.js"></script>

	<!-- display -->
	
	<!-- background -->
	<link rel="stylesheet" href="./CSS/Login/background-style.css" type="text/css" />
	
	<script type="text/javascript" src="./JS/jquery.mkinfinite.js"></script>

	<!-- background -->


</head>
  
<body class="htmleaf-header">


<!-- <header class="htmleaf-header"> -->
	<div class="header">
		计算机科学与工程学院教师考核系统
	</div>

	<div class="block">
		<div class="display">
			<div id="games"> 
				<a href="" target="_blank">
					<img src="./IMAGES/CSE.jpg" alt="Mini Ninjas" /> 
					<span> <b>计算机科学与工程学院</b><br /> SCHOOL OF COMPUTER SCIENCE AND ENGINEERING</span> 
				</a> 				
				<a href="" target="_blank"> 
					<img src="./IMAGES/dog.jpg" alt="Star Wars: The Old Republic" /> 
					<span> <b>Play with Snow</b><br /> dogdogdogdogdog...</span> 
				</a>
			</div> 
		</div>
		
		<div class="login_block">
			<form action="<%=basePath%>LogServlet" method="post" class="login_form">
			类型:<select class="pulldown" name="usertype"> 
			<option value="0">教职工</option> 
			<option value="1">审核员</option>
			<option value="2">管理员</option> 		
			</select> <br/>
			用户:<input type="text" name="username" class="input_username" required><br/>
			密码:<input type="password" name="password" class="input_password" required><br/>
			<input id="test" type="hidden" name="test">
			验证码:<input type="text" name="checkcode" class="inpue_checkcode" required>
			<span class="add phoKey" id="ss" onclick="create_code()"></span>
			<br/>


			<input class="login_button" type="submit" value="登录">
			<a href="dele.jsp" class="forgoten_link" href="">忘记密码</a>
			</form> 
		</div>
	</div>
<!-- </header> -->
<div id="dialog1" title="错误提示框">
  <p id="p1"></p>
</div>
<script>

	$(document).ready(function(){

		/*display*/
		$("#games").coinslider({
			hoverPause: false /*选择器id引入插件coinslider（悬停暂停：否）*/
		});

		/*background*/
		$("body").mkinfinite({
			maxZoom:       1.4,
			animationTime: 4000,
			//imagesRatio:   (960 / 720),
			imagesRatio:   (1080 / 1920),
			isFixedBG:     true,
			zoomIn:        true,
			imagesList:    new Array(
				'IMAGES/bg1.jpg',
				'IMAGES/bg2.jpg',
				'IMAGES/bg3.jpg',
				'IMAGES/bg4.jpg'
			)
		});

	});

	/*登录验证错误提示框*/
	$(function() {
		$( "#dialog1" ).dialog({
	  		autoOpen: false,
	  		show: {
	    	effect: "blind",
	    	duration: 1000
	  		},
	  		hide: {
	    	effect: "explode",
	    	duration: 1000
	  		}
		});
		});
	$(document).ready(function error(){
		var errori ='<%=request.getParameter("error")%>';
		if(errori==2){
			$("#dialog1").dialog("open");
			document.getElementById("p1").innerHTML="验证码错误！！！";
		}
		else if(errori==5){
			document.getElementById("p1").innerHTML="账号密码错误！！！";
			$( "#dialog1" ).dialog("open");
		}
	});
</script>




