<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.request.contextPath}/">
<meta charset="UTF-8">
<title>登录页面</title>
<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<!-- <link rel="shortcut icon" href="favicon.ico"> -->
<!-- <link rel='stylesheet' type='text/css'> -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/style.css">
<script src="js/modernizr-2.6.2.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<!-- Start Sign In Form -->
				<form action="user/login" class="fh5co-form animate-box"
					data-animate-effect="fadeIn" method="post">
					<h2>Sign In</h2>
					<div class="form-group">
						<label for="username" class="sr-only">Username</label> <input
							type="text" name="user.userName" class="form-control"
							id="username" placeholder="Username/Email" required="required" onblur="changeName()">
					</div>
					<div class="form-group">
						<label for="password" class="sr-only">Password</label> <input
							type="password" name="user.password" class="form-control"
							id="password" placeholder="Password" autocomplete="off"
							required="required">
					</div>
					<div class="form-group">
						<label for="remember"><input type="checkbox" id="remember">
							Remember Me</label>
					</div>
					<div class="form-group">
						<p>
							Not registered? <a href="register.jsp">Sign Up</a> | <a
								href="forgot.jsp">Forgot Password?</a>
						</p>
					</div>
					<div class="form-group">
						<input type="submit" value="Sign In" class="btn btn-primary">
					</div>
				</form>
				<!-- END Sign In Form -->
			</div>
		</div>
		<div class="row" style="padding-top: 60px; clear: both;">
			<div class="col-md-12 text-center">
				<p>&copy; All Rights Reserved.</p>
			</div>
		</div>
	</div>

	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Placeholder -->
	<script src="js/jquery.placeholder.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Main JS -->
	<script src="js/main.js"></script>
	<script type="text/javascript">
	   function changeName() {
		    let name = $("#username").val();
		   /*  alert(name.indexOf("@") != -1); */
		    if(name.indexOf("@")!= -1){
		    	$("input[type=text]").attr("name","user.mail");
		    }else{
		    	$("input[type=text]").attr("name","user.userName");
		    }
	   }
	</script>
</body>
</html>