
/* accordion
*****************************************/
function accordion(){
	if (jQuery.support.opacity) {
		var ww = jQuery(window).width();
		if (ww < 753){
			if ($('.accordionArea01').is('.open')){
				$('.accordionArea01.open .inner').css('display','block');
			}
			if ($('.accordionArea01').is('.close')){
				$('.accordionArea01.close .inner').css('display','none');
			}
		}
		else{
			$('.accordionArea01 .inner').css('display','block');
		}
	}
}
$(function() {
	accordion()
});

jQuery(window).resize(function(){
	accordion()
});

$(function() {
	$('.hgroup04:not(:animated)').click(function() {
		$(this).toggleClass('select');
		$(this).parent('.accordionArea01').toggleClass('close');
		$(this).parent('.accordionArea01').toggleClass('open');
		$(this).next('.section05 .inner').slideToggle('fast');
	});
});
