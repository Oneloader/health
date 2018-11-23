
if(navigator.userAgent.indexOf('Android') > 0){
	$(function(){
		var box = $('#globalNav')[0];
		var touchStartPositionX;
		var touchStartPositionY;
		var touchMovePositionX;
		var touchMovePositionY;
		var moveFarX;
		var moveFarY;
		var startScrollX;
		var startScrollY;
		var moveScrollX;
		var moveScrollY;
	
		box.addEventListener("touchstart",touchHandler,false);
		box.addEventListener("touchmove",touchHandler,false);
	
		function touchHandler(e){
			var touch = e.touches[0];
			if(e.type == "touchstart"){
				touchStartPositionX = touch.pageX;
				touchStartPositionY = touch.pageY;
				//タッチ前スクロールをとる
				startScrollX = $('#globalNav').scrollLeft();
				startScrollY = $('#globalNav').scrollTop();
			}
			if(e.type == "touchmove"){
				e.preventDefault();
				//現在の座標を取得
				touchMovePositionX = touch.pageX;
				touchMovePositionY = touch.pageY;
				//差をとる
				moveFarX = touchStartPositionX - touchMovePositionX;
				moveFarY = touchStartPositionY - touchMovePositionY;
				//スクロールを動かす
				moveScrollX = startScrollX +moveFarX;
				moveScrollY = startScrollY +moveFarY;
				$('#globalNav').scrollLeft(moveScrollX);
				$('#globalNav').scrollTop(moveScrollY);
			}
		}
	});
}

$(function(){
	$('#headMenu a').pageslide({ direction: 'left'});
	$('#headMenu a').on('click', function(){
		$('#wrapper').toggleClass('on');
		$('body').toggleClass('on');
	});
	$('#wrapper').on('click', function(){
		$('#wrapper').removeClass('on');
		$('body').removeClass('on');
		jQuery.pageslide.close();
	});
});

function windowSize() {
	return $(window).width();
}

if ((navigator.userAgent.indexOf('Android') > 0 && navigator.userAgent.indexOf('Mobile') > 0) || navigator.userAgent.indexOf('iPod') > 0 || (navigator.userAgent.indexOf('iPhone') > 0 && navigator.userAgent.indexOf('iPad') == -1)) {
}else{
	function sp_navi(){
		if (windowSize() > 768){
		}
		else{
			$('#wrapper').removeClass('on');
			$('body').removeClass('on');
			jQuery.pageslide.close();
		}
	}
	$(function() {
		sp_navi()
	});
	
	jQuery(window).resize(function(){
		sp_navi()
	});
	
	window.onresize = function() {
		$('#wrapper').removeClass('on');
		$('body').removeClass('on');
		$('body').css('margin-left','0');
		$('#pageslide').css('display','none');
	}

}
