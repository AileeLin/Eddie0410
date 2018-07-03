$(function(){
	$(".tnbutton.follow").tooltip();
	$(".tnbutton.follow").unbind("click.follow").bind("click.follow",function(){
		var me = this, gp = $(me).parent(".follow_btn_group"),
			isfollowed = $(me).hasClass("unfollow"),mid=gp.attr("data-target_mid"),mnick=gp.attr("data-target_mnick");
		if($("#userid").val()>0){
			if($(me).hasClass("doing")) return;
			$(me).addClass("doing");
			$.ajax({
        		type: 'POST',
        		url: site_path + "member/" + (isfollowed?'unfollow':'follow'),
        		data: {following_id: mid},
        		success: function(data) {
					$(me).removeClass("doing");
                    if( data == 1 ){
                		$(me).addClass("displaynone").siblings(".follow").removeClass("displaynone");
                        $('#follower_cnt_'+mid).html(parseInt($('#follower_cnt_'+mid).html())+(isfollowed?-1:1));			
						createToast('success','您'+(isfollowed?'取消關注':'關注了')+mnick+'。');
                    }else if(data == 0){ 
                		$(me).addClass("displaynone").siblings(".follow").removeClass("displaynone");
    				}else{
    					alert(data);
    				}
        		},
          	   error: function(data) { 
					$(me).removeClass("doing");            		
               }
        	});
		}else{
    		$('#form_signin').submit();
    	}
	});
});