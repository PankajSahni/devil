jQuery(document).ready(function() {
	/* Fix for IE */
    	if (jQuery.browser.msie && jQuery.browser.version >= 9) {
		 jQuery.support.noCloneEvent = true;
		}
	/* End fix for IE */
	/* Top Cart */
	jQuery('.top-cart').hover(function(){
		jQuery(this).find('.block-title a').addClass('active');
		jQuery('#topCartContent').stop().fadeTo(500, 1).addClass('active');
	}, function(){
			jQuery(this).find('.block-title a').removeClass('active');
			jQuery('#topCartContent').fadeTo(400, 0).removeClass('active');
		})
	/* Top Cart */
			
	if(jQuery('.images-preload').length) {
		jQuery("#products-list, .products-grid").preloader({
			delay:200,
			check_timer:300,
			preload_parent:'a.product-image'
		});
	}
	if(jQuery('.images-hover').length) {
		jQuery ('.images-hover a.product-image').hover(function(){
			jQuery(this).find('span.hover-image').stop(true, true).fadeIn(500)
		}, function(){
			jQuery(this).find('span.hover-image').stop(true, true).fadeOut(500)
		})
	}
	if(jQuery('#ordinary-menu ul#nav').length) {
	  jQuery("#ordinary-menu ul#nav").superfish({
		  autoArrows: false,
		  dropShadows: false,
		  animation:   {opacity:'show',height:'show'}
	  });
	}
        
        if(jQuery('.lightbox').length) {
				jQuery(".lightbox").fancybox({
						'opacity'		: true,
						'overlayShow'	: true,
						'transitionIn'	: 'elastic',
						'transitionOut'	: 'elastic'
					});
			}
	
	jQuery ('.sidebar .block:odd, .product-collateral h2:odd').addClass('odd')
	jQuery ('.block-height').equalHeightColumns();
	
	jQuery ('.form-search input').focusin(function (){
		    jQuery(this).animate({'width':250})
		})
	jQuery ('.form-search input').focusout(function (){
		    jQuery(this).animate({'width':157})
		})
		
	jQuery ('#menu-wide #nav li.level-top.parent').hover (function(){
		    jQuery(this).addClass("hover").find('ul:first').stop(true, true).fadeIn (500)
		}, function (){
			 jQuery(this).removeClass("hover").find('ul:first').stop(true, true).fadeOut (500)
			})
	
	jQuery ('.products-slider .products-grid li.item .actions').css ('opacity', 0.8)
	
	jQuery ('.products-slider .products-grid li.item').hover (function (){
		    jQuery(this).find ('.actions').stop().animate ({
				  'height': 59
				})
		}, function () {
			    jQuery(this).find ('.actions').stop().animate ({
				  'height': 0
				})
			})
});