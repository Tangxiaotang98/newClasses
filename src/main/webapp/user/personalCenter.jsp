<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.request.contextPath}/" />
<meta charset="UTF-8">
<title>个人中心</title>
<link rel="stylesheet" type="text/css" href="css/personalCenter.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="info_setting">
		<div class="info_setting_content">
			<div class="setting_head">个人中心</div>
			<ul>
				<li class="cf"><label class="fl" for="email">登录邮箱</label>
					<div class="item foremail fl">
						<div class="show">
							<span class="default">${user.mail}</span>
							<!-- <a class="hasset" id="test" href="javascript:;">更改</a> -->
						</div>
						<div class="set cf" style="display: none;">
							<form action="/settings/email" method="post" id="email_form">
								<p class="cf name_text">
									<input class="text fl default_infor" type="text" name="email"
										id="email" /> <span class="error fl"></span>
								</p>
								<input class="button fl" type="submit" value="保存" /> <a
									class="fl cancel" id="email_cancel" href="javascript:;">取消</a>
							</form>
						</div>
					</div></li>
				<li class="cf"><label class="fl" for="password">密码</label>
					<div class="item forpassword fl">
						<div class="show">
							<a class="hasset" href="javascript:;">更改密码</a>
							<span class="error fl"></span>
						</div>
						<div class="set cf" style="display: none">
							<form action="user/changePassword" method="post" id="password_form">
								<input type="hidden" name="user.userId" value="${user.userId}">
								<div class="password_item cf">
									<!--[if IE 7]><label for="oldPassword" class="fl">当前密码</label><![endif]-->
									<input class="text fl" type="password" name="user.password"
										id="oldPassword" placeholder="当前密码" required="required"/>
								</div>
								<div class="password_item cf">
									<!--[if IE 7]><label for="newPassword" class="fl">新密码</label><![endif]-->
									<input class="text fl" type="password" name="newPassword"
										id="newPassword" placeholder="新密码" required="required"/>
								</div>
								<div class="password_item cf">
									<!--[if IE 7]><label for="confirmPassword" class="fl">确认新密码</label><![endif]-->
									<input class="text fl" type="password" name="confirmPassword"
										id="confirmPassword" placeholder="确认新密码" required="required"/>
									<span class="error fl"></span>
								</div>
								<input class="button fl" type="button" value="保存" /> <a
									class="fl cancel" href="javascript:;">取消</a>
							</form>
						</div>
					</div></li>
				<li class="cf"><label class="fl" for="nickname">昵称</label>
				<!-- 昵称更改的时候还要唯一性验证 -->
					<div class="item forname fl">
						<div class="show">
							<span class="default">${user.userName}</span> 
							<!-- <a class="hasset" id="test" href="javascript:;">更改</a> -->
						</div>
						<div class="set cf" style="display: none;">
							<form action="/settings/nickname" method="post"
								id="nickname_form">
								<p class="cf name_text">
									<input class="text fl default_infor" type="text"
										name="nickname" id="nickname" /> <span class="error fl"></span>
								</p>
								<input class="button fl" type="submit" value="保存" /> <a
									class="fl cancel" id="nickname_cancel" href="javascript:;">取消</a>
							</form>
						</div>
					</div></li>

				<li class="cf"><label class="fl" for="gender">性别</label>
					<div class="item forgender fl">
						<div class="sex">
							<a id="modify_male" href="javascript:;"
								class="switch_button switch_button_left" onclick="updateSex(this,'男')">男</a> <a
								id="modify_famale" href="javascript:;"
								class="switch_button switch_button_right" onclick="updateSex(this,'女')">女</a>
						</div>
					</div></li>
				<li class="cf"><label class="fl" for="intro">一句话介绍</label>
					<div class="item forintro fl">
						<div class="show">
							<p class="default">${userInfor.signature}</p>
							<a class="hasset" href="javascript:;">更新</a>
						</div>
						<div class="set cf" style="display: none">
							<form action="/settings/brief" method="post"
								id="introduction_form">
								<input hidden="type" name ="userInfor.userId" value="${userInfor.userId}" />
								<div class="textarea">
									<textarea id="textarea_intro" class="default_infor"
										name="userInfor.signature"></textarea>
									<!-- 	<input class="text fl default_infor" type="text" name=""
										id="" /> -->
								</div>
								<input class="button fl" type="button" value="保存" /> <a
									class="fl cancel" href="javascript:;">取消</a> <span
									class="limit">还可以输入<strong class="intro_limit">255</strong>字
								</span>
							</form>
						</div>
					</div></li>

				<li class="cf"><label class="fl" for="location">居住地</label>
					<div class="item forlocation fl">
						<div class="show">
						<p class="default">${userInfor.address}</p>
						 <a class="hasset"
								id="test" href="javascript:;">填写常居地</a>
						</div>
						<div class="set cf" style="display: none;">
							<form action="/settings/location" method="post"
								id="location_form">
								<input hidden="type" name ="userInfor.userId" value="${userInfor.userId}" />
								<p class="cf name_text">
									<input class="text fl default_infor" type="text" name="userInfor.address"
										id="address" />
								</p>
								<input class="button fl" type="button" value="保存" /> <a
									class="fl cancel" id="location_cancel" href="javascript:;">取消</a>
							</form>
						</div>
					</div></li>
				<li class="cf last"><label class="fl" for="avatar">头像</label>
					<div class="item foravatar fl">
						<form class="cf" action="/settings/avatar/crop" id="imageForm"
							method="post">
							<input type="hidden" name="userInfor.userId" value="${user.userId}"/>
							<div class="show cf">
								<div class="avatar_now fl">
								    <input type="file" name ="myFile.file" id="file" style="display: none;"/> 
									<c:if test="${userInfor.imgUrl == null}">
									   <img src="img/iconfont-huojianfeisu.png" width="120" height="120" alt="花格子彡" id="pic"/>
									</c:if>
									<c:if test="${userInfor.imgUrl != null}">
										<img src="${userInfor.imgUrl}" width="120"
										height="120" alt="花格子彡" id="pic"/>
									</c:if>
									<div id="avatar_upload" class="upload-img">点击图片可更新头像</div>
									<div id="uploadMessage"></div>
								</div>
								<span class="tip fl">上传支持JPG、PNG、BMP格式，最大支持5M 最佳头像尺寸为
									120x120 像素</span>
							</div>
						</form>
					</div></li>

			</ul>
		</div>
		<!-- <div class="wrap_down"></div> -->
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	<script src="js/jquery.min.js"></script>
	<script src="lib/layer/2.4/layer.js"></script>
	<script>
	var userId = ${user.userId};
	        //点击更新
			$(".show").click(function(){
				var index = $(".show").index(this);
				$(".set.cf").eq(index).css("display","block");
			})
			//点击取消
			$(".fl.cancel").click(function(){
				var index = $(".fl.cancel").index(this);
				$(".set.cf").eq(index).css("display","none");
				$(".set.cf").eq(index).find("input[type='text']").val("");
				$(".set.cf").eq(index).find("input[type='password']").val("");
				$(".set.cf").eq(index).find("textarea").val("");
			})
			//更新性别
			function updateSex(obj,sex){
				$.ajax({
				    type: "POST",//方法类型
	                dataType: "json",//预期服务器返回的数据类型
	                url: "user/updateUserInfor" ,//url
	                data: {
	                	"userInfor.sex":sex,
	                	"userInfor.userId":userId
	                },
	                success: function (data) {
	                	if(data.msg =="更新成功"){
	                		layer.msg('更新成功!',{icon:6,time:1000});
	                	}else{
	                		layer.msg('更新失败!',{icon:5,time:1000});
	                	}
				    }
				})
			}
			//提示还可输入多少个字
	        $("#textarea_intro").keyup(function() {
	        	var inputLength = $("#textarea_intro").val().length;
	        	//最多输入255个字
				var limit = 255 - inputLength;
				$(".intro_limit").html(limit);
			})
			//个性签名
			$("#introduction_form input[type='button']").click(function() {
				$.ajax({
				    type: "POST",//方法类型
	                dataType: "json",//预期服务器返回的数据类型
	                url: "user/updateUserInfor" ,//url
	                data: $("#introduction_form").serialize(),
	                success: function (data) {
	                	if(data.msg =="更新成功"){
	                		layer.msg('更新成功!',{icon:6,time:1000});
	                	}else{
	                		layer.msg('更新失败!',{icon:5,time:1000});
	                	}
	                	$(".item.forintro.fl .set.cf").css("display","none");
                		$(".item.forintro.fl textarea").val("");
				    }
				})
			})
			//更新地址
			$("#location_form input[type='button']").click(function() {
				$.ajax({
				    type: "POST",//方法类型
	                dataType: "json",//预期服务器返回的数据类型
	                url: "user/updateUserInfor" ,//url
	                data: $("#location_form").serialize(),
	                success: function (data) {
	                	if(data.msg =="更新成功"){
	                		layer.msg('更新成功!',{icon:6,time:1000});
	                	}else{
	                		layer.msg('更新失败!',{icon:5,time:1000});
	                	}
	                	$(".item.forlocation.fl .set.cf").css("display","none");
                		$(".item.forlocation.fl input").val("");
				    }
				})
			})
			//隐藏邮箱的中间几位
			$(function() {
			    var mail = $('.item.foremail.fl .show .default').html();
			    var nmail = mail.substr(0, 3) + '****' + mail.substr(7);
			    $('.item.foremail.fl .show .default').text(nmail);
			})
			//验证修改密码操作
			$("#confirmPassword").blur(function(){
				//验证两次密码输入是否相同
				var newPassword =$("#newPassword").val();
				var confrimPassword = $("#confirmPassword").val();
				//总是跳入不相等
				if(newPassword == confrimPassword){
		           console.log("两次密码相等");
				}else{
					$("#password_form .password_item.cf").eq(2).find("span").html("两次密码输入不一致，请重新输入！");
					$("#password_form .password_item.cf").eq(2).find("span").css("color","red");
					$("#confirmPassword").val("");
				}
			})
			//提交更改密码
			$("#password_form input[type='button']").click(function(){
				$.ajax({
		            //几个参数需要注意一下
		                type: "POST",//方法类型
		                dataType: "json",//预期服务器返回的数据类型
		                url: "user/changePassword" ,//url
		                data: $('#password_form').serialize(),
		                success: function (data) {
		                    console.log(data);//打印服务端返回的数据(调试用)
		                    if(data.msg =="修改成功"){
		                    	alert("Abc");
		                    	$(".item.forpassword.fl .show span").html("修改成功！");
		    					$(".item.forpassword.fl .show span").css("color","green");
		                    }else{
		                    	$(".item.forpassword.fl .show span").html("修改失败！");
		    					$(".item.forpassword.fl .show span").css("color","red");
		    					/* $(".item.forpassword.fl .set.cf").css("display","none");
		    					cleanAllInput();
		    					setTimeout('MessageDisable()', 1000);//让提示信息1s后消失 */
		                    }
		                    $(".item.forpassword.fl .set.cf").css("display","none");
	    					cleanAllInput();
	    					setTimeout('MessageDisable()', 1000);//让提示信息1s后消失
		                },
		                error : function() {
		                    alert("异常！");
		                }
		            });
			})
			function MessageDisable() {
				$(".item.forpassword.fl .show span").html("");
			}
			//清空修改密码中输入框的信息
			function cleanAllInput(){
				$("#newPassword").val("");
				$("#confirmPassword").val("");
				$("#oldPassword").val("");
				
			}
			//上传头像
			$("#pic").click(function() {
					$("#file").click(); //隐藏了input:file样式后，点击头像就可以本地上传
					$("#file").on("change", function() {
						var form = $('#imageForm')[0];  
						var formData = new FormData(form);  
						console.log(this.files[0]);
						$.ajax({
				            //几个参数需要注意一下
				                type: "POST",//方法类型
				                dataType: "json",//预期服务器返回的数据类型
				                url: "user/changeImage" ,//url
				                data: formData,
				                processData : false, 
								// 告诉jQuery不要去设置Content-Type请求头
								contentType : false,
				                success: function (data) {
				                	if(data.msg =="更新成功"){
				                		layer.msg('更新成功!',{icon:6,time:1000});
				                		$("#pic").attr("src",data.src);
				                	}else{
				                		layer.msg('更新失败!',{icon:5,time:1000});
				                	}
				                },
				                error : function() {
				                    alert("异常！");
				                }
						})
					});
			})
		</script>
</body>
</html>
