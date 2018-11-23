
/* slider
*****************************************/
$(function(){
	$('.mainImages .slide').bxSlider({
		auto: true,
		mode:'fade',
		speed: 500,
		pause: 5000,
		pager: true,
		controls: false
	});
	$('.tabArea01 .slide').bxSlider({
		auto: false,
		speed: 500,
		infiniteLoop: true,
		touchEnabled: false
	});
});

if (!_ua.Mobile) {
	$(function(){
		$('.mainImages').addClass('pc');
	});
}

/* tab change
*****************************************/
$(function() {
    $('.jqTabList li:first').addClass('select');
    $('.jqTabList li').css('cursor','pointer');
    $('.jqTabList li').click(function() {
        var num = $('.jqTabList li').index(this);
        $('.jqTabArea').addClass('noneArea');
        $('.jqTabArea').eq(num).removeClass('noneArea');
        $('.jqTabList li').removeClass('select');
        $(this).addClass('select')
    });
});
