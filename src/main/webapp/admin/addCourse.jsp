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
			<!-- 设置一个id hidden类型,根据id是否为0判断是插入还是删除 -->
			<input type ="hidden" id="courseId" name="thirdDir.thirdId" value ="">
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>章节名称：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="" placeholder=""
						id="name" name="thirdDir.name">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>课程描述：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="" placeholder=""
						id="description" name="thirdDir.description">
				</div>
			</div>
		   <div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>所属二级目录：</label>
				<div class="formControls col-xs-8 col-sm-9">
				<span class="select-box" style="width:150px;">
				<select class="select" name="thirdDir.secondId" size="1" id="secondId">
				   <c:forEach items="${secondList}" var="second"> 
					<option value="${second.secondId}">${second.courseName}</option>
			       </c:forEach>
			   </select>
			    </span>
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
	//怎么刷新课程列表
	var userId = ${cuser.userId}; 
		$(function(){
			$('.skin-minimal input').iCheck({
				checkboxClass: 'icheckbox-blue',
				radioClass: 'iradio-blue',
				increaseArea: '20%'
			});
			$("#form-admin-add").validate({
				rules:{
					name:{
						required:true,
					},
					description:{
						required:true,
					},
					secondId:{
						required:true,
					},
				},
				onkeyup:false,
				focusCleanup:true,
				success:"valid",
				submitHandler:function(form){
					$(form).ajaxSubmit({
						type: 'post',
						url: "course/addCourse",
						dataType : 'json',
						success: function(data){
							console.log(data);
							if(data.msg =="ok"){
								layer.msg(data.message,{icon:6,time:1000});	
								setTimeout('toList()', 1000);
							}else{
								layer.msg('操作失败!',{icon:5,time:1000});
							}
						},
		                error: function(XmlHttpRequest, textStatus, errorThrown){
							layer.msg('error!',{icon:5,time:1000});
						}
					});
					setTimeout('closeLayer()', 1000);
					//window.parent.location.reload();
				}
			});
		});
		function closeLayer(){
			var index = parent.layer.getFrameIndex(window.name);
			parent.$('.btn-refresh').click();
			parent.layer.close(index);
		}
		function toList() {
			window.location.href="course/showAllCourse";
		}
		//课程管理，各个课程的修改和删除
		//前端显示，三级联动      
	</script>
	</body>
</html>
