$(document).ready(function () {

//    $("img").error(function () {
//    $(this).attr("src", "../images/all/null.png");
//    });
    
    $(".col-4 > div.ui.basic.buttons > button:nth-child(2)").click(function () {
        if ($(".collection").css('font-weight') == 900) {
            $(".collection").css('font-weight', '400');
            $(".collection").css('color', 'black');
        } else {
            $(".collection").css('font-weight', '900');
            $(".collection").css('color', 'red');
        }
    });

    $(window).scroll(function () {
        if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
            $("#myBtn").fadeIn("slow");
        } else {
            $("#myBtn").fadeOut("slow");
        }
    });

    $(".ui.button.reply").click(function(){
        $('html,body').animate({
            scrollTop: $("[name='textareaField']").offset().top
        }, 'slow');
    });
    
    $("#myBtn").click(function () {
        $('html,body').animate({
            scrollTop: 0
        }, 'slow');
    });

    $("#collect").click(function () {
        $("#collectMessage").dialog("open");
    });
    
    $("#collectMessage").dialog({
        autoOpen: false,
        closeOnEscape: false,
        hide: 'blind',
        show: 'blind',
        title: '訊息',
        modal: true,
        width: '150px',
        autofocus: false,
        resizable: false,
        draggable: false,
        buttons: {
            "確定": function () {
            	$(this).dialog("close");
            }
        }
    });
    
    $(".ui.blue.labeled.submit.icon.button").click(function(){
    	$(".ui.reply.form").submit();
    });
    
    $(function () {
    	  $(window).scroll(function () {
    	    var scrollVal = $(this).scrollTop();
    	    $("input[name=scroll]").val(scrollVal);
    	  });
    });

   $(".ui.button.report").click(function(){
	   $("#reportBlogDialog").dialog("open");
   });
   
   $("#reportBlogDialog").dialog({
       autoOpen: false,
       closeOnEscape: false,
       hide: 'blind',
       show: 'blind',
       title: '訊息',
       modal: true,
       width: 500,
       height: 300,
       autofocus: false,
       resizable: false,
       draggable: false,
       buttons: {
           "確定": function () {
           	$(this).dialog("close");
           	$(".ui.report.form").submit();
           },
           "取消": function () {
               $(this).dialog("close");
               $(".reportReasonContent").val("");
           }
       }
   });
   
   $("#reportDialogConfirm").dialog({
       autoOpen: true,
       closeOnEscape: false,
       hide: 'blind',
       show: 'blind',
       title: '訊息',
       modal: true,
       width: 220,
       autofocus: false,
       resizable: false,
       draggable: false,
       buttons: {
           "確定": function () {
           	$(this).dialog("close");
           }
       }
   });
   
   $(".report.message").click(function(){
	   $("#reportBlogMessageId").val($(this).find("input").val());
	   $("#reportMessageDialog").dialog("open");
   });
   
   $("#reportMessageDialog").dialog({
       autoOpen: false,
       closeOnEscape: false,
       hide: 'blind',
       show: 'blind',
       title: '訊息',
       modal: true,
       width: 500,
       height: 300,
       autofocus: false,
       resizable: false,
       draggable: false,
       buttons: {
           "確定": function () {
           	$(this).dialog("close");
           	$(".ui.reportMessage.form").submit();
           },
           "取消": function () {
               $(this).dialog("close");
               $(".reportReasonContent").val("");
           }
       }
   });
   
   $(".delete").click(function(){
	   $("#deleteMyMessage").dialog("open");
	   i = $(this).children("form");
   });
   
   $("#deleteMyMessage").dialog({
		 autoOpen: false,
		 closeOnEscape: false,
		 hide: 'blind',
		 show: 'blind',
		 title: '訊息',
		 modal: true,
		 width: '250px',
		 autofocus: false,
		 resizable: false,
		 draggable: false,
		 buttons: {
		     "確定": function () {
		      $(this).dialog("close");
		      i.submit();
		      },
		      "取消": function () {
		          $(this).dialog("close");
		      }
		 }
	});
   

});





