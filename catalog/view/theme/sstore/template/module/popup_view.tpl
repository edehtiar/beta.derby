<div id="popup-view-wrapper">
  <div class="popup-heading"><?php echo $heading_title; ?></div>
  <div class="popup-center">
    <?php if ($stock_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $stock_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="product-name"><?php echo $product_name; ?></div>
    <div class="row">
      <?php if ($popup_view_data['image'] || $popup_view_data['additional_image']) { ?>
      <div class="col-sm-7">
        <?php if ($thumb || $images) { ?>
        <ul class="thumbnails">
          <?php if ($popup_view_data['image'] && $thumb) { ?>
          <li><a class="thumbnail" title="<?php echo $heading_title; ?>"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="popup-main-image"/></a></li>
          <?php } ?>
          <?php if ($popup_view_data['additional_image'] && $images) { ?>
            <li class="image-additional">
              <input type="radio" name="sub_images" value="<?php echo $thumb; ?>" id="sub-image-0" checked="checked" />
              <label class="thumbnail" title="<?php echo $heading_title; ?>" for="sub-image-0"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></label>
            </li>
            <?php $img_key = 1; foreach ($images as $image) { ?>
            <li class="image-additional">
              <input type="radio" name="sub_images" value="<?php echo $image['popup']; ?>" id="sub-image-<?php echo $img_key; ?>" />
              <label class="thumbnail" title="<?php echo $heading_title; ?>" for="sub-image-<?php echo $img_key; ?>"><img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></label>
            </li>
            <?php $img_key++; } ?>
          <?php } ?>
          <script type="text/javascript">
          $(document).on('change', 'input[name=\'sub_images\']', function() {
            $('#popup-main-image').attr('src',$('input[name=sub_images]:checked').val());
          });
          </script>
        </ul>
        <?php } ?>
      </div>
      <?php } ?>
      <div class="col-sm-5">
        <?php if ($popup_view_data['wishlist'] || $popup_view_data['compare']) { ?>
        <div class="btn-group">
          <?php if ($popup_view_data['wishlist']) { ?>
          <button type="button" id="popup-add-to-wishlist" data-toggle="tooltip" class="btn btn-default" title="<?php echo $button_wishlist; ?>" onclick="addToWishlist('<?php echo $product_id; ?>');"><i class="fa fa-heart"></i></button>
          <?php } ?>
          <?php if ($popup_view_data['compare']) { ?>
          <button type="button" id="popup-add-to-compare" data-toggle="tooltip" class="btn btn-default" title="<?php echo $button_compare; ?>" onclick="addToComapre('<?php echo $product_id; ?>');"><i class="fa fa-exchange"></i></button>
          <?php } ?>
        </div>
        <br/><br/>
        <?php } ?>
        <ul class="list-unstyled">
          <?php if ($manufacturer) { ?>
          <li><?php echo $text_manufacturer; ?> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></li>
          <?php } ?>
          <li><?php echo $text_model; ?> <?php echo $model; ?></li>
          <?php if ($reward) { ?>
          <li><?php echo $text_reward; ?> <?php echo $reward; ?></li>
          <?php } ?>
          <li><?php echo $text_stock; ?> <?php echo $stock; ?></li>
        </ul>
        <?php if ($price) { ?>
        <ul class="list-unstyled">
          <?php if (!$special) { ?>
          <li>
            <h2><span id="main-price"><?php echo $price; ?></span></h2>
          </li>
          <?php } else { ?>
          <li>
            <span id="main-price" style="text-decoration: line-through;"><?php echo $price; ?></span>
            <h2 style="margin-top:0;"><span id="special-price"><?php echo $special; ?></span></h2>
          </li>
          <?php } ?>
          <?php if ($tax) { ?>
          <li><?php echo $text_tax; ?> <span id="main-tax"><?php echo $tax; ?></span></li>
          <?php } ?>
          <?php if ($points) { ?>
          <li><?php echo $text_points; ?> <?php echo $points; ?></li>
          <?php } ?>
          <?php if ($discounts) { ?>
          <li>
            <hr>
          </li>
          <?php foreach ($discounts as $discount) { ?>
          <li><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></li>
          <?php } ?>
          <?php } ?>
        </ul>
        <?php } ?>
        <div id="popup-product">
        <?php if ($options) { ?>
          <hr>
          
          <?php foreach ($options as $option) { ?>
          <?php if ($option['type'] == 'select') { ?>
          <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
            <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
            <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
              <option value=""><?php echo $text_select; ?></option>
              <?php foreach ($option['product_option_value'] as $option_value) { ?>
              <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
              <?php if ($option_value['price']) { ?>
              (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
              <?php } ?>
              </option>
              <?php } ?>
            </select>
          </div>
          <?php } ?>
           <?php if ($option['type'] == 'radio') { ?>
                <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                   <?php if ($option['required']) { ?>
                  <span class="required">*</span>
                  <?php } ?>
                  <b><?php echo $option['name']; ?>:</b><br />
                  <?php foreach ($option['product_option_value'] as $option_value) { ?>
                  <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" class="none" />
                  <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>" class="not-selected"><?php echo $option_value['name']; ?>            
                  </label>
                  <?php } ?>
                  <div class="clearfix"></div>
                </div>
            <?php } ?>
          <?php if ($option['type'] == 'checkbox') { ?>
          <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
            <label class="control-label"><?php echo $option['name']; ?></label>
            <div id="input-option<?php echo $option['product_option_id']; ?>">
              <?php foreach ($option['product_option_value'] as $option_value) { ?>
              <div class="checkbox">
                <label>
                  <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                  <?php echo $option_value['name']; ?>
                  <?php if ($option_value['price']) { ?>
                  (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                  <?php } ?>
                </label>
              </div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
            <?php if ($option['type'] == 'image') { ?>
            <div id="option-<?php echo $option['product_option_id']; ?>" class="option options">
                  
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="radio">
                  <label class="not-selected-img">
                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" class="none"/>
                    <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" title="<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>"/>
                    
                  </label>
                </div>
                <?php } ?>
                  <div class="clearfix"></div>
              </div>
            </div>
            </div>
            <?php } ?>
          <?php if ($option['type'] == 'text') { ?>
          <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
            <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
            <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
          </div>
          <?php } ?>
          <?php if ($option['type'] == 'textarea') { ?>
          <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
            <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
            <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
          </div>
          <?php } ?>
          <?php if ($option['type'] == 'file') { ?>
          <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
            <label class="control-label"><?php echo $option['name']; ?></label>
            <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
            <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
          </div>
          <?php } ?>
          <?php if ($option['type'] == 'date') { ?>
          <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
            <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
            <div class="input-group date">
              <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
              <span class="input-group-btn">
              <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
              </span></div>
          </div>
          <?php } ?>
          <?php if ($option['type'] == 'datetime') { ?>
          <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
            <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
            <div class="input-group datetime">
              <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
              <span class="input-group-btn">
              <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
              </span></div>
          </div>
          <?php } ?>
          <?php if ($option['type'] == 'time') { ?>
          <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
            <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
            <div class="input-group time">
              <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
              <span class="input-group-btn">
              <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
              </span></div>
          </div>
          <?php } ?>
          <?php } ?>
          <?php } ?>
          <?php if ($recurrings) { ?>
            <hr>
            <h3><?php echo $text_payment_recurring ?></h3>
            <div class="form-group required">
              <select name="recurring_id" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($recurrings as $recurring) { ?>
                <option value="<?php echo $recurring['recurring_id'] ?>"><?php echo $recurring['name'] ?></option>
                <?php } ?>
              </select>
              <div class="help-block" id="recurring-description"></div>
            </div>
          <?php } ?>
          <div class="form-group">
            <?php if ($popup_view_data['quantity']) { ?>
            <div class="payment-quantity">
              <label><?php echo $entry_qty; ?></label>
              <div class="number">
                <input name="product_id" value="<?php echo $product_id; ?>" style="display: none;" type="hidden" />
                <div class="frame-change-count">
                  <div class="btn-plus">
                    <button type="button" onclick="$(this).parent().parent().next().val(~~$(this).parent().parent().next().val()+1); update_prices('<?php echo $product_id; ?>');">
                      <span class="icon-plus"></span>
                    </button>
                  </div>
                  <div class="btn-minus">
                    <button type="button" onclick="$(this).parent().parent().next().val(~~$(this).parent().parent().next().val()-1); update_prices('<?php echo $product_id; ?>');">
                      <span class="icon-minus"></span>
                    </button>
                  </div>
                </div>
                <input type="text" name="quantity" value="<?php echo $minimum; ?>" maxlength="3" class="plus-minus" onchange="update_prices( '<?php echo $product_id; ?>' ); return validate(this);" onkeyup="update_prices( '<?php echo $product_id; ?>' ); return validate(this);" />
              </div>
            </div>
            <?php } else { ?>
            <input type="hidden" name="quantity" value="<?php echo $minimum; ?>" />
            <?php } ?>

            <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
            <br />
            <a id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="button"><?php echo $button_cart; ?></a>
           
           
          </div>
          <?php if ($minimum > 1) { ?>
          <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
          <?php } ?>
        </div>
        <?php if ($popup_view_data['review'] && $review_status) { ?>
        <div class="rating">
          <p>
            <?php for ($i = 1; $i <= 5; $i++) { ?>
            <?php if ($rating < $i) { ?>
            <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
            <?php } else { ?>
            <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
            <?php } ?>
            <?php } ?>
            <br />
            <a href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $reviews; ?></a> / <a href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $text_write; ?></a></p>
          <hr>
                 </div>
        <?php } ?>
      </div>

      <div class="col-sm-12">
        <ul class="nav nav-tabs">
          <?php if ($popup_view_data['description']) { ?>
          <li class="active"><a href="#tab-description" data-toggle="tab"><?php echo $tab_description; ?></a></li>
          <?php } ?>
          <?php if ($popup_view_data['specification'] && $attribute_groups) { ?>
          <li><a href="#tab-specification" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
          <?php } ?>
          <?php if ($popup_view_data['review'] && $review_status) { ?>
          <li><a href="#tab-review" data-toggle="tab"><?php echo $tab_review; ?></a></li>
          <?php } ?>
           <?php if ($product_extra_tabs) { ?>
              <?php $tab_i=0; foreach ($product_extra_tabs as $product_extra_tab) { ?>
                <li><a href="#tab-extra-<?php echo $tab_i; ?>" data-toggle="tab"><?php echo $product_extra_tab['title']; ?></a></li>
              <?php $tab_i++; } ?>
            <?php } ?>
        </ul>
        <div class="tab-content">
          <?php if ($popup_view_data['description']) { ?>
          <div class="tab-pane active" id="tab-description"><?php echo $description; ?></div>
          <?php } ?>
          <?php if ($popup_view_data['specification'] && $attribute_groups) { ?>
          <div class="tab-pane" id="tab-specification">
            <table class="table table-bordered">
              <?php foreach ($attribute_groups as $attribute_group) { ?>
              <thead>
                <tr>
                  <td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
                </tr>
              </thead>
              <tbody>
                <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                <tr>
                  <td><?php echo $attribute['name']; ?></td>
                  <td><?php echo $attribute['text']; ?></td>
                </tr>
                <?php } ?>
              </tbody>
              <?php } ?>
            </table>
          </div>
          <?php } ?>
          <?php if ($popup_view_data['review'] && $review_status) { ?>
          <div class="tab-pane" id="tab-review">
            <form class="form-horizontal" id="form-review">
              <div id="review"></div>
              <h2><?php echo $text_write; ?></h2>
              <?php if ($review_guest) { ?>
              <div class="form-group required">
                <div class="col-sm-12">
                  <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                  <input type="text" name="name" value="" id="input-name" class="form-control" />
                </div>
              </div>
              <div class="form-group required">
                <div class="col-sm-12">
                  <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                  <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                  <div class="help-block"><?php echo $text_note; ?></div>
                </div>
              </div>
              <div class="form-group required">
                <div class="col-sm-12">
                  <label class="control-label"><?php echo $entry_rating; ?></label>
                
                  <select id="ratingme" name="rating">
						  <option value="1">1</option>
						  <option value="2">2</option>
						  <option value="3">3</option>
						  <option value="4">4</option>
						  <option value="5">5</option>
						</select>
						<script type="text/javascript">
						   $(function() {
						      $('#ratingme').barrating({
						        theme: 'fontawesome-stars'
						      });
						   });
						</script>
                  </div>
              </div>
              <?php if ($site_key) { ?>
                <div class="form-group">
                  <div class="col-sm-12">
                    <div class="g-recaptcha" data-sitekey="<?php echo $site_key; ?>"></div>
                  </div>
                </div>
              <?php } ?>
              <div class="buttons clearfix">
                <div class="pull-right">
                  <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
                </div>
              </div>
              <?php } else { ?>
              <?php echo $text_login; ?>
              <?php } ?>
            </form>
          </div>
          <?php } ?>
          <?php if ($product_extra_tabs) { ?>
		    <?php $tab_i=0; foreach ($product_extra_tabs as $product_extra_tab) { ?>
		      <div class="tab-pane" id="tab-extra-<?php echo $tab_i; ?>"><?php echo $product_extra_tab['text']; ?></div>
		    <?php $tab_i++; } ?>
		  <?php } ?>

        </div>
      </div>
    </div>    
  </div>
  <div class="popup-footer">
    <button onclick="$.magnificPopup.close();"><?php echo $button_shopping; ?></button>
    <a id="popup-view-button" href="<?php echo $view_product_link; ?>"><?php echo $button_view; ?></a>
  </div>

<script src="catalog/view/javascript/jquery/datetimepicker/moment.js" type="text/javascript"></script>
<script src="catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" />

<script type="text/javascript"><!--
	$('.image-additional').delay(240).css({ 'opacity': '1'});	
$('.date').datetimepicker({
  pickTime: false,
});

$('.datetime').datetimepicker({
  pickDate: true,
  pickTime: true
});

$('.time').datetimepicker({
  pickDate: false,
});

$(document).on('click', 'button[id^=\'button-upload\']', function() {
  var node = this;

  $('#form-upload').remove();

  $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

  $('#form-upload input[name=\'file\']').trigger('click');

  if (typeof timer != 'undefined') {
      clearInterval(timer);
  }

  timer = setInterval(function() {
    if ($('#form-upload input[name=\'file\']').val() != '') {
      clearInterval(timer);

      $.ajax({
        url: 'index.php?route=tool/upload',
        type: 'post',
        dataType: 'json',
        data: new FormData($('#form-upload')[0]),
        cache: false,
        contentType: false,
        processData: false,
        beforeSend: function() {
          $(node).button('loading');
        },
        complete: function() {
          $(node).button('reset');
        },
        success: function(json) {
          $('.text-danger').remove();

          if (json['error']) {
            $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
          }

          if (json['success']) {
            alert(json['success']);

            $(node).parent().find('input').attr('value', json['code']);
          }
        },
        error: function(xhr, ajaxOptions, thrownError) {
          alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
      });
    }
  }, 500);
});
//--></script>
<script type="text/javascript"><!--
function masked(element, status) {
  if (status == true) {
    $('<div/>')
    .attr({ 'class':'masked' })
    .prependTo(element);
    $('<div class="masked_loading" />').insertAfter($('.masked'));
  } else {
    $('.masked').remove();
    $('.masked_loading').remove();
  }
}

<?php if ($popup_view_data['quantity']) { ?>
function validate( input ) {
  input.value = input.value.replace( /[^\d,]/g, '' );
}
<?php } ?>

$('#button-cart').on('click', function() {
  $.ajax({
    url: 'index.php?route=checkout/cart/add',
    type: 'post',
    data: $('#popup-product input[type=\'text\'], #popup-product input[type=\'hidden\'], #popup-product input[type=\'radio\']:checked, #popup-product input[type=\'checkbox\']:checked, #popup-product select, #popup-product textarea'),
    dataType: 'json',
    beforeSend: function() {
      $('#button-cart').button('loading');
    },
    complete: function() {
      $('#button-cart').button('reset');
    },
    success: function(json) {
      $('.alert, .text-danger').remove();
      $('.form-group').removeClass('has-error');
	  	
	  $('.success, .warning, .attention, information, .error').remove();	
	  	
      if (json['error']) {
        if (json['error']['option']) {
	        
					for (i in json['error']['option']) {
						$('#option-' + i).after('<span class="error">' + json['error']['option'][i] + '</span>');
					}
				
	       /* 
          for (i in json['error']['option']) {
            var element = $('#input-option' + i.replace('_', '-'));

            if (element.parent().hasClass('input-group')) {
              element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
            } else {
              element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
            }*/
          
        }

        if (json['error']['recurring']) {
          $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
        }

        // Highlight any found errors
        $('.text-danger').parent().addClass('has-error');
      }

      if (json['success']) {
	    
	      
        $('#popup-view-wrapper .popup-center').prepend('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');	
        
        $('.error').css('display', 'none');

        $('#cart > button').html('<i class="fa fa-shopping-cart"></i> ' + json['total']);

        $('#cart > ul').load('index.php?route=common/cart/info ul li');
        
        $('#cart-total').html(json['total']);
        
        
      }
    }
  });
});
<?php if ($popup_view_data['wishlist']) { ?>
function addToWishlist(product_id) {
  $.ajax({
    url: 'index.php?route=account/wishlist/add',
    type: 'post',
    data: 'product_id=' + product_id,
    dataType: 'json',
    success: function(json) {
      $('.alert').remove();

      if (json['success']) {
        $('#popup-view-wrapper .popup-center').prepend('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
      }

      if (json['info']) {
        $('#popup-view-wrapper .popup-center').prepend('<div class="alert alert-info"><i class="fa fa-info-circle"></i> ' + json['info'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
      }

      $('#wishlist-total span').html(json['total']);
      $('#wishlist-total').attr('title', json['total']);
    }
  });
}
<?php } ?>
<?php if ($popup_view_data['compare']) { ?>
function addToComapre(product_id) {
  $.ajax({
    url: 'index.php?route=product/compare/add',
    type: 'post',
    data: 'product_id=' + product_id,
    dataType: 'json',
    success: function(json) {
      $('.alert').remove();

      if (json['success']) {
        $('#popup-view-wrapper .popup-center').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

        $('#compare-total').html(json['total']);
      }
    }
  });
}
<?php } ?>
<?php if ($popup_view_data['quantity']) { ?>
function update_prices(product_id) {
  masked('#popup-view-wrapper', true);
  var input_val = $('#popup-product').find('input[name=quantity]').val();
  var quantity = parseInt(input_val);

  <?php if ($minimum > 1) { ?>
    if (quantity < <?php echo $minimum; ?>) {
      quantity = $('#popup-product').find('input[name=quantity]').val(<?php echo $minimum; ?>);
      masked('#popup-view-wrapper', false);
      return;
    }
  <?php } else { ?>
    if (quantity == 0) {
      quantity = $('#popup-product').find('input[name=quantity]').val(1);
      masked('#popup-view-wrapper', false);
      return;
    }
  <?php } ?>

  $.ajax({
    url: 'index.php?route=module/popup_view/update_prices&product_id=' + product_id + '&quantity=' + quantity,
    type: 'post',
    dataType: 'json',
    data: $('#popup-product').serialize(),
    success: function(json) {
      $('#main-price').html(json['price']);
      $('#special-price').html(json['special']);
      $('#main-tax').html(json['tax']);
      masked('#popup-view-wrapper', false);
    } 
  });
}
<?php } ?>
<?php if ($popup_view_data['review']) { ?>
$('#review').delegate('.pagination a', 'click', function(e) {
  e.preventDefault();
  $('#review').fadeOut('slow');
  $('#review').load(this.href);
  $('#review').fadeIn('slow');
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
  $.ajax({
    url: 'index.php?route=module/popup_view/write&product_id=<?php echo $product_id; ?>',
    type: 'post',
    dataType: 'json',
    data: $("#form-review").serialize(),
    beforeSend: function() {
      $('#button-review').button('loading');
    },
    complete: function() {
      $('#button-review').button('reset');
    },
    success: function(json) {
      $('.alert-success, .alert-danger').remove();

      if (json['error']) {
        $('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
      }

      if (json['success']) {
        $('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
        $('input[name=\'name\']').val('');
        $('textarea[name=\'text\']').val('');
        $('input[name=\'rating\']:checked').prop('checked', false);
      }
    }
  });
});
<?php } ?>
//--></script>
<script type="text/javascript"><!--

$(document).ready(function() {
	   $('label.not-selected').click(function(){
		  $('label.selected').removeClass('selected').addClass('not-selected');
		  $(this).removeClass('not-selected').addClass('selected');
	   });
	});
	
	 $('label.not-selected-img').click(function(){
		  $('label.selected-img').removeClass('selected-img').addClass('not-selected-img');
		  $(this).removeClass('not-selected-img').addClass('selected-img');
	   });
	

$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
  $.ajax({
    url: 'index.php?route=product/product/getRecurringDescription',
    type: 'post',
    data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
    dataType: 'json',
    beforeSend: function() {
      $('#recurring-description').html('');
    },
    success: function(json) {
      $('.alert, .text-danger').remove();
      if (json['success']) {
        $('#recurring-description').html(json['success']);
      }
    }
  });
});
//--></script>
<style type="text/css">
<?php if ($popup_view_data['color_h1']) { ?>
#popup-view-wrapper .product-name {color:<?php echo $popup_view_data['color_h1']; ?>; }
<?php } ?>
<?php if ($popup_view_data['color_price']) { ?>
#popup-view-wrapper #main-price {color:<?php echo $popup_view_data['color_price']; ?>; }
<?php } ?>
<?php if ($popup_view_data['color_special_price']) { ?>
#popup-view-wrapper #special-price {color:<?php echo $popup_view_data['color_special_price']; ?>; }
<?php } ?>
<?php if ($popup_view_data['color_description']) { ?>
#popup-view-wrapper #tab-description {color:<?php echo $popup_view_data['color_description']; ?>; }
<?php } ?>
<?php if ($popup_view_data['color_checkout_button']) { ?>
#popup-view-wrapper .popup-footer a {color:<?php echo $popup_view_data['color_checkout_button']; ?>; }
<?php } ?>
<?php if ($popup_view_data['color_close_button']) { ?>
#popup-view-wrapper .popup-footer button {color:<?php echo $popup_view_data['color_close_button']; ?>; }
<?php } ?>
<?php if ($popup_view_data['background_checkout_button']) { ?>
#popup-view-wrapper .popup-footer a {background:<?php echo $popup_view_data['background_checkout_button']; ?>; }
<?php } ?>
<?php if ($popup_view_data['background_close_button']) { ?>
#popup-view-wrapper .popup-footer button {background:<?php echo $popup_view_data['background_close_button']; ?>; }
<?php } ?>
<?php if ($popup_view_data['background_checkout_button_hover']) { ?>
#popup-view-wrapper .popup-footer a:hover {background:<?php echo $popup_view_data['background_checkout_button_hover']; ?>; }
<?php } ?>
<?php if ($popup_view_data['background_close_button_hover']) { ?>
#popup-view-wrapper .popup-footer button:hover {background:<?php echo $popup_view_data['background_close_button_hover']; ?>; }
<?php } ?>
<?php if ($popup_view_data['border_checkout_button']) { ?>
#popup-view-wrapper .popup-footer a {border-color:<?php echo $popup_view_data['border_checkout_button']; ?>; }
<?php } ?>
<?php if ($popup_view_data['border_close_button']) { ?>
#popup-view-wrapper .popup-footer button {border-color:<?php echo $popup_view_data['border_close_button']; ?>; }
<?php } ?>
<?php if ($popup_view_data['border_checkout_button_hover']) { ?>
#popup-view-wrapper .popup-footer a:hover {border-color:<?php echo $popup_view_data['border_checkout_button_hover']; ?>; }
<?php } ?>
<?php if ($popup_view_data['border_close_button_hover']) { ?>
#popup-view-wrapper .popup-footer button:hover {border-color:<?php echo $popup_view_data['border_close_button_hover']; ?>; }
<?php } ?>
<?php if ($popup_view_data['color_tocart_button']) { ?>
#popup-view-wrapper #button-cart {color:<?php echo $popup_view_data['color_tocart_button']; ?>; }
<?php } ?>
<?php if ($popup_view_data['background_tocart_button']) { ?>
#popup-view-wrapper #button-cart {background:<?php echo $popup_view_data['background_tocart_button']; ?>; }
<?php } ?>
<?php if ($popup_view_data['background_tocart_button_hover']) { ?>
#popup-view-wrapper #button-cart:hover {background:<?php echo $popup_view_data['background_tocart_button_hover']; ?>; }
<?php } ?>
<?php if ($popup_view_data['border_tocart_button']) { ?>
#popup-view-wrapper #button-cart {border-color:<?php echo $popup_view_data['border_tocart_button']; ?>; }
<?php } ?>
<?php if ($popup_view_data['border_tocart_button_hover']) { ?>
#popup-view-wrapper #button-cart:hover {border-color:<?php echo $popup_view_data['border_tocart_button_hover']; ?>; }
<?php } ?>
<?php if ($popup_view_data['color_wishlist_button']) { ?>
#popup-view-wrapper #popup-add-to-wishlist {color:<?php echo $popup_view_data['color_wishlist_button']; ?>; }
<?php } ?>
<?php if ($popup_view_data['background_wishlist_button']) { ?>
#popup-view-wrapper #popup-add-to-wishlist {background:<?php echo $popup_view_data['background_wishlist_button']; ?>; }
<?php } ?>
<?php if ($popup_view_data['background_wishlist_button_hover']) { ?>
#popup-view-wrapper #popup-add-to-wishlist:hover {background:<?php echo $popup_view_data['background_wishlist_button_hover']; ?>; }
<?php } ?>
<?php if ($popup_view_data['border_wishlist_button']) { ?>
#popup-view-wrapper #popup-add-to-wishlist {border-color:<?php echo $popup_view_data['border_wishlist_button']; ?>; }
<?php } ?>
<?php if ($popup_view_data['border_wishlist_button_hover']) { ?>
#popup-view-wrapper #popup-add-to-wishlist:hover {border-color:<?php echo $popup_view_data['border_wishlist_button_hover']; ?>; }
<?php } ?>
<?php if ($popup_view_data['color_compare_button']) { ?>
#popup-view-wrapper #popup-add-to-compare {color:<?php echo $popup_view_data['color_compare_button']; ?>; }
<?php } ?>
<?php if ($popup_view_data['background_compare_button']) { ?>
#popup-view-wrapper #popup-add-to-compare {background:<?php echo $popup_view_data['background_compare_button']; ?>; }
<?php } ?>
<?php if ($popup_view_data['background_compare_button_hover']) { ?>
#popup-view-wrapper #popup-add-to-compare:hover {background:<?php echo $popup_view_data['background_compare_button_hover']; ?>; }
<?php } ?>
<?php if ($popup_view_data['border_compare_button']) { ?>
#popup-view-wrapper #popup-add-to-compare {border-color:<?php echo $popup_view_data['border_compare_button']; ?>; }
<?php } ?>
<?php if ($popup_view_data['border_compare_button_hover']) { ?>
#popup-view-wrapper #popup-add-to-compare:hover {border-color:<?php echo $popup_view_data['border_compare_button_hover']; ?>; }
<?php } ?>
<?php if ($popup_view_data['color_tabs_button']) { ?>
#popup-view-wrapper .nav-tabs>li.active>a {color:<?php echo $popup_view_data['color_tabs_button']; ?>; }
<?php } ?>
<?php if ($popup_view_data['background_tabs_button']) { ?>
#popup-view-wrapper .nav-tabs>li.active>a {background:<?php echo $popup_view_data['background_tabs_button']; ?>; }
<?php } ?>
<?php if ($popup_view_data['color_tabs_button_hover']) { ?>
#popup-view-wrapper .nav-tabs>li>a:hover,
#popup-view-wrapper .nav-tabs>li.active>a:hover {color:<?php echo $popup_view_data['color_tabs_button_hover']; ?>; }
<?php } ?>
<?php if ($popup_view_data['background_tabs_button_hover']) { ?>
#popup-view-wrapper .nav-tabs>li>a:hover,
#popup-view-wrapper .nav-tabs>li.active>a:hover {background:<?php echo $popup_view_data['background_tabs_button_hover']; ?>; }
<?php } ?>
</style>
</div>