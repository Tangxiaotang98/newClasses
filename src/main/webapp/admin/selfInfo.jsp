<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<base href="${pageContext.request.contextPath}/">
<link href="css/selfInfor.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
</head>
<div class="avator-wapper">
	<div class="avator-mode">
	     <input type="file" name ="myFile.file" id="file" style="display: none;"/> 
		<img class="avator-img"
			src="${userInfor.imgUrl}"
			data-portrait="5d2db0bd0001df4707200716" width="92" height="92">
		<div class="update-avator">
			<p>
				<a  class="js-avator-link">更换头像</a>
			</p>
		</div>
	</div>
</div>
<div class="setting-right">
	<div class="setting-right-wrap wrap-boxes settings">
		<div class="formBox">
			<div id="setting-profile" class="setting-wrap setting-profile">
				<div class="edit-info" style="display: none;">
					<!-- <form class="js-wapper-form">
						<div class="moco-form-group">
							<label for="" class="moco-control-label">昵称：</label>
							<div class="moco-control-input">
								<input type="text" name="nickname" id="nick" autocomplete="off"
									data-validate="require-nick" class="moco-form-control"
									value="花格子彡" placeholder="请输入昵称" />
								<div class="rlf-tip-wrap errorHint color-red"></div>
							</div>
						</div>
						<div class="moco-form-group">
							<label for="" class="moco-control-label">职位：</label>
							<div class="moco-control-input">
								<div class="rlf-tip-wrap errorHint color-red"></div>
							</div>
						</div>
						<div class="moco-form-group wlfg-wrap">
							<label for="" class="moco-control-label">所在地区：</label>
							<div class="moco-control-input profile-address">
								<div class="rlf-tip-wrap errorHint color-red"></div>
							</div>
						</div>
						<div class="moco-form-group wlfg-wrap">
							<label for="" class="moco-control-label h16 lh16">性别：</label>
							<div class="moco-control-input rlf-group rlf-radio-group">
								<label><input type="radio" hidefocus="true" value="0"
									name="sex">保密</label> <label><input type="radio"
									hidefocus="true" value="1" name="sex">男</label> <label><input
									type="radio" hidefocus="true" value="2" checked="checked"
									name="sex">女</label>
								<div class="rlf-tip-wrap errorHint color-red"></div>
							</div>
						</div>
						<div class="moco-form-group wlfg-wrap">
							<label for="" class="moco-control-label">个性签名：</label>
							<div class="moco-control-input">
								<div class="pr">
									<textarea name="aboutme" id="aboutme" rows="5"
										class="noresize js-sign moco-form-control"></textarea>
									<p class="numCanInput js-numCanInput ">还可以输入128个字符</p>
								</div>
							</div>
						</div>
					</form> -->
				</div>
				<div class="common-title">
					个人信息 <a href="javascript: void(0);" class="pull-right js-edit-info">
						<i class="fa fa-edit"></i>编辑
					</a>
				</div>
				<div class="line"></div>
				<div class="info-wapper">
					<div class="info-box clearfix">
						<label class="pull-left">昵称</label>
						<div class="pull-left">${user.userName }</div>
					</div>
					<div class="info-box clearfix">
						<label class="pull-left">地址</label>
						<div class="pull-left">
							<c:if test="${userInfor.address != null}">
							     ${userInfor.address}
							</c:if>
							<c:if test="${userInfor.address == null}">
							       湖南省永州市
							</c:if>
						</div>
					</div>
					<div class="info-box clearfix">
						<label class="pull-left">性别</label>
						<div class="pull-left">
						    <c:if test="${userInfor.sex != null}">
							     ${userInfor.sex}
							</c:if>
							<c:if test="${userInfor.sex == null}">
							     女
							</c:if>
						</div>
					</div>
					<div class="info-box clearfix">
						<label class="pull-left">个性签名</label>
						<c:if test="${userInfor.signature == null}">
						   <div class="pull-left">未设置</div>
						</c:if>
						<c:if test="${userInfor.signature != null}">
						   <div class="pull-left">${userInfor.signature}</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>

	</div>
</div>
<script src="js/jquery.min.js"></script>
<script src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript">
	/* $('div').bind("mouseenter",function() */
	$('.avator-wapper .avator-mode img').bind("mouseover", function() {
		console.log("1111")
		$(".update-avator").css("bottom", "-13px");
	}), $('.avator-wapper .avator-mode img').bind("mouseleave", function() {
		console.log("2222")
		$(".update-avator").css("bottom", "-45px");
	})
	var userId = ${user.userId};
	$(".avator-wapper .avator-mode img").click(function(){
		//直接上传头像
		$("#file").click(); //隐藏了input:file样式后，点击头像就可以本地上传
		$("#file").on("change", function() {
			var formData = new FormData();  
			console.log(this.files[0]);
			formData.append("myFile.file",this.files[0]);
			formData.append("userInfor.userId",userId);
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
	                		$(".avator-wapper .avator-mode img").attr("src",data.src);
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
