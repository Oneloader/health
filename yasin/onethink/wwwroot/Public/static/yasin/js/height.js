
/* list height
*****************************************/
function height_box(){
	if (jQuery.support.opacity) {
		var ww = jQuery(window).width();
		if (ww < 753){
			$('.list18 li').tile(1);
			$('.height01 li').tile(2);
			$('.height02 li').tile(2);
		}
		else{
			$('.list18 li').tile(3);
			$('.height01 li').tile(4);
			$('.height02 li').tile(4);
		}
	}
	else {
			$('.list18 li').tile(3);
			$('.height01 li').tile(4);
			$('.height02 li').tile(4);
	}
}
$(window).load(function() {
	height_box()
});
jQuery(window).resize(function(){
	height_box()
});

$(function(){
	$('.jqAccordionBtn').click(function () {
		if (jQuery.support.opacity) {
			var ww = jQuery(window).width();
			if (ww < 753){
				$('.height01 li').tile(2);
				$('.height02 li').tile(2);
			}
			else{
				$('.height01 li').tile(4);
				$('.height02 li').tile(4);
			}
		}
		else {
			$('.height01 li').tile(4);
			$('.height02 li').tile(4);
		}
	});
});
