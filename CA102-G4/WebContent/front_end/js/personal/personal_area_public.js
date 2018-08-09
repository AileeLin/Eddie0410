
// 	 setInterval(function() {
// 		  $("div.chatContext").load(function(){alert("有做")});
// 	  }, 1000); 
	
	//引入個人的部落格資訊，內容太多冗長
	$(function(){
	    var len = 100; // 超過100個字以"..."取代
	    $("._shortText").each(function(i){
	   	 var temptext=$(this).text().trim().replace('  ', '');
	        if(temptext.length>len){
	            $(this).attr("title",temptext);
	            var text=temptext.substring(0,len-1)+"...";
	            $(this).text(text);
	        }
	    });
	});

	$(document).ready(function(){
		//在首頁內容時，按連結增加頁籤移動效果。
		$("#home_right div.u_title a").click(function(){
			var tem = $(this).attr('href');
			$(".nav-item>a").parent().removeClass("active");
			$(".nav-item>a[href='"+tem+"']").parent().addClass("active");
		});
		
		
	});
