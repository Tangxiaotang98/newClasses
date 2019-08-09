<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.request.contextPath}/" />
<meta charset="UTF-8">
<title>课程界面</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="css/showCourse.css"/>
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css"/>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="container" class="" data-layout-element="container">
		<div id="content" class="topic-html">
			<div class="grid-container">
				<div class="grid-100">
					<div class="hero">
						<div class="hero-meta">
							<div style="width: 75%;">
								<h3>
									<a href="show/toShow" style="color: #fff;">←全部课程</a>
								</h3>
								<h1>${second.courseName}</h1>
								<div class="markdown-zone">
									<p>${second.description}</p>
								</div>
								<ul class="tags large">
									<li><span>${second.status}</span></li>
								</ul>
								<span class="teacherName">${second.teacherName}</span>
								<img alt="HTML基础"
									src="img/ipad_default_2x_cover-html-howtobuildawebsite.png" />
							</div>

						</div>
					</div>

				</div>
				<div class="grid-100 grid-parent">
					<div class="grid-75">
						<div class="featurette" data-featurette="grouped-content-cards">
							<div class="contained featurette"
								data-featurette="expandable-content-card"
								id="beginning-html-and-css">
								<div class="grid-100">
									<div class="achievement-meta">
										<img alt="Beginning HTML and CSS" class="toggle-steps"
											style="width: 63px" src="img/iconfont-huojianfeisu.png" /> 
											<c:forEach items="${courseList}" var="course" varStatus="status" begin="0" end="0">
											<span class="mobile-action"> <!--从第一个视频开始播放-->
										    <c:if test="${cuser != null }">
												<a class="button button-large button-primary" target="_blank"
												href="course/playVideo?thirdDir.thirdId=${course.thirdId}"> 开始学习 </a>
											</c:if>
											 <c:if test="${cuser == null }">
												<a class="button button-large button-primary" target="_blank"
												href="javascript:;" onclick="toLogin()"> 开始学习 </a>
											</c:if>
											</span>
											</c:forEach>
											 <span class="learn_sum">
											<!-- 已学 10 课时 /  --> 总共${totalDir}课时
										</span>
									</div>
									<div class="achievement-steps">
										<ul>
										<c:forEach items="${courseList}" var="course" varStatus="status">
										    <li>
										    <c:if test="${cuser != null }">
										     <a target="_blank" href="course/playVideo?thirdDir.thirdId=${course.thirdId}" > <i
													class="fa fa-play-circle"></i>
													<p>1分33秒</p> <strong>${status.index+1}: ${course.name} &nbsp; <!-- <span
														class="try_watch border-radius-3">试听</span> --></strong>
											</a>
										    </c:if>
										    <c:if test="${cuser == null }">
										     <a target="_blank" href="javascript:;" onclick="toLogin()"> <i
													class="fa fa-play-circle"></i>
													<p>1分33秒</p> <strong>${status.index+1}: ${course.name} &nbsp; <!-- <span
														class="try_watch border-radius-3">试听</span> --></strong>
											</a>
										    </c:if>
										   </li>
										</c:forEach>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
    function toLogin() {
    	    alert("请登录后再观看");
    	    window.location.href="login.jsp";
	}
</script>
</html>