
var _ua = (function(){
	return {
		ltIE8:typeof window.addEventListener == "undefined" && typeof document.getElementsByClassName == "undefined",
		ltIE9:document.uniqueID && !window.matchMedia,
		gtIE10:document.uniqueID && document.documentMode >= 10,
		Trident:document.uniqueID,
		Gecko:'MozAppearance' in document.documentElement.style,
		Blink:window.chrome,
		Mobile:typeof window.orientation != "undefined",
		Webkit:!window.chrome && 'WebkitAppearance' in document.documentElement.style,
	}
})();

/* breadcrumb
*****************************************/
$(function($) {
    $(function(){
	var $setElm = $('.breadcrumb em');
	var cutFigure = '45';
	var afterTxt = ' …';

	$setElm.each(function(){
		var textLength = $(this).text().length;
		var textTrim = $(this).text().substr(0,(cutFigure))

		if(cutFigure < textLength) {
			$(this).html(textTrim + afterTxt).css({visibility:'visible'});
		} else if(cutFigure >= textLength) {
			$(this).css({visibility:'visible'});
		}
	});
});
});


/* accordion
*****************************************/
$(function(){
	$('.jqAccordionBtn').hover(function(){
		$(this).css('cursor','pointer');
	},function(){
		$(this).css('cursor','pointer');
	});
	$('.jqAccordionBtn:not(:animated)').click(function(){
		$(this).toggleClass('select');
		$(this).next('.jqAccordionArea').slideToggle('fast');
	});
});


/* header global navi
*****************************************/
$(function () {
	$('#globalNav li:nth-child(2)').css('background','none');
});


/* image change
*****************************************/
function responsiveImg(){
	if (!_ua.ltIE8) {
		var ww = jQuery(window).width();
			if (ww < 753 && _ua.Blink){
				$('.imgChange').each(function(){
					var str = $(this).attr('src');
					if(str.indexOf('s.')==-1){
						str = str.replace(/\.\w+$/, 's' + '$&');
						$(this).attr('src',str);
					}
				});
			}
			else if (ww < 768 && _ua.Webkit && !_ua.Mobile){
				$('.imgChange').each(function(){
					var str = $(this).attr('src');
					if(str.indexOf('s.')==-1){
						str = str.replace(/\.\w+$/, 's' + '$&');
						$(this).attr('src',str);
					}
				});
			}
			else if (ww < 751 && _ua.Gecko){
				$('.imgChange').each(function(){
					var str = $(this).attr('src');
					if(str.indexOf('s.')==-1){
						str = str.replace(/\.\w+$/, 's' + '$&');
						$(this).attr('src',str);
					}
				});
			}
			else if (ww < 751 && _ua.Trident && !_ua.ltIE8){
				$('.imgChange').each(function(){
					var str = $(this).attr('src');
					if(str.indexOf('s.')==-1){
						str = str.replace(/\.\w+$/, 's' + '$&');
						$(this).attr('src',str);
					}
				});
			}
			else if (ww < 751 && _ua.Mobile){
				$('.imgChange').each(function(){
					var str = $(this).attr('src');
					if(str.indexOf('s.')==-1){
						str = str.replace(/\.\w+$/, 's' + '$&');
						$(this).attr('src',str);
					}
				});
			}
			else{
				$('.imgChange').each(function(){
					var str = $(this).attr('src');
					str = str.replace('s.','.');
					$(this).attr('src',str);
				});
			}
		}
}
$(function() {
	responsiveImg()
});

$(window).on('load resize', function(){
	responsiveImg()
});


/*	hover
*****************************************/
$(function () {
	$('.hover img').hover(function(){
		$(this).stop().fadeTo('fast',0.6);
	},function(){
		$(this).stop().fadeTo('fast',1.0);
	});
	$('.hover input[type=image]').hover(function(){
		$(this).stop().fadeTo('fast',0.6);
	},function(){
		$(this).stop().fadeTo('fast',1.0);
	});
});


/*	rollover
*****************************************/
$(function(){
	$('.rollover').hover(function(){
		var str = $(this).attr('src');
		if(str.indexOf('on.')==-1){
			str = str.replace(/\.\w+$/, 'on' + '$&');
			$(this).attr('src',str);
		}
	},function(){
		var str = $(this).attr('src');
		str = str.replace('on.','.');
		$(this).attr('src',str);
	});
	
	$('.rollover').mousedown(function(){
		var str = $(this).attr('src');
		if(str.indexOf('on.')==-1){
			str = str.replace(/\.\w+$/, 'on' + '$&');
			$(this).attr('src',str);
		}
	}).mouseup(function(){
		var str = $(this).attr('src');
		str = str.replace('on.','.');
		$(this).attr('src',str);
	});
	
	var _imgArray = new Array();
	for(var i = 0 ; i < $('.rollover').length ; i++){
		var _str = $('.rollover').eq(i).attr('src');
		_str= _str.replace('.','on.');
		_imgArray.push(_str);
	}
	function loopImageLoader(i){
		var image1 = new Image();
		image1.src = _imgArray[i];
		image1.onload = function(){
			i++;
			if(_imgArray.length != i){
				//alert('nextnum : ' + i);//debug
				loopImageLoader(i);
			}
		}
	}
});

/*	smooth scroll
*****************************************/
$(function(){
    $('a[href^="#"]').not('#headMenu a').click(function(event) {
        var id = $(this).attr("href");
        var offset = 0;
        var target = $(id).offset().top - offset;
        $('html, body').animate({scrollTop:target}, 500);
        event.preventDefault();
        return false;
    });
});
