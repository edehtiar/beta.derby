$(document).ready(function() {
	
	$( "#megamenu-menu a.dropdown-toggle" ).bind( "click", function() {
		if(($(this).attr('href')!="javascript:void(0);")&&($( document ).width()>1024))
		{
		window.document.location=$(this).attr('href');
		}
	});

    getCartMobile();
    
	$('.category-slide').delay(240).css({ 'opacity': '1', 'background': 'transparent'});
        
	/* Search */
	$('.sb-search-submit').bind('click', function() {
		url = $('base').attr('href') + 'index.php?route=product/search';
				 
		var search = $("#story").val();
        
        var searchlenght = $("#story").val().length;
		
		if (searchlenght > 0) {
			url += '&search=' + encodeURIComponent(search);
            location = url;
		}
	
		
	});
	    
    
    $('#search input[name=\'search\']').bind('keydown', function(e) {
		if (e.keyCode == 13) {
			url = $('base').attr('href') + 'index.php?route=product/search';
			 
			var search = $("#story").val();
			
			var searchlenght = $("#story").val().length;
		
    		if (searchlenght > 0) {
    			url += '&search=' + encodeURIComponent(search);
                location = url;
    		}
		}
	});
	
	// Language
	$('.language a').on('click', function(e) {
		e.preventDefault();

		$('.language input[name=\'code\']').attr('value', $(this).attr('href'));

		$('.language').submit();
	});

    /* Mobile Search */
    
    $('.top-search-submit').bind('click', function() {
		url = $('base').attr('href') + 'index.php?route=product/search';
				 
		var search = $("#story-top").val();
		
		if (search) {
			url += '&search=' + encodeURIComponent(search);
		}
	
		location = url;
	});
    
    
    $('.search-box-top input[name=\'search\']').bind('keydown', function(e) {
		if (e.keyCode == 13) {
			url = $('base').attr('href') + 'index.php?route=product/search';
			 
			var search = $("#story-top").val();
			
			if (search) {
				url += '&search=' + encodeURIComponent(search);
			}
			
			location = url;
		}
	});
    
    /* End of Search */
    
    $("#cls").on('click', function(e) {
      $("#part").fadeOut("slow"); 
    });
    
    
    
    $("#part").on('click', function(e) {
        e.stopPropagation();
        
        if(e.target.id != "")
           {
               $("#part").fadeOut("slow"); 
              
           }
    });
    
    
    $('#part').on('touchstart click', function(e){
      e.stopPropagation();
        if(e.target.id != "")
           {
               $("#part").fadeOut("slow"); 
              
           }
    });

  
	$('#modaltrigger').leanModal({ top: 130, overlay: 0.99, closeButton: ".hidemodal" });

    
    
    $("#contacts").on('click', function(e) {
        $(".hidden-contacts").fadeIn("slow"); 
        $('.hidden-contacts').on('mouseleave', function() {
			$(".hidden-contacts").fadeOut("slow"); 
		});

    });
    
    $(".manufacturer-logo").on('mouseover', function(e) {
      
        $(".manufacturer-description").fadeIn("fast"); 
        
        $('.manufacturer-description').on('mouseleave', function() {
			$(".manufacturer-description").fadeOut("slow"); 
		});

    });
    
    
	
	$('#header input[name=\'search\']').bind('keydown', function(e) {
		if (e.keyCode == 13) {
			url = $('base').attr('href') + 'index.php?route=product/search';
			 
			var search = $('input[name=\'search\']').attr('value');
			
			if (search) {
				url += '&search=' + encodeURIComponent(search);
			}
			
			location = url;
		}
	});
	
	/* Ajax Cart */
	$('#cart').on('click', function() {
	   
		$('#partcont').load('index.php?route=common/cart/info #cart > *');
        
       $('#part').fadeIn('slow');
	});
    
    $('.cart-top-mobile').on('click', function() {
	   
		$('#partcont').load('index.php?route=common/cart/info #cart > *');
        
       $('#part').fadeIn('slow');
       event.stopPropagation();
       return false;
       
	});
	
	
	
	$("#sidebar-toggle").click(function() {
	  $('#sidebar').toggleClass("hero");
	  $('#sidebar-toggle').toggleClass("rotate-burger");
	  return false;
	});
        
        
	$('#show-categories').click(function() {
		  $('.mobile-category').slideToggle( "slow" );
		  
		  if ($('#show-categories > i:last-child').hasClass("fa-caret-down")){
		    
		    $('#show-categories > i:last-child').removeClass( "fa-caret-down" );
		    $('#show-categories > i:last-child').addClass( "fa-caret-up" );
		    
		  } else if($('#show-categories > i:last-child').hasClass("fa-caret-up")) {
		    
		    $('#show-categories > i:last-child').removeClass( "fa-caret-up" );
		    $('#show-categories > i:last-child').addClass( "fa-caret-down" );
		    
		  }
	  
	  return false;
	});
	
	$('.search-top').click(function() {
	    $(this).toggleClass("open");
	  $('.search-box-top').slideToggle( "slow" );
	return false;
	});
	
	
	$('.category-button').click(function(){
		$(this).toggleClass('active-submenu');
		$(this).parent().find('.submenu').toggleClass('active-submenu-items');
		return false;
	});
	
	
	$("div[data-role='sideslide']").on('swipeleft', function() {
		$("#sidebar").removeClass("hero");
		$('#sidebar-toggle').removeClass("rotate-burger");
	});
	
	
	$( ".settings" ).click(function() {
      $( ".settings-list" ).slideDown( "slow", function() {
    	// Animation complete.
      });
      
    });
    $('.settings').on('mouseleave', function() {
			$(".settings-list").fadeOut("slow"); 
		});
		
    // Currency
	$('.currency .currency-select').on('click', function(e) {
		e.preventDefault();

		$('.currency input[name=\'code\']').attr('value', $(this).attr('name'));

		$('.currency').submit();
	});
	
	// menu
	$('#sstore-3-level li.active').addClass('open').children('ul').show();
	$('#sstore-3-level li.has-sub>a.toggle-a').on('click', function(){
		$(this).removeAttr('href');
		var element = $(this).parent('li');
		if (element.hasClass('open')) {
			element.removeClass('open');
			element.find('li').removeClass('open');
			element.find('ul').slideUp(200);
		}
		else {
			element.addClass('open');
			element.children('ul').slideDown(200);
			element.siblings('li').children('ul').slideUp(200);
			element.siblings('li').removeClass('open');
			element.siblings('li').find('li').removeClass('open');
			element.siblings('li').find('ul').slideUp(200);
		}
		
	
	});
	
	
    var url = document.location.toString();
    $("a").filter(function () {
        return url.indexOf(this.href) != -1;
    }).addClass("current-link");
	
	
});


document.documentElement.addEventListener('touchstart', function (event) {
  if (event.touches.length > 1) {
    event.preventDefault();
  }
}, false);


function getURLVar(key) {
	var value = [];

	var query = String(document.location).split('?');

	if (query[1]) {
		var part = query[1].split('&');

		for (i = 0; i < part.length; i++) {
			var data = part[i].split('=');

			if (data[0] && data[1]) {
				value[data[0]] = data[1];
			}
		}

		if (value[key]) {
			return value[key];
		} else {
			return '';
		}
	}
}

var cart = {
	'add': function(product_id, quantity) {
		$.ajax({
			url: 'index.php?route=checkout/cart/add',
			type: 'post',
			data: 'product_id=' + product_id + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
			complete: function() {
				$('#cart > button').button('reset');
			},
			success: function(json) {
				$('.alert, .text-danger').remove();

				if (json['redirect']) {
					location = json['redirect'];
				}

				if (json['success']) {
					$('#content').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');

					// Need to set timeout otherwise it wont update the total
					setTimeout(function () {
						$('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');
					}, 100);

					$('html, body').animate({ scrollTop: 0 }, 'slow');

					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
			},
	        error: function(xhr, ajaxOptions, thrownError) {
	            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
	        }
		});
	},
	'update': function(key, quantity) {
		$.ajax({
			url: 'index.php?route=checkout/cart/edit',
			type: 'post',
			data: 'key=' + key + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
			complete: function() {
				$('#cart > button').button('reset');
			},
			success: function(json) {
				// Need to set timeout otherwise it wont update the total
				setTimeout(function () {
					$('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');
				}, 100);

				if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
					location = 'index.php?route=checkout/cart';
				} else {
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
			},
	        error: function(xhr, ajaxOptions, thrownError) {
	            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
	        }
		});
	},
	'remove': function(key) {
		$.ajax({
			url: 'index.php?route=checkout/cart/remove',
			type: 'post',
			data: 'key=' + key,
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
			complete: function() {
				$('#cart > button').button('reset');
			},
			success: function(json) {
				// Need to set timeout otherwise it wont update the total
				setTimeout( function()  {
			        $('#partcont').load('index.php?route=common/cart/info #cart > *');
			        getCartMobile();
			    }, 400);
					location = 'index.php?route=checkout/cart';

			},
	        error: function(xhr, ajaxOptions, thrownError) {
	            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
	        }
		});
	}
}


var voucher = {
	'add': function() {

	},
	'remove': function(key) {
		$.ajax({
			url: 'index.php?route=checkout/cart/remove',
			type: 'post',
			data: 'key=' + key,
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
			complete: function() {
				$('#cart > button').button('reset');
			},
			success: function(json) {
				$('#partcont').append('<div id="loading-mask"></div>');
    
			    setTimeout( function()  {
			        $('#partcont').load('index.php?route=common/cart/info #cart > *');
			        getCartMobile();
			    }, 400);
			},
	        error: function(xhr, ajaxOptions, thrownError) {
	            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
	        }
		});
	}
}



	
function animateCall(element) {
	
	$(element).delay(200).animate({ opacity: 'toggle' }, 1000, function() { animateCall(element); });
	
}

function get_popup_view(product_id) {  
	if ($(window).width() > 768) {
	    $.magnificPopup.open({
	        tLoading: '<img src="catalog/view/theme/sstore/stylesheet/popup_view/ring-alt.svg" />',
	        items: {
	            src: 'index.php?route=module/popup_view&product_id='+product_id,
	            type: 'ajax'
	        }
	    });
    }
}


function getCartMobile() {

	$.getJSON("index.php?route=common/cart/mobileinfo", function(json) {
    	
    	var ProductsCount = json['mobile_total'];
    	
    	$('.cart-cols').html(ProductsCount);
    	
    	$('.cart-cols').fadeIn('fast');
    
   	});


}

function cartremove(key) {

    var product = key;
  
    $.post("index.php?route=checkout/cart/remove", { key: product }, function(response) {
            $('#cart-total').html(response.total);
        }
    );
    
    $('#partcont').append('<div id="loading-mask"></div>');
    
    setTimeout( function()  {
        $('#partcont').load('index.php?route=common/cart/info #cart > *');
        getCartMobile();
    }, 400);
    
    
}

function getURLVar(key) {
    
	var value = [];
	
	var query = String(document.location).split('?');
	
	if (query[1]) {
		var part = query[1].split('&');
        
		for (i = 0; i < part.length; i++) {
			var data = part[i].split('=');
			
			if (data[0] && data[1]) {
				value[data[0]] = data[1];
			}
		}
        
        $('#partcont').load('index.php?route=module/cart #cart > *');
		
		if (value[key]) {
			return value[key];
		} else {
			return '';
		}
        
        $('#part').fadeIn('slow');
	}
    
       
} 

function addToCart(product_id, quantity) {
	quantity = typeof(quantity) != 'undefined' ? quantity : 1;

	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: 'product_id=' + product_id + '&quantity=' + quantity,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information, .error').remove();
			
			if (json['redirect']) {
				location = json['redirect'];
			}
			
		if (json['success']) {
                
      
            
				$('#partcont').html('<div class="mcartdiv"><div class="mcartok">' + json['text_ok'] + '</div><div class="mcarti"><div class="imagesd"><div class="iconer ' + json['lang'] + '"></div><img class="mcartimage" src="' + json['image'] + '"><br /><div class="mcartproductname">' + json['name'] + '</div></div></div><div class="mcartright">' + json['cart_text1'] + ' <br /><br /><a class="testbutton" href="' + json['checkoutlink'] + '">' + json['cart_button1'] + '</a> <div class="mcarthr">&nbsp;</div> ' + json['cart_text2'] + ' <br/><br/><button class="testbutton" id="cls">' + json['cart_button2'] + '</button></div><div class="clearfix"></div></div>');
			
				
				$('#part').fadeIn('slow');
					
				$('#cart-total').html(json['total']);
				
				getCartMobile();

			}
		}
	});
}
function addToWishList(product_id) {
	$.ajax({
		url: 'index.php?route=account/wishlist/add',
		type: 'post',
		data: 'product_id=' + product_id,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information').remove();
        
            if (json['success']) {
				
                $('#partcont').html('<div class="mcartdivatem">' + json['success'] + '</div>');
                
                	$('#part').fadeIn('slow');
					
                $('#wishlist-total').html(json['total']);
           

			}
            
            if(json['info']) {
				
                $('#partcont').html('<div class="mcartdivatem">' + json['info'] + '</div>');
                
                	$('#part').fadeIn('slow');
					
                $('#wishlist-total').html(json['total']);
           

			}
		}
	});
}

function addToCompare(product_id) { 
	$.ajax({
		url: 'index.php?route=product/compare/add',
		type: 'post',
		data: 'product_id=' + product_id,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information').remove();
						

            if (json['success']) {
				
                $('#partcont').html('<div class="mcartdivatem">' + json['success'] + '</div>');
                
                	$('#part').fadeIn('slow');
					
                $('#compare-total').html(json['total']);
           

			}
            
            
            	
		}
	});
}
/* Agree to Terms */
$(document).delegate('.agree', 'click', function(e) {
	e.preventDefault();
	
	$('#modal-agree').remove();
	
	var element = this;
	
	$.ajax({
		url: $(element).attr('href'),
		type: 'get',
		dataType: 'html',
		success: function(data) {
		html = '<div id="modal-agree">';
		html += ' <div>';
		html += ' <div>';
		html += ' <div>';
		html += ' <h4>' + $(element).text() + '</h4>';
		html += ' </div>';
		html += ' <div>' + data + '</div>';
		html += ' </div';
		html += ' </div>';
		html += '</div>';
		
		
		$('#partcont').html('<div class="mcartdivatem">' + html + '</div>');
                
        $('#part').fadeIn('slow');
	}
	});
});
/* Autocomplete */
(function($) {
	function Autocomplete(element, options) {
		this.element = element;
		this.options = options;
		this.timer = null;
		this.items = new Array();

		$(element).attr('autocomplete', 'off');
		$(element).on('focus', $.proxy(this.focus, this));
		$(element).on('blur', $.proxy(this.blur, this));
		$(element).on('keydown', $.proxy(this.keydown, this));

		$(element).after('<ul class="dropdown-menu"></ul>');
		$(element).siblings('ul.dropdown-menu').delegate('a', 'click', $.proxy(this.click, this));
	}

	Autocomplete.prototype = {
		focus: function() {
			this.request();
		},
		blur: function() {
			setTimeout(function(object) {
				object.hide();
			}, 200, this);
		},
		click: function(event) {
			event.preventDefault();

			value = $(event.target).parent().attr('data-value');

			if (value && this.items[value]) {
				this.options.select(this.items[value]);
			}
		},
		keydown: function(event) {
			switch(event.keyCode) {
				case 27: // escape
					this.hide();
					break;
				default:
					this.request();
					break;
			}
		},
		show: function() {
			var pos = $(this.element).position();

			$(this.element).siblings('ul.dropdown-menu').css({
				top: pos.top + $(this.element).outerHeight(),
				left: pos.left
			});

			$(this.element).siblings('ul.dropdown-menu').show();
		},
		hide: function() {
			$(this.element).siblings('ul.dropdown-menu').hide();
		},
		request: function() {
			clearTimeout(this.timer);

			this.timer = setTimeout(function(object) {
				object.options.source($(object.element).val(), $.proxy(object.response, object));
			}, 200, this);
		},
		response: function(json) {
			html = '';

			if (json.length) {
				for (i = 0; i < json.length; i++) {
					this.items[json[i]['value']] = json[i];
				}

				for (i = 0; i < json.length; i++) {
					if (!json[i]['category']) {
						html += '<li data-value="' + json[i]['value'] + '"><a href="#">' + json[i]['label'] + '</a></li>';
					}
				}

				// Get all the ones with a categories
				var category = new Array();

				for (i = 0; i < json.length; i++) {
					if (json[i]['category']) {
						if (!category[json[i]['category']]) {
							category[json[i]['category']] = new Array();
							category[json[i]['category']]['name'] = json[i]['category'];
							category[json[i]['category']]['item'] = new Array();
						}

						category[json[i]['category']]['item'].push(json[i]);
					}
				}

				for (i in category) {
					html += '<li class="dropdown-header">' + category[i]['name'] + '</li>';

					for (j = 0; j < category[i]['item'].length; j++) {
						html += '<li data-value="' + category[i]['item'][j]['value'] + '"><a href="#">&nbsp;&nbsp;&nbsp;' + category[i]['item'][j]['label'] + '</a></li>';
					}
				}
			}

			if (html) {
				this.show();
			} else {
				this.hide();
			}

			$(this.element).siblings('ul.dropdown-menu').html(html);
		}
	};

	$.fn.autocomplete = function(option) {
		return this.each(function() {
			var data = $(this).data('autocomplete');

			if (!data) {
				data = new Autocomplete(this, option);

				$(this).data('autocomplete', data);
			}
		});
	}
})(window.jQuery);