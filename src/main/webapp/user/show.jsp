<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${pageContext.request.contextPath}/" />
<meta charset="UTF-8">
<title>课程显示界面</title>
<script src="js/jquery-latest.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link rel="stylesheet" type="text/css" href="css/stylepc.css">
</head>
<body>
	<div class="container">
		<div class="menu">
                <c:forEach items="${firstList}" var="first" varStatus="status">
                    <h3><i class="q-menu-img positionIicon"></i>${first.name}</h3>
                     <ul class="ulmenu">
                    </ul> 
                     <input type="hidden" class="firstCategoryId" value="${first.firstId}">
                </c:forEach>
		</div>

		<div class="content">
			<div class="get-menu">
				<a href="#">帮助中心</a> <span>></span> <a class="A1" href="#">常见问题</a>
			</div>
			<div class="menu1 menu_tab">
				<div id="tab">
					<div id="tour">
						<figure>
							<img src="img/tour1.jpg" alt="曼谷-芭提雅6日游">
							<figcaption>
								<strong>&lt;曼谷-芭提雅6日游&gt</strong>
								包团特惠，超丰富景点，升级1晚国五，无自费，更赠送600元/成人自费券
								<div class="info">
									<em class="sat">满意度 77%</em> <span class="price">￥ <strong>2864</strong>起
									</span>
								</div>
								<div class="type">国内长线</div>
							</figcaption>
						</figure>
						<figure>
							<img src="img/tour1.jpg" alt="曼谷-芭提雅6日游">
							<figcaption>
								<strong>&lt;曼谷-芭提雅6日游&gt</strong>
								包团特惠，超丰富景点，升级1晚国五，无自费，更赠送600元/成人自费券
								<div class="info">
									<em class="sat">满意度 77%</em> <span class="price">￥ <strong>2864</strong>起
									</span>
								</div>
								<div class="type">国内长线</div>
							</figcaption>
						</figure>
						<figure>
							<img src="img/tour1.jpg" alt="曼谷-芭提雅6日游">
							<figcaption>
								<strong>&lt;曼谷-芭提雅6日游&gt</strong>
								包团特惠，超丰富景点，升级1晚国五，无自费，更赠送600元/成人自费券
								<div class="info">
									<em class="sat">满意度 77%</em> <span class="price">￥ <strong>2864</strong>起
									</span>
								</div>
								<div class="type">国内长线</div>
							</figcaption>
						</figure>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script  src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/pc.js"></script>
	<script type="text/javascript">
	$(".container .menu > h3").click(function(){
	    	// alert("adfsfafa");
	    	 var index = $(".container .menu > h3").index(this);
	    	 //console.log(index);
	    	 var firstCategoryId = $(".firstCategoryId").eq(index).val();
	    	// console.log(firstCategoryId);
	    	  $.ajax({
	    		 url:"show/getAllSecondCategoryByFirstId",
	    		 data:{
	    			 "secondCategory.firstId":firstCategoryId
	    		 },
	    		 method:"post",
	    		 dataType:"json",
	    		 success:function(data){
	    			 //console.log(data);
	    			 //给ul加class
	    			 //console.log(data.secondList.length);
	    			 var ulList = $("ul").eq(index);
	    			// console.log(ulList);
	    			//没有内容的时候，再请求ajax
	    			 if($("ul").eq(index).children().length == 0){
	    				 for(var i=0; i<data.secondList.length; i++){
		    				 //怎么设置
		    				//console.log(data.secondList[i].courseName);
		    				 if(i==0){
		    					 $("ul").eq(index).append($('<li><a href="" class="selected">'+data.secondList[i].courseName+'</a></li>'));
		    				 }else{
		    					 $("ul").eq(index).append($('<li><a href="">'+data.secondList[i].courseName+'</a></li>'));
		    				 }
		    			 }
	    			 }
	    		 }
	    	 }) 
	     })
	  
	</script>
</body>
</html>
