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
<link rel="stylesheet" href="css/page.css">
<!--[if IE 6]>
		<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
		<script>DD_belatedPNG.fix('*');</script>
		<![endif]-->
</head>
<body>
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
		商品管理 <span class="c-gray en">&gt;</span>课程列表 <a
			class="btn btn-success radius r"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<div class="page-container">
		<div class="text-c">
			<form action="second/showAllSecondCategory" method="post">
				<input type="text" class="input-text" style="width: 250px"
					placeholder="输入二级课程分类名称" id="" name="secondCategory.courseName">
				<button type="submit" class="btn btn-success" id="" name="">
					<i class="Hui-iconfont">&#xe665;</i> 搜分类
				</button>
			</form>
		</div>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20">
		<span class="l"> <!-- <a href="javascript:;" onclick="datadel()"
			class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i>
				批量删除</a> --> <a href="second/getAllFirstCategoryName"
			class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i>
				添加课程</a>
		</span> <span class="r">共有数据：<strong>${total}</strong> 条
		</span>
	</div>
	<table class="table table-border table-bordered table-bg">
		<thead>
			<tr>
				<th scope="col" colspan="11">课程列表</th>
			</tr>
				<tr class="text-c">
				<th width="25"><input type="checkbox" name="" value=""></th>
				<th width="40">编号</th>
				<th width="150">课程名称</th>
				<th width="150">课程地址</th>
				<th>课程图片</th>
				<th width="90">老师姓名</th>
				<th width="150">课程类型</th>
				<th width="150">二级分类id</th>
				<th width="150">课程描述</th>
				<th width="90">课程阶段</th>
				<th width="100">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${secondList}" var="second" varStatus="status">
				<tr class="text-c">
					<td><input type="checkbox" value="2" name=""></td>
					<td>${status.index+1+pageSize*(currentPage-1)}</td>
					<td>${second.courseName}</td>
					<td>${second.courseUrl}</td>
					<td><img width="210" class="picture-thumb" src="${second.imgUrl }"></td>
					<td>${second.teacherName}</td>
					<td>${second.courseType}</td>
					<td>${second.firstId}</td>
					<td>${second.description}</td>
					<td>${second.status}</td>
					<td class="td-manage">
						<a style="text-decoration: none"
							onClick="second_edit('second/getSecondCategoryById?secondCategory.secondId=${second.secondId}')"
							href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe60c;</i></a>
						<a style="text-decoration: none" class="ml-5"
						onClick="second_del(this,'${second.secondId}')" href="javascript:;"
						title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="pagingArea">
          <a>第${currentPage}页&nbsp;&nbsp;<a>共${totalPage}页</a>&nbsp;&nbsp;</a>
          <a href="second/showAllSecondCategory?userId=${cuser.userId }&currentPage=${currentPag-1}">上一页</a>&nbsp;&nbsp;
          <a href="second/showAllSecondCategory?userId=${cuser.userId }&currentPage=${currentPage+1}">下一页</a>
	</div>
	<!--_footer 作为公共模版分离出去-->
	<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
	<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
	<!--/_footer 作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript" src="js/getParameter.js"></script>
	<script type="text/javascript"
		src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript">
	/* 二级课程编辑 */
	function second_edit(url){
				 layer.open({
				        title : "编辑课程",
				        type : 2,
				        content :url,//弹出层页面
				        area: ['800px', '550px'],
				    })
	   }

		/*二级课程删除*/
		function second_del(obj, id) {
			// var userId = ${cuser.userId};
			layer
					.confirm(
							'确认要删除吗？',
							function(index) {
								$
										.ajax({
											type : 'POST',
											url : 'second/deleteSecondById',
											data : {
												"secondCategory.secondId" :id
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
																window.location.href = "second/showAllSecondCategory";
															}, 1000);
												}

											},
											error : function(data) {
												console.log(data.msg);
											},
										});
							});
		}
		/* var total = ${total};
		totalPage = total/5;
		curPage = 1;
		laypage({cont: "laypage", //容器。值支持id名、原生dom对象，jquery对象。【如该容器为】：<div id="page1"></div>
			       pages: totalPage, //通过后台拿到的总页数
			       curr: curPage, //当前页
			       skin: '#ffc900',//设置当前页样式，可以使用内置皮肤（yahei），也可以直接赋值16进制颜色值，如:#c00
			       groups: 5,//连续显示分页数
			       skip: true,     //是否开启跳页
			       first: '首页',
			       last: '尾页',
			       skin: 'molv',//设置当前页样式，加载内置皮肤，也可以直接赋值16进制颜色值，如:#c00
			       prev: '<', //若不显示，设置false即可
			       next: '>', //若不显示，设置false即可
			       jump: function(obj, first){ //触发分页后的回调
			            //first判断是否第1次切换页码，这里只要不是第1次切换就调用分页获取数据函数获取指定页数据
			            if(!first){ //点击不同页码触发的函数，并传递当前页：obj.curr
			                demo(obj.curr);
			            }
			       }
		}); */
	</script>
</body>
</html>
