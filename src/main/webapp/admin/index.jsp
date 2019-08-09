<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE HTML>
<html>
<head>
<base href="${pageContext.request.contextPath}/"/>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<link rel="stylesheet" type="text/css" href="css/selfInfor.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>后台管理页面</title>
<meta name="keywords" content="H-ui.admin v3.1,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description" content="H-ui.admin v3.1，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body>
<header>
<div class="navbar navbar-fixed-top">
		<div class="container-fluid cl"> <a class="logo navbar-logo f-l mr-10 hidden-xs" href="/aboutHui.shtml">后台管理系统</a> <a class="logo navbar-logo-m f-l mr-10 visible-xs" href="/aboutHui.shtml">H-ui</a> 
			<span class="logo navbar-slogan f-l mr-10 hidden-xs">v2.0</span> 
			<a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
			<nav class="nav navbar-nav">
				<ul class="cl">
					<li class="dropDown dropDown_hover"><a href="javascript:;" class="dropDown_A"><i class="Hui-iconfont">&#xe600;</i> 新增 <i class="Hui-iconfont">&#xe6d5;</i></a>
						<ul class="dropDown-menu menu radius box-shadow">
							<li><a href="javascript:;" onclick="first_add('一级课程添加','admin/addFirstCategory.jsp')"><i class="Hui-iconfont">&#xe616;</i>一级课程</a></li>
							<li><a href="javascript:;" onclick="second_add('二级课程添加','second/getAllFirstCategoryName')"><i class="Hui-iconfont">&#xe687;</i>二级课程</a></li>
							<li><a href="javascript:;" onclick="course_add('课程添加','course/showAllCourse')"><i class="Hui-iconfont">&#xe720;</i>课程</a></li>
					   </ul>
				   </li>
			    </ul>
		    </nav>
		<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
			<ul class="cl">
				<li>管理员</li>
				<li class="dropDown dropDown_hover">
					<a href="javascript:;" class="dropDown_A">${cuser.userName} <i class="Hui-iconfont">&#xe6d5;</i></a>
					<ul class="dropDown-menu menu radius box-shadow">
						<li><a href="javascript:;" onclick="myselfinfo('user/toAdminPersonalCenter?user.userId=${cuser.userId}')">个人中心</a></li>
						<li><a href="user/layout">退出</a></li>
				    </ul>
			   </li>
				<!-- <li id="Hui-msg"> <a href="#" title="消息"><span class="badge badge-danger">1</span><i class="Hui-iconfont" style="font-size:18px">&#xe68a;</i></a> </li> -->
				<li id="Hui-skin" class="dropDown right dropDown_hover"> <a href="javascript:;" class="dropDown_A" title="换肤"><i class="Hui-iconfont" style="font-size:18px">&#xe62a;</i></a>
					<ul class="dropDown-menu menu radius box-shadow">
						<li><a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a></li>
						<li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
						<li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
						<li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
						<li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
						<li><a href="javascript:;" data-val="orange" title="橙色">橙色</a></li>
					</ul>
				</li>
			</ul>
		</nav>
	</div>
</div>
</header>
<aside class="Hui-aside">
<div class="menu_dropdown bk_2">
		<dl id="menu-member">
			<dt><i class="Hui-iconfont">&#xe616;</i> 课程分类管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="first/showAllFirstCategory?currentPage=1" data-title="一级课程列表">一级课程列表</a></li>
					<li><a data-href="second/showAllSecondCategory?currentPage=1" data-title="课程列表">课程列表</a></li>
			   </ul>
		    </dd>
	   </dl>
		<dl id="menu-member">
				<dt><i class="Hui-iconfont">&#xe720;</i> 课程管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
				<dd>
					<ul>
						<li><a data-href="course/showAllCourse?currentPage=1" data-title="章节列表">章节列表</a></li>
						<li><a data-href="course/toUploadVideo" data-title="上传视频">上传视频</a></li>
				   </ul>
			</dd>
		</dl>
	</div>
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
<section class="Hui-article-box">
	<div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
		<div class="Hui-tabNav-wp">
			<ul id="min_title_list" class="acrossTab cl">
				<li class="active">
					<span title="我的桌面" data-href="admin/welcome.jsp">我的桌面</span>
					<em></em></li>
		</ul>
	</div>
		<div class="Hui-tabNav-more btn-group"><a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a></div>
</div>
	<div id="iframe_box" class="Hui-article">
		<div class="show_iframe">
			<div style="display:none" class="loading"></div>
			<iframe scrolling="yes" frameborder="0" src="admin/welcome.jsp"></iframe>
	</div>
</div>
</section>

<div class="contextMenu" id="Huiadminmenu">
	<ul>
		<li id="closethis">关闭当前 </li>
		<li id="closeall">关闭全部 </li>
</ul>
</div>
<!-- <div id="selfInfo" style="display: none;">
		<div class="first">
			<img src="images/06-02.jpg" id="pic"> <label class="userName">简简单单</label>
		</div>
        <div class="second">
                  <label class="desc">  密码：</label>
                  <label class="content">123456</label>
        </div>
        <div class="third">
                  <label class="desc">  账户余额：</label>
                  <label class="content">123456</label>
        </div>
	</div> -->
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/jquery.contextmenu/jquery.contextmenu.r2.js"></script>
<script type="text/javascript">
$(function(){
	/*$("#min_title_list li").contextMenu('Huiadminmenu', {
		bindings: {
			'closethis': function(t) {
				console.log(t);
				if(t.find("i")){
					t.find("i").trigger("click");
				}		
			},
			'closeall': function(t) {
				alert('Trigger was '+t.id+'\nAction was Email');
			},
		}
	});*/
});
function first_edit(url){
	 layer.open({
	        title : "编辑课程",
	        type : 2,
	        content :url,//弹出层页面
	        area: ['500px', '250px'],
	    })
}
 function myselfinfo(url){
	layer.open({
		type: 2,
		title: "个人中心",
		area: ['1000px', '550px'],
		content: url
	});
} 
/*一级分类添加-添加*/
function first_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		area: ['400px', '300px'],
		content: url
	});
	/* layer.full(index); */
}
/*二级课程-添加*/
function second_add(title,url){
	var index = layer.open({
		type: 2,
		 area: ['700px', '400px'],
		title: title,
		content: url
	});
	
}
/*课程-添加*/
function course_add(title,url){
	var index = layer.open({
		type: 2,
		area: ['400px', '300px'],
		title: title,
		content: url
	});
	/* layer.full(index); */
}
</script> 

</body>
</html>