<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册页面</title>
<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<link rel="shortcut icon" href="favicon.ico">

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/style.css">

<!-- Modernizr JS -->
<script src="js/modernizr-2.6.2.min.js"></script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<!-- Start Sign In Form -->

				<form action="user/register" class="fh5co-form animate-box"
					data-animate-effect="fadeIn" method="post">
					<h2>Sign Up</h2>
					<div class="form-group">
						<label class="type">Please choose your role</label>
						<select name="user.privilege">
							<option value="1" class="option">用户</option>
							<option value="2" class="option">管理员</option>
						</select>
					</div>
					<div class="form-group">
						<label for="name" class="sr-only">Enter your UserName</label> <input
							type="text" name="user.userName" onblur="checkUname()"
							class="form-control" id="username" placeholder="Name"
							required="required"> 
					</div>
					<div class="form-group">
						<label for="email" class="sr-only">Enter your email</label> <input
							type="email" name="user.mail" onblur="checkEmail()"
							class="form-control" id="email" placeholder="Email"
							required="required">
					</div>
					<div class="form-group">
						<label for="password" class="sr-only">Enter your Password</label>
						<input type="password" name="user.password" class="form-control"
							id="password" placeholder="Password" autocomplete="off"
							required="required">
					</div>
					<div class="form-group">
						<label for="re-password" class="sr-only">Re-type Password</label>
						<input type="password" class="form-control" id="re-password"
							placeholder="Re-type Password" autocomplete="off"
							required="required" onblur="checkPassword()">
					</div>
					<div class="form-group">
						<p>
							Already registered? <a href="login.jsp">Sign In</a>
						</p>
					</div>
					<div class="form-group">
						<input type="submit" value="Sign Up" class="btn btn-primary">
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
 $(document).ready(function(){
		   var  msg =  '${errorMsg}';
		   if(msg !="" && msg.trim().length != 0){
			   alert(msg);
		   }
	  }) 
		var register_flag = 0;//表示可注册
		function checkUname() {
			let userName = $("input[type='text']").eq(0).val();
			if (userName == "") {
				alert("该用户名不能注册，请重新输入");
				$("input[type=text]").eq(0).val("");
			} else {
				$.ajax({
					url : "user/checkUname",
					data : {
						"user.userName":userName
					},
					dataType : "json",
					method : "post",
					success : function(result) {
						console.log(result);
						register_flag = result.msg_code;
						if (result.msg_code == 1) {
							alert(result.msg);
							$("input[type=text]").eq(0).val("");
						}
					}
				})
			}
		}
		function checkEmail() {
			let email = $("input[type='email']").eq(0).val();
			if (email == "") {
				alert("该邮箱不能注册，请重新输入");
				$("input[type=email]").eq(0).val("");
			} else {
				$.ajax({
					url : "user/checkEmail",
					data : {
						"user.mail":email
					},
					dataType : "json",
					method : "post",
					success : function(result) {
						console.log(result);
						register_flag = result.msg_code;
						if (result.msg_code == 1) {
							alert(result.msg);
							$("input[type=email]").eq(0).val("");
						}
					}
				})
			}
		}
		function check() {
			if (register_flag == 0) {
				return true;
			} else {
				return false;
			}
		}
		function checkPassword() {
			let password = $("input[type=password]").eq(0).val();
			let repassword = $("input[type=password]").eq(1).val();
			console.log(password);
			console.log(repassword);
			if (password != repassword) {
				$("input[type=password]").eq(1).val("");
				alert("两次密码输入不正确，请重新输入");
			}
		}
	</script>
</body>
</html>

