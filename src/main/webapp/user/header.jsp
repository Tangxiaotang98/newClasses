<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.request.contextPath}/"/>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="css/bootstrap.min.css"> -->
<link rel="stylesheet" type="text/css" href="css/header.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
</head>
<body>
<div class="header-area">
		<div class="header-top">
			<div class="container">
				<div class="row">
					<div class="col-lg-8  col-md-8 col-sm-8 hidden-xs">
						<div class="logo col-lg-5  col-md-5 col-sm-5 hidden-xs">
						   <img alt="创新学堂" src="img/logo.png">
						    <!--   创新学堂 -->
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 hidden-xs">
							<div class="search-area">
							    <form action="show/toSearch">
							        <input type="text" name ="secondCategory.courseName"/>
							        <button type="submit"><i class="fa fa-search"></i></button>
							    </form>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-4">
						<div class="top-right text-right">
							<ul>
								<li class="index" onclick=""><a href="show/toIndex">首页</a></li>
								<li class="course"><a href="show/toShow">课程</a>
								<c:if test="${cuser != null }">
									<li class="self-info"><a href="javascript:;">${cuser.userName}<i
											class="fa fa-angle-down"></i></a>
										<ul class="dropdown-links">
											<li><a href="user/toPersonalCenter?user.userId=${cuser.userId}">个人中心</a></li>
											<li><a href="user/layout">安全退出</a></li>
										</ul></li>
								</c:if>
								<c:if test="${cuser == null }">
									<li class="login" onclick=""><a href="login.jsp">登录</a>
									</li>
									<li class="register"><a href="register.jsp">注册</a></li>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
</div>
<script type="text/javascript">
$('.header-area .header-top .container .row .self-info').click(function() {
	var ul = this.getElementsByTagName('ul')[0];
	if (ul.className == 'dropdown-links') {
		ul.classList.add('active');
	} else {
		ul.classList.remove('active');
	}
})
$(".header-top .search-area form input[type='text']").focus(function(){
	$(".header-top .search-area form button").css("backgroundColor","#39ADD1");
	$(".header-top .search-area form button").css("color","#ffffff");
	//没有生效
	$(".header-top .search-area form input[type='text']").css({"border-bottom":"1px solid #000000"});
})
$(".header-top .search-area form input[type='text']").blur(function(){
	$(".header-top .search-area form button").css("backgroundColor","#ffffff");
	$(".header-top .search-area form button").css("color","#555")
	$(".header-top .search-area form input[type='text']").css({"border-bottom":"1px solid #000000"});
})
document.addEventListener("scroll", function() {
				var topScroll = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop; //滚动的距离,距离顶部的距离;浏览器兼容问题
				var header_bottom = document.querySelector(".header-area .header-top"); //获取bottom元素
				if(topScroll > 60) {
					header_bottom.classList.add('stick');
				} else {
					header_bottom.classList.remove('stick');
				}
			});
</script>
</body>
</html>