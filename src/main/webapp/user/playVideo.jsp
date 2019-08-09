<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.request.contextPath}/" />
<meta charset="UTF-8">
<title>视频播放</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/playVideo.css" />
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="play-center">
		<!--返回课程链接-->
		<h3 class="courseListLink" style="color:#ffffff">
			<a href="course/toShowCourse?thirdDir.secondId=${third.secondId}"><span style="margin-right: 150px">返回课程列表</span></a>
			${third.name}
		</h3>
		<div class="video-area">
			<video src="${video.videoUrl}" controls="controls">
			</video>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>