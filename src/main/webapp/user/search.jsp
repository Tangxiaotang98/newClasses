<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.request.contextPath}/" />
<meta charset="UTF-8">
<title>搜索</title>
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="css/search.css"/>

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
		<div id="main">
			<div class="search-main">
				<div class="search-header">
					<div class="search-form">
						<form action="show/toSearch" method="post">
							<i class="fa fa-search"></i>
							<input type="text" class="search-form-ipt js-search-ipt" value="${words }" placeholder="请输入想搜索的内容" name="secondCategory.courseName"/>
							<button class="search-form-btn js-search-btn" type="submit">搜索</button>
						</form>
					</div>
					<ul class="search-hot">
						<li class='fli'>热搜关键词：</li>
						<c:forEach items="${keyList}" var="key">
						    <li><a href="show/toSearch?secondCategory.courseName=${key.content}" target="_blank">${key.content}</a></li>
						</c:forEach>
					</ul>
				</div>
				<div class="search-tab">
					<div class="main-tabbar">
						<ul>
							<li><a href="javascript:;" data-page="index" class="active">全站结果<sup>(${total })</sup></a></li>
							<li><a href="javascript:;" data-page="content">课程内容<sup>(56)</sup></a></li>
						</ul>
					</div>
				</div>
				<div class="search-body">
					<div class="search-content">
						<div class="search-classify clearfix">
							<ul class="search-classify-list clearfix">
								<li><a href="javascript:;" data-page="all" class='active'>全部</a></li>
							</ul>
							<span class="search-related js-all-count">共找到 <em>${total}</em> 个相关内容</span>
						</div>
						<div class="search-course-list">
						 <c:forEach items="${secondList}" var="second">
							<div class="course-item" data-search-weight='100'>
								<a href="course/toShowCourse?thirdDir.secondId=${second.secondId}"
								 target="_blank" class='course-detail-title js-recommend-statistics' data-rid='8'>
									<img src="${second.imgUrl}" class="course-item-img" />
								</a>
								<div class="course-item-detail">
									<a href="course/toShowCourse?thirdDir.secondId=${second.secondId}"
									 target="_blank" class='course-detail-title js-recommend-statistics' data-rid='8'>
										<!-- <span class="highlight">java</span>工程师 -->
										${second.courseName}
									</a>
									<p>${second.description}</p>
									<div class="course-item-recommend-classify">
										<span>组合套餐 总时长183小时</span>
									</div>
								</div>
							</div>
						 </c:forEach>
						</div>
						<div class="search-recommend">
							<h3>热门课程推荐</h3>
							<ul class="moco-aside-course">
							<c:forEach items="${commendList}" var ="commend">
								<li>
									<div class="aside-course-img">
										<img src="${commend.imgUrl}" alt="${commend.courseName}">
										<p class="aside-course-type">实战</p>
									</div>
									<div class="aside-course-content">
										<a href="course/toShowCourse?thirdDir.secondId=${commend.secondId}" target="_blank" class="aside-course-name">${commend.courseName}</a>
										<p class="aside-course-price">
											￥179.00
										</p>
										<div class="aside-course-dot">
											<i class="imv2-dot_samll"></i>
										</div>
										<p class="aside-course-grade">${commend.status}</p>
										<div class="aside-course-dot">
											<i class="imv2-dot_samll"></i>
										</div>
										<p class="aside-course-people">
											<i class="imv2-set-sns"></i>
											<span>1220</span>
										</p>
									</div>
								</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>
			</div>
	</body>
	<jsp:include page="footer.jsp"></jsp:include>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript">
		$(".main-tabbar ul li").click(function(){
			var index = $(".main-tabbar ul li").index(this);
			var obj = $(".main-tabbar ul li").eq(index);
			$(".main-tabbar ul li").eq(index).siblings().find("a").removeClass("active");
			$(".main-tabbar ul li").eq(index).find("a").addClass("active");
		})
	    //高亮显示搜索关键字
	   /*  $(".search-form-ipt.js-search-ipt").click(function () {
	    	  $(".search-form-ipt.js-search-btn").click();
	    	highlight();
		}) */
		highlight();
        function encode(s){
    		return s.replace(/&/g,"&").replace(/</g,"<").replace(/>/g,">").replace(/([\\\.\*\[\]\(\)\$\^])/g,"\\$1");
    	}
    	function decode(s){
    		return s.replace(/\\([\\\.\*\[\]\(\)\$\^])/g,"$1").replace(/>/g,">").replace(/</g,"<").replace(/&/g,"&");
    	}
    	function highlight(s){
    		var s= $(".search-form-ipt.js-search-ipt").val();
    		console.log(s);
    		if (s.length==0){
    			alert('搜索关键词未填写！');
    			return false;
    		}
    		s=encode(s);
    		var obj=document.getElementsByClassName("search-body")[0];
    		var t=obj.innerHTML.replace(/<span\s+class=.?highlight.?>([^<>]*)<\/span>/gi,"$1");
    		obj.innerHTML=t;
    		var cnt=loopSearch(s,obj);
    		t=obj.innerHTML
    		console.log(t);
    		var r=/{searchHL}(({(?!\/searchHL})|[^{])*){\/searchHL}/g
    		t=t.replace(r,"<span class='highlight'>$1</span>");
    		obj.innerHTML=t;
    	}
    	function loopSearch(s,obj){
    		var cnt=0;
    		if (obj.nodeType==3){
    			cnt=replace(s,obj);
    			return cnt;
    		}
    		for (var i=0,c;c=obj.childNodes[i];i++){
    			if (!c.className||c.className!="highlight")
    				cnt+=loopSearch(s,c);
    		}
    		return cnt;
    	}
    	function replace(s,dest){
    		var r=new RegExp(s,"g");
    		var tm=null;
    		var t=dest.nodeValue;
    		var cnt=0;
    		if (tm=t.match(r)){
    			cnt=tm.length;
    			t=t.replace(r,"{searchHL}"+decode(s)+"{/searchHL}")
    			dest.nodeValue=t;
    		}
    		return cnt;
        }
    </script>
  </html>
