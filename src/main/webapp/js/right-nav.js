
$(function () {
    $(".leftNav-item li").hover(function (e) {
        $(this).children("div").remove();
    });
    $(window).scroll(function () {
        var scrollTop = $(document).scrollTop();
        if (scrollTop >= 200) {
            $(".for-top").show();
        } else {
            $(".for-top").hide();
        }
    });
    $(".for-top").click(function () {
        $('html,body').animate({
            scrollTop: 0
        }, 700);
    })
})