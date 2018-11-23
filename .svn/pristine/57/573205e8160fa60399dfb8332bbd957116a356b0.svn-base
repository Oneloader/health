
/* aside list
*****************************************/
$(function () {
	$('.asideList01 li:last-child').addClass('last');
});


if (!_ua.Mobile) {
	$(function(){
		$('.asideListHead').addClass('pc');
	});
}

$(function(){
	$('#jqBtn').click(function () {
		$('#jqBtn .ic').toggleClass('on');
		$('#jqAsideList:not(:animated)').slideToggle('fast');
	});
});

function searchNavi(){
	if (jQuery.support.opacity) {
		var ww = $(window).width();
		if (ww < 960){
			if ($('#jqBtn .ic').is('.on')){
				$('#jqAsideList').css('display','none');
				$('#jqBtn .ic').removeClass('on');
			}
			else {
				$('#jqAsideList').css('display','none');
			}

			$('#jqAsideList li a:not(:animated)').click(function () {
				var txt = $(this).text();
				$(this).each(function(){
					$('#jqBtn .ic').removeClass('on');
					
					$('#jqAsideList li').removeClass('active');
					$(this).parent('li').addClass('active');
					$('#jqChangeTxt').text(txt);
					$('#jqAsideList').css('display','none');
					return false;
				});
			});
		}
		else {
			$('#jqAsideList').css('display','block');

			$('#jqAsideList li a:not(:animated)').click(function () {
				var txt = $(this).text();
				$(this).each(function(){
					$('#jqBtn .ic').removeClass('on');
					$('#jqAsideList li').removeClass('active');
					$(this).parent('li').addClass('active');
					$('#jqChangeTxt').text(txt);
					$('#jqAsideList').css('display','block');
					return false;
				});
			});
		}
	}
}
$(function() {
	searchNavi()
});

$(window).resize(function(){
	searchNavi()
});




/* accordion
*****************************************/
function accordion_list(){
	if (jQuery.support.opacity) {
		var ww = jQuery(window).width();
		if (ww < 753){
			$('.accordionList li:nth-child(even)').css('border-right','none');
			$('.accordionList li').tile(2);
		}
		else{
			$('.accordionList li:nth-child(even)').css('border-right','#3A3E47 solid 1px');
			$('.accordionList li:nth-child(4n+4)').css('border-right','none');
			$('.accordionList li').tile(4);
		}
	}
	else {
			$('.accordionList li:nth-child(4n+4)').css('border-right','none');
			$('.accordionList li').tile(4);
	}
}
$(window).load(function() {
	accordion_list()
});
jQuery(window).resize(function(){
	accordion_list()
});

$(function(){
	$('.jqAccordionBtn').click(function () {
		if (jQuery.support.opacity) {
			var ww = jQuery(window).width();
			if (ww < 753){
				$('.accordionList li').tile(2);
			}
			else{
				$('.accordionList li').tile(4);
			}
		}
		else {
			$('.accordionList li').tile(4);
		}
	});
});
