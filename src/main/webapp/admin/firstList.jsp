<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="Bookmark" href="/favicon.ico">
<link rel="Shortcut Icon" href="/favicon.ico" />
<title>商家页面</title>
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
	<link rel="stylesheet" type="text/css"
	href="css/page.css" />
<!--[if IE 6]>
		<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
		<script>DD_belatedPNG.fix('*');</script>
		<![endif]-->
</head>
<body>
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
		商品管理 <span class="c-gray en">&gt;</span>一级课程列表 <a
			class="btn btn-success radius r"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<div class="page-container">
		<div class="text-c">
			<form action="first/showAllFirstCategory" method="post">
				<input type="text" class="input-text" style="width: 250px"
					placeholder="输入一级课程分类名称" id="" name="firstCategory.name">
				<button type="submit" class="btn btn-success" id="" name="">
					<i class="Hui-iconfont">&#xe665;</i> 搜分类
				</button>
			</form>
		</div>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20">
		<span class="l"> <!-- <a href="javascript:;" onclick="datadel()"
			class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i>
				批量删除</a> --> <a href="admin/addFirstCategory.jsp"
			class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i>
				添加分类</a>
		</span> <span class="r">共有数据：<strong>${total}</strong> 条
		</span>
	</div>
	<table class="table table-border table-bordered table-bg">
		<thead>
			<tr>
				<th scope="col" colspan="9">一级课程列表</th>
			</tr>
			<tr class="text-c">

				<th width="25"><input type="checkbox" name="" value=""></th>
				<th width="40">编号</th>
				<th width="150">一级分类名称</th>
				<th width="150">描述</th>
				<th width="100">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${firstList}" var="first" varStatus="status">
				<tr class="text-c">
					<td><input type="checkbox" value="2" name=""></td>
					<td>${status.index+1+pageSize*(currentPage-1)}</td>
					<td>${first.name}</td>
					<td>${first.description}</td>
					<td class="td-manage">
					  <a style="text-decoration: none"
						onClick="first_edit('first/getFirstCategoryById?firstCategory.firstId=${first.firstId}')" href="javascript:;"
						title="编辑"><i class="Hui-iconfont">&#xe60c;</i></a>
						<a
						style="text-decoration: none" class="ml-5"
						onClick="first_del(this,'${first.firstId}')" href="javascript:;"
						title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="pagingArea">
          <a>第${currentPage}页&nbsp;&nbsp;<a>共${totalPage}页</a>&nbsp;&nbsp;</a>
          <a href="first/showAllFirstCategory?currentPage=${currentPag-1}">上一页</a>&nbsp;&nbsp;
          <a href="first/showAllFirstCategory?currentPage=${currentPage+1}">下一页</a>
	</div>
	<!--_footer 作为公共模版分离出去-->
	<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
	<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
	<!--/_footer 作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript"
		src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
	<script type="text/javascript">
		/*产品-增加*/
		/* function product_add(title, url, w, h) {
			layer_show(title, url, w, h);
		} */
		function first_edit(url){
			 layer.open({
			        title : "编辑课程",
			        type : 2,
			        content :url,//弹出层页面
			        area: ['500px', '250px'],
			    })
       }
		/*产品-删除*/
		function first_del(obj, id) {
			layer
					.confirm(
							'确认要删除吗？',
							function(index) {
								$
										.ajax({
											type : 'POST',
											url : 'first/deleteFirstCategory',
											data : {
												"firstCategory.firstId" : id
											},
											dataType : 'json',
											success : function(data) {
												console.log(data)
												if (data.msg == "ok") {
													$(obj).parents("tr")
															.remove();
													layer.msg('已删除!', {
														icon : 1,
														time : 1000
													});
													setTimeout(
															function() {
																window.location.href = "first/showAllFirstCategory";
															}, 1000);
												}

											},
											error : function(data) {
												console.log(data.msg);
											},
										});
							});
		}
	
	
	</script>
</body>
</html>
