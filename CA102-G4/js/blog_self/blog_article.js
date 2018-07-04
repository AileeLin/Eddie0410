$(document).ready(function () {

    $(".col-4 > div.ui.basic.buttons > button:nth-child(2)").click(function () {
        if ($(".collection").css('font-weight') == 900) {
            $(".collection").css('font-weight', '400');
            $(".collection").css('color', 'black');
        } else {
            $(".collection").css('font-weight', '900');
            $(".collection").css('color', 'red');
        }
    });

});
