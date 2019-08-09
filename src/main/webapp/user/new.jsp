<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<base href="${pageContext.request.contextPath}/" />
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>首页</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet"
	href="http://jrain.oscitas.netdna-cdn.com/tutorial/css/fontawesome-all.min.css">
<link rel="stylesheet" type="text/css" href="css/htmleaf-demo.css">
<link rel="stylesheet" type="text/css" href="css/header.css">
<!--演示页面样式，使用时可以不引用-->
<link rel="stylesheet" href="css/new.css">
<link rel="stylesheet" href="css/figure.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="htmleaf-container">
	<div class="demo">
			<div class="container">
				<div class="row">
					<div class="vertical-tab" role="tabpanel">
						<!-- Nav tabs -->
						<ul class="nav nav-tabs" role="tablist">
							<c:forEach items="${firstList}" var="first" varStatus="status">
								<c:if test="${status.index == 0 }">
									<li role="presentation" class="active"><a href=""
										aria-controls="home" role="tab" data-toggle="tab">${first.name}</a></li>
									<input type="hidden" class="firstCategoryId"
										value="${first.firstId}">
								</c:if>
								<c:if test="${status.index != 0 }">
									<li role="presentation"><a href="" aria-controls="home"
										role="tab" data-toggle="tab">${first.name}</a></li>
									<input type="hidden" class="firstCategoryId"
										value="${first.firstId}">
								</c:if>
							</c:forEach>
						</ul>
						<!-- Tab panes -->
						<div class="tab-content tabs">
							<div class="get-menu">
								<h3 class="A1">常见问题</h3>
							</div>
							<div id="tour">
								<c:forEach items="${secondList}" var="second">
								   <a href="course/toShowCourse?thirdDir.secondId=${second.secondId}">
									<figure>
										<img src="${second.imgUrl}" alt="${second.courseName}">
										<figcaption>
											<h4>${second.courseName}</h4>
											<div class="info">
												<em class="sat">收藏&nbsp;&nbsp;<i class="fa fa-star"></i></em> <span class="price">讲师：${second.teacherName}
												</span>
											</div>
											<div class="type">${second.courseType}</div>
										</figcaption>
									</figure>
									</a>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	<script src="js/jquery.min.js" type="text/javascript"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(".vertical-tab ul li")
				.click(
						function() {
							var index = $(".vertical-tab ul li").index(this);
							// console.log(index);
							var firstCategoryId = $(".firstCategoryId").eq(index).val();
							var courseName = $(".vertical-tab ul li a").eq(index).html();
							$(".get-menu .A1").empty().text(courseName);
							console.log(firstCategoryId);
							$
									.ajax({
										url : "show/getAllSecondCategoryByFirstId",
										data : {
											"secondCategory.firstId" : firstCategoryId
										},
										method : "post",
										dataType : "json",
										success : function(data) {
											console.log(data);
											$(".tab-content.tabs #tour").empty();
											if ($(".tab-content.tabs #tour").eq(index).children().length == 0) {
												for (var i = 0; i < data.secondList.length; i++) {
													$(".tab-content.tabs #tour")
															.append(
																	'<a href="course/toShowCourse?thirdDir.secondId='+data.secondList[i].secondId+'"><figure><img src="'+data.secondList[i].imgUrl+'"alt="'+data.secondList[i].courseName+'"><figcaption><h4>'
																			+ data.secondList[i].courseName
																			+ '</h4><div class="info"><em class="sat">收藏&nbsp;&nbsp;<i class="fa fa-star"></i></em><span class="price"><strong>讲师：'+data.secondList[i].teacherName+'</strong></span></div><div class="type">'+data.secondList[i].courseType+'</div></figcaption></figure></a>');
												}
											}
										}
									})
						})
		$(document).ready(function(){
			var firstCourseName = $(".vertical-tab ul li.active").text();
			console.log(firstCourseName);
			$(".get-menu .A1").empty().text(firstCourseName);
		})
	
	/* $('.header-area .header-top .container .row .self-info').click(function() {
		var ul = this.getElementsByTagName('ul')[0];
		if (ul.className == 'dropdown-links') {
			ul.classList.add('active');
		} else {
			ul.classList.remove('active');
		}
	}) */
</script>
</body>
</html>