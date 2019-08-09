<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.request.contextPath}/" />
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>首页</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />

<link rel="stylesheet" type="text/css" href="css/header.css" />
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="css/index.css" />
<link rel="stylesheet" type="text/css" href="css/figure.css" />
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>
	<div id="myCarousel" class="carousel slide">
		<!-- 轮播（Carousel）指标 -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
			<li data-target="#myCarousel" data-slide-to="3"></li>
			<li data-target="#myCarousel" data-slide-to="4"></li>
			<li data-target="#myCarousel" data-slide-to="5"></li>
		</ol>
		<!-- 轮播（Carousel）项目 -->
		<div class="carousel-inner">
			<div class="item active">
				<img src="img/slider-01.jpg" alt="First slide">
			</div>
			<div class="item">
				<img src="img/slider-02.jpg" alt="Second slide">
			</div>
			<div class="item">
				<img src="img/slider-03.jpg" alt="Third slide">
			</div>
			<div class="item">
				<img src="img/slider-04.jpg" alt="Fourth slide">
			</div>
			<div class="item">
				<img src="img/slider-05.jpg" alt="Fifth slide">
			</div>
			<div class="item">
				<img src="img/slider-06.jpg" alt="Sixth slide">
			</div>
		</div>
		<!-- 轮播（Carousel）导航 -->
		<a class="carousel-control left" href="#myCarousel" data-slide="prev">
			<i class="fa fa-angle-left"></i>
		</a> <a class="carousel-control right" href="#myCarousel"
			data-slide="next"> <i class="fa fa-angle-right"></i>
		</a>
	</div>
	<div id="tour">
	<c:forEach items="${firstList}" var="first" varStatus="status">
	    <section class="center">
			<h2><i class="fa fa-skyatlas"></i>${first.name } <i class="fa fa-skyatlas"></i></h2>
		</section>
		<c:forEach items="${list}" var="item" begin="${status.index}" end="${status.index}">
		 <!-- 显示三个二级课程 -->
		 <c:forEach items="${item}" var="second" begin="0" end="2">
			<figure>
			 <a href="course/toShowCourse?thirdDir.secondId=${second.secondId}">
				<img src="${second.imgUrl}" alt="${second.courseName}">
				<figcaption>
					<h4>${second.courseName}</h4>
					 <div class="info">
						<em class="sat">收藏&nbsp;&nbsp;<i class="fa fa-star"></i></em> <span class="price">讲师：${second.teacherName}
						</span>
					</div> 
					<div class="type">${second.courseType }</div>
				</figcaption>
			</a>
			</figure>
			</c:forEach>
		</c:forEach>
	</c:forEach>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
