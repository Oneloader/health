var page = 0;
var bypage = 10; //15件
var topPosition = $("div.container").offset().top;
if(location.hash.indexOf('#pageby')>-1){bypage=parseInt(location.hash.split('#pageby')[1]);} //URLの最後に#pageby3と指定すると１ページ3件となる
var maxPage = $('.searchList').size()/bypage;
$(document).ready(function() {

	$('.priorityTr').each(function(index, element) {
		$(this).insertBefore('.searchList:not(.priorityTr):eq(0)');
	});
	//左メニュークリックで絞り込み
	//$('.asideListHead a, .asideList01 li.all a').click(function(){ //左メニュー「全て」クリック
	$('.asideList01 li.all a').click(function(){ //左メニュー「全て」クリック
		$('.asideList01 li a').removeClass('on');
		$(this).addClass('on');
		$('.searchList').removeClass('catHide'); //全て表示
		resetPage(); //先頭のページにする
		return false;
	});
	$('.asideList01 li:not(.all) a, .asideList02 li a').click(function(){ //左メニュー・左バナークリック
		var cat = $(this).attr('rel'); //console.log(cat);
		$('.asideListHead a').removeClass('on');
		$('.asideList01 li a').removeClass('on');
		$(this).addClass('on');
		$('.searchList').addClass('catHide'); //カテゴリ絞り込みで隠すcatHide
		$('.searchListBody .'+cat).removeClass('catHide'); //メニューの#と同じclass名を持つ.searchListをshow
		resetPage(); //先頭のページにする
		return false;
	});

	//ソート
	$('.searchListHead .up a, .searchListHead .down a').on('click',function(){ //console.log($(this));
		if(!$(this).hasClass('sort_on')){
			$('.searchListHead .up a, .searchListHead .down a').removeClass('sort_on');
			$(this).addClass('sort_on');
			var tgt ='';		
			var type ='text';
			var order ='asc';
			if($(this).parent().parent().hasClass('col02')){ tgt='.col03 .img,.col03 .img_special'; }
			if($(this).parent().parent().hasClass('col03')){ tgt='.col04 .text'; }
			if($(this).parent().parent().hasClass('col04')){ tgt='.col05 .text02'; type='num'; }
			if($(this).parent().parent().hasClass('col05')){ tgt='.col06 .text02'; }
			if($(this).parent().parent().hasClass('col06')){ tgt='.col07 .text02'; type='num'; }
			if($(this).parent().parent().hasClass('col07')){ tgt='.col08 .text02'; type='num'; }
			if($(this).parent().hasClass('down')){ order='desc'; }
			sortTr(tgt,type,order);
			paging();
		}
		return false;
	});
	
	//ページング初期処理
	for (var i=1; i<maxPage; i++){ //ページャーの数字をmaxPage分書き出し
		var pagenum = i+1;
		$('.pagination ul').append('<li><a>'+pagenum+'</a></li>');
	}
	resetPage();
	
	//ページャーのイベントハンドラ
	$('.pagination .prev a').click(function() {
		if(page>0){ 
			page--; 
			paging(); 
			$("html,body").animate({scrollTop:topPosition},{queue:false,duration:30}); 
		}
	});
	$('.pagination .next a').click(function() {
		if (page < maxPage - 1){ 
			page++; 
			paging(); 
			$("html,body").animate({scrollTop:topPosition},{queue:false,duration:30}); 
		}
	});
	$(document).on('click','.pagination ul li a',function() {
		page = $('.pagination ul li a').index(this);
		paging();
	    $("html,body").animate({scrollTop:topPosition},{queue:false,duration:30});
	});

});
function sortTr(tgt,type,order){ //ソート
	resetPage();
	$(".searchListBody").html(
		$(".searchList").sort(function(a, b) { 
			var a_val = $(a).find(tgt).text();
			var b_val = $(b).find(tgt).text();
			if(type=='num'){
				a_val = parseInt(a_val.replace(/[^\d\-\.\/]/g,""));
				b_val = parseInt(b_val.replace(/[^\d\-\.\/]/g,""));
			}
			if(order=='desc'){ //console.log('d');
				//return a_val < b_val ? 1 : -1;
				//return a_val > b_val ? -1 : 1;
				//return b_val - a_val;
		    	if( a_val < b_val ) return 1;
		        if( a_val > b_val ) return -1;
				return 0;
			}else{ //console.log('a');
				//return a_val > b_val ? 1 : -1;
				//return a_val < b_val ? -1 : 1;
				//return a_val - b_val;
		    	if( a_val > b_val ) return 1;
		        if( a_val < b_val ) return -1;
				return 0;
			}
		})
	);
}
function resetPage(){ //ページング
    page=0;
	maxPage = $('.searchList:not(.catHide)').size()/bypage; //console.log(maxPage);
	if(maxPage>1){ $('.pagination').show(); }else{ $('.pagination').hide(); } //maxPage>1だったらページャー出す
	//ページャーの数字をmaxPage分書き出し
	$('.pagination ul li').hide();
	for (var i=0; i<maxPage; i++){
		$('.pagination ul li').eq(i).show();
	}
	paging();
}
function paging(){ //ページング
	if($('.aside01').css('float')=='none'){
		$('body,html').animate({scrollTop:0},0);
	}
    $('.searchList').addClass('pageHide'); //ページャーで隠す=pageHide
	var entStart = page*bypage;
	var entEnd = (page+1)*bypage;
	for(i=entStart; i<entEnd; i++){
		$('.searchList:not(.catHide)').eq(i).removeClass('pageHide'); 
	}
	$('.pagination ul li').removeClass('current');
	$('.pagination ul li').eq(page).addClass('current');
}
