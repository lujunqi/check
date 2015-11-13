/**
* 主工作区的侧边缩放
*/

// current page


// init sidebar
function initSide() {
	var $obj = $('.sidebar .sideNav');
	var $sl = $('.sublist', $obj);
	var $st = $sl.prev('.subtit');
	$sl.hide();
	$st.find('a').append('<em class="spread">&nbsp;</em>');
	var $sprshr = $('.spread', $obj);
	
	$st.toggle(function() {
		$(this).find('.spread').addClass('shrink');
		//$('.sublist', $obj).slideUp(300);
		$(this).next('.sublist').slideDown(300);
		return false;
	}, function(){
		$(this).find('.spread').removeClass('shrink');
		//$('.sublist', $obj).slideUp(300);
		$(this).next('.sublist').slideUp(300);
		return false;
	});
}
// show or hide sidebar
function switchBar() {
	$('.sidebar').after('<a id="sideSwitcher" class="sideSwitcher" href="#" title="收缩侧边栏">&lt;</a>');
	var $switchBtn = $('#sideSwitcher');
	$switchBtn.click(function() {
		$('body').toggleClass('hideSide');
		
		if( $('body').hasClass('hideSide') ) {
			$switchBtn.text('>').attr('title', '打开左边管理菜单')
		}
		else {
			$switchBtn.text('<').attr('title', '打开左边管理菜单');
		}
	});
    return false;
}
// resize content area
function resizeContent() {
	var winH = $(window).outerHeight();
	var topH = $('#header').outerHeight();
	var btmH = $('#footer').outerHeight();
    var framH = winH-topH-btmH;
    $('.sidebar').height(framH);
    $('.content').height(framH);
    $('.mainFrame').height(framH);
}
// comTablList 

function showLoader() {
		$.blockUI({
			message: "<p class='ajaxLoader'><image src='images/loader/loader_00_32.gif' /><span>加载中...</span></p>",
			css:{
				width: '150px',
                left: ($(window).width() - 150) /2 + 'px',
				padding: '15px',
				border: 'none;',
				backgroundColor: '#000',
				'-webkit-border-radius': '3px',
				'-moz-border-radius': '3px',
				'border-radius': '3px',
				opacity: 0.8,
				'filter': 'alpha(opacity=80)'		
			},
			showOverlay: true,
			overlayCSS: {
				backgroundColor: '#fff',
				opacity: 0,
				'filter': 'alpha(opacity=0)'			
			}
		}); 
}
$(window).resize(function(e) {
	resizeContent();
});
$(document).ready(function(e) {
	resizeContent();
	initSide();
	switchBar();
	checkAll();
	//initComTablist();
});

// checkAllBox
function bindCheck($obja, $objb) {
	if ($obja.attr('checked') == 'checked') {
		$objb.attr('checked', 'checked');
	}
	else {
		$objb.removeAttr('checked');
	}		
}
function checkAll() {	
	$('#cbCheckAll').click(function() {
		bindCheck($(this), $('#cbSelectAll'));
		$('#cbSelectAll').click();
		bindCheck($(this), $('#cbSelectAll'));		
	});
	// checkAll
	$('#cbSelectAll').click(function() {
		bindCheck($('#cbSelectAll'),$(this));
		if ($(this).attr('checked') == 'checked') {
			$('[name="tabCheck"]').attr('checked', 'checked');
		}
		else {			
			$('[name="tabCheck"]').removeAttr('checked');
		}
		bindCheck($(this), $('#cbCheckAll'));
	});
}


$(document).ready(function(e) {
    $('.uploader').each(function(index, element) {
		var $uploader = $(this);
		var $path = $('.path', $uploader);
		var $file = $('.file', $uploader);
		$file.change(function() {
			var filePath = $(this).val().split('\\');;
			$path.val(filePath[filePath.length-1]);
		})
    });	
});