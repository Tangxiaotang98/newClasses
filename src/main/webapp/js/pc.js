$(document).ready(function(){
			 $(".container .menu .ulmenu").click(function(){
				 var index = $(".container .menu .ulmenu").index(this);
				 console.log(index);
				 li = $(".container .menu .ulmenu").eq(index).find("li");
				 li_a = $(".container .menu .ulmenu").eq(index).find("li a");
				 li.click(function(){
						var index=$(this).index();
						li_a.removeClass("selected");
						li_a.eq(index).addClass("selected").siblings().removeClass("selected");
						
					});
			 })

			$(function(){            //ul/li的折叠效果
				$(".menu > ul").eq(0).show();
				 $(".menu h3").click(function(){
				 		//找menu对应的tab
				 		$(".menu_tab > div").removeClass("active");

				 		var val=($(this).next().attr('class'));
				 		var menu_value=(val.substring(val.length-1));
				 		$(".container .content .menu"+menu_value+" .tab:first-child").addClass("active");
				 		$(".container .menu .ulmenu"+menu_value+" li>a").removeClass("selected");
				 		$(".container .menu .ulmenu"+menu_value+" li a").eq(0).addClass("selected");//默认设置为被选中状态
				 		

				 		// $("."+"val").child().child().("selected")
				 		
				 			//这是ul收缩效果
				            $(this).next().stop().slideToggle();
				            $(this).siblings().next("ul").stop().slideUp();
							
				           // if($(".container .ulmenu"+menu_value+" li ").find("a").attr("class")==="selected"){
				           // 		$(".container .content .menu"+menu_value+" .tab:first-child")
				           // }
			            });

			});
			
			$(function(){   // 导航 >
				 $(".container .menu > h3").click(function(){

				 	$(".container .content .A1").empty().text($(this).text());
				 	
				 });
			});
		});



