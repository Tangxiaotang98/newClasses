<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.request.contextPath}/" />
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
		<script type="text/javascript" src="lib/html5shiv.js"></script>
		<script type="text/javascript" src="lib/respond.min.js"></script>
		<![endif]-->
<link rel="stylesheet" type="text/css"
	href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/css/style.css" />
<title>添加商品</title>
<meta name="keywords"
	content="H-ui.admin v3.1,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description"
	content="H-ui.admin v3.1，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body>
	<article class="page-container">
		<form class="form form-horizontal" id="form-admin-add">
		    <input type="hidden" name ="secondCategory.secondId" value="${second.secondId}"/>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>课程名称：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" placeholder=""
						id="courseName" name="secondCategory.courseName" value="${second.courseName}">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>课程类型：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text"  placeholder=""
						id="courseType" name="secondCategory.courseType" value="${second.courseType}">
				</div>
			</div>
			<c:if test="${second.imgUrl != null}">
			 <div class="row cl">
				  <label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>封面图片：</label>
				  <div class="formControls col-xs-8 col-sm-9">
				         <input id="file" name="myFile.file" accept="image/*" type="file" style="display: none;" /> 
				         <input  type="hidden" name="secondCategory.imgUrl" value="${second.imgUrl}" id="preImageSrc"/> 
				         <input  type="hidden" name="secondCategory.courseUrl" value="${second.courseUrl}" id="preImageUrl"/> 
				    	<img alt="封面图片" src="${second.imgUrl}" style="width: 300px;height: 200px" id="myPic">
				    	点击图片可切换
				   </div>
			   </div>
			</c:if>
			<c:if test="${second.imgUrl == null}">
			    <div class="row cl">
				  <label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>课程图片：</label>
					<div class="formControls col-xs-8 col-sm-9">
			            <input type="file"  class= "btn btn-default radius " name="myFile.file" id="file" accept="image/*"/>
				    </div>
			    </div>
			</c:if>
		   <div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>所属二级目录：</label>
				<div class="formControls col-xs-8 col-sm-9">
				<span class="select-box" style="width:150px;">
				<select class="select" name="secondCategory.firstId" size="1">
				   <c:forEach items="${firstList}" var="first"> 
					   <c:if test="${first.firstId == second.firstId}">
					      <option value="${first.firstId}" selected="selected">${first.name}</option>
					   </c:if>
					   <c:if test="${first.firstId != second.firstId}">
					      <option value="${first.firstId}">${first.name}</option>
					   </c:if>
			       </c:forEach>
			   </select>
			    </span>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>课程阶段：</label>
				<div class="formControls col-xs-8 col-sm-9">
				<span class="select-box" style="width:150px;">
				<select class="select" name="secondCategory.status" id="status" size="1">
				    <option value="初级">初级</option>
				    <option value="中级">中级</option>
				    <option value="高级">高级</option>
				    <option value="入门">入门</option>
			    </select>
			    </span>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>课程描述</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input  class="input-text"  value="${second.description}" 
						id="description" name="secondCategory.description"/>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>教师名称</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text"  placeholder=""
						id="teacheName" name="secondCategory.teacherName" value="${second.teacherName}"/>
				</div>
			</div>
			<div class="row cl">
				<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
					<input class="btn btn-primary radius" type="submit"
						value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
				</div>
			</div>
		</form>
	</article>
	<!--_footer 作为公共模版分离出去-->
	<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
	<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
	<!--/_footer 作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript"
		src="lib/jquery.validation/1.14.0/jquery.validate.js"></script>
	<script type="text/javascript"
		src="lib/jquery.validation/1.14.0/validate-methods.js"></script>
	<script type="text/javascript"
		src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
	<script type="text/javascript">
	  var userId = ${cuser.userId}; 
		$(function(){
			$('.skin-minimal input').iCheck({
				checkboxClass: 'icheckbox-blue',
				radioClass: 'iradio-blue',
				increaseArea: '20%'
			});
			$("#form-admin-add").validate({
				rules:{
					courseName:{
						required:true,
					},
					courseType:{
						required:true,
					},
					teacheName:{
						required:true,
					},
				},
				onkeyup:false,
				focusCleanup:true,
				success:"valid",
				submitHandler:function(form){
					$(form).ajaxSubmit({
						type: 'post',
						url: "second/addSecondCategory",
						data:{
							"secondCategory.userId":userId
						},
						dataType : 'json',
						success: function(data){
							console.log(data);
							if(data.msg =="ok"){
								layer.msg(data.message,{icon:6,time:1000});	
								setTimeout('toList()', 1000);
							}else if(data.msg =="no"){
								layer.msg('操作失败!',{icon:5,time:1000});
							}
						},
		                error: function(XmlHttpRequest, textStatus, errorThrown){
							layer.msg('error!',{icon:5,time:1000});
						}
					});
					setTimeout('closeLayer()',1000);
				}
			});
		});
		function closeLayer() {
			 var index = parent.layer.getFrameIndex(window.name); 
			 parent.$('.btn-refresh').click();
			parent.layer.close(index); 
		}
		function toList() {
			var userId = ${cuser.userId}
			window.location.href="second/showAllSecondCategory?secondCategory.userId="+userId;
		}
		$(function() {
			$("#myPic").click(function() {
				$("#file").click(); //隐藏了input:file样式后，点击头像就可以本地上传
				$("#file").on("change", function() {
					imgPreview(this);
					$("#preImageSrc").val("");
					$("#preImageUrl").val("");
					//console.log(this.files[0]);
				});
			});
		});
		//预览图片
		 function imgPreview(fileDom) {
			//判断是否支持FileReader
			if (window.FileReader) {
				var reader = new FileReader();
			} else {
				alert("您的设备不支持图片预览功能，如需该功能请升级您的设备！");
			}
			//获取文件
			var file = fileDom.files[0];
			var imageType = /^image\//;
			//是否是图片
			if (!imageType.test(file.type)) {
				alert("请选择图片！");
				return;
			}
			//读取完成
			reader.onload = function(e) {
				//获取图片dom
				var img = document.getElementById("myPic");
				//图片路径设置为读取的图片
				img.src = e.target.result;
			};
			reader.readAsDataURL(file);
		}
    /*  //判断哪一个option被选中
      var status =${secondCategory.status};
     $(document).ready(function(){ 
		   $("#status option[value='status']").attr("selected","selected");
	  })  */
	</script>
	</body>
</html>
