<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.request.contextPath}/" />
<meta charset="UTF-8">
<title></title>
<style type="text/css">
#pic {
	width: 100px;
	height: 100px;
	border-radius: 50%;
	cursor: pointer;
}

body {
	margin: 10% 10%;
}
</style>
<title>上传头像</title>
</head>
<body>
	<form id='form1'>
		<input type="hidden" name="good.businessId" id="businessId" /> <input
			id="upload" name="file" accept="image/*" type="file"
			style="display: none;" /> <br> <img id="pic" src="${business1.imgUrl}">  
		<!-- 放一张默认头像 -->
		 
	</form>

	<script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
		var businessId = ${cbusiness.businessId};
		$(function() {
			$("#pic").click(function() {
				$("#upload").click(); //隐藏了input:file样式后，点击头像就可以本地上传
				$("#upload").on("change", function() {
					/* var objUrl = this.files[0]; //获取图片的路径
					$("#pic").attr("src", this.files[0]); //将图片路径存入src中，显示出图片 */
					imgPreview(this);
					var formdata = new FormData();
					console.log(this.files[0]);
					//data有问题
					formdata.append("myFile",this.files[0]);
					formdata.append("fileFileName",this.files[0].name);
					formdata.append("fileContentType",this.files[0].type);
					formdata.append("business.businessId", businessId);
					$.ajax({
						type : "post",
						url : "user/upImage",
						data : formdata,
						dataType : "json",
						processData : false, 
						// 告诉jQuery不要去设置Content-Type请求头
						contentType : false,
						success : function(data) {
							alert(data.msg);
						}

					})

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
				var img = document.getElementById("pic");
				//图片路径设置为读取的图片
				img.src = e.target.result;
			};
			reader.readAsDataURL(file);
		}

		/*    $(function() {
			$("#pic").click(function() {
				$("#upload").click(); //隐藏了input:file样式后，点击头像就可以本地上传
				$("#upload").on("change", function() {
					var objUrl = getObjectURL(this.files[0]); //获取图片的路径，该路径不是图片在本地的路径
					console.log(objUrl);
					if (objUrl) {
						$("#pic").attr("src", objUrl); //将图片路径存入src中，显示出图片
						$.ajax({
							type:"post",
							url:"good/upImage",
							data:{
								"good.businessId":businessId
							},
							dataType:"json",
							success:function(data){
								alert(data);
							}
						})
					}
					
				});
			});
		});
		//建立一個可存取到該file的url
		function getObjectURL(file) {
			var url = null;
			if (window.createObjectURL != undefined) { //basic
				url = window.createObjectURL(file);
			} else if (window.URL != undefined) { //mozilla(firefox) 
				url = window.URL.createObjectURL(file);
			} else if (window.webkitURL != undefined) { //webkit or chrome
				url = window.webkitURL.createObjectURL(file);
			}
			return url;
		} */

		//注意  form 提交  时 input 的name 命名 要与后台接的字段一样  隐藏元素  用type ="hidden"  存储
	</script>
</body>
</html>