<div id="popup-call-phone-wrapper">
  <div class="popup-heading"><?php echo $heading_title; ?></div>
  <div class="popup-center">
    <form method="post" enctype="multipart/form-data" id="call-phone-form">
      <div class="payment-info">
        <?php if ($popup_call_phone_data['name']) { ?>
        <div>
          <label><?php echo $enter_name; ?><?php if ($popup_call_phone_data['name'] == 2) { ?><span class="required">*</span><?php } ?></label>
          <input name="name" value="<?php echo $name;?>" placeholder="<?php echo $enter_name; ?>" />
        </div>
        <?php } ?>
        <?php if ($popup_call_phone_data['telephone']) { ?>
        <div>
          <label><?php echo $enter_telephone; ?><?php if ($popup_call_phone_data['telephone'] == 2) { ?><span class="required">*</span><?php } ?></label>
          <input name="telephone" value="<?php echo $telephone;?>" placeholder="<?php echo $enter_telephone; ?>" />
        </div>
        <?php } ?>
        <?php if ($popup_call_phone_data['time']) { ?>
        <div>
          <label><?php echo $enter_time; ?><?php if ($popup_call_phone_data['time'] == 2) { ?><span class="required">*</span><?php } ?></label>
          <input name="time" value="<?php echo $time;?>" placeholder="<?php echo $enter_time; ?>" class="datetime" />
        </div>
        <?php } ?>
        <?php if ($popup_call_phone_data['comment']) { ?>
        <div>
          <label><?php echo $enter_comment; ?><?php if ($popup_call_phone_data['comment'] == 2) { ?><span class="required">*</span><?php } ?></label>
          <textarea name="comment" placeholder="<?php echo $enter_comment; ?>"><?php echo $comment;?></textarea>
        </div>
        <?php } ?>
      </div>
    </form>
  </div>
  <div class="popup-footer">
	  
    <a id="popup-send-button"><?php echo $button_send; ?></a>
  </div>
<script src="catalog/view/javascript/jquery/datetimepicker/moment.js" type="text/javascript"></script>
<script src="catalog/view/javascript/jquery/locale/ru.js" type="text/javascript"></script>
<script src="catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" />



<script type="text/javascript"><!--
	$('.image-additional').delay(240).css({ 'opacity': '1'});	
$('.date').datetimepicker({
  pickTime: false,
});

var nowDate = new Date();
var today = new Date(nowDate.getFullYear(), nowDate.getMonth(), nowDate.getDate(), 0, 0, 0, 0);

$('.datetime').datetimepicker({
  pickDate: true,
  pickTime: true,
  minDate: today
});


$('.time').datetimepicker({
  pickDate: false,
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

$('#popup-send-button').on('click', function() {
  masked('#popup-call-phone-wrapper', true);
  $.ajax({
      type: 'post',
      url:  'index.php?route=module/popup_call_phone/send',
      dataType: 'json',
      data: $('#call-phone-form').serialize(),
      success: function(json) {
        if (json['error']) {
          if (json['error']['field']) {
            masked('#popup-call-phone-wrapper', false);
            $('.text-danger').remove();
            $.each(json['error']['field'], function(i, val) {
              $('[name="' + i + '"]').addClass('error_style').after('<div class="text-danger">' + val + '</div>');
            });
          }
        } else {
          if (json['output']) {
            masked('#popup-call-phone-wrapper', false);
            $('#popup-send-button').remove();
            $('#popup-call-phone-wrapper .popup-center').html(json['output']);
          }
        }
      }
  });
});
//--></script>
<style type="text/css">
<?php if ($popup_call_phone_data['color_send_button']) { ?>
#popup-call-phone-wrapper .popup-footer a {color:<?php echo $popup_call_phone_data['color_send_button']; ?>; }
<?php } ?>
<?php if ($popup_call_phone_data['color_close_button']) { ?>
#popup-call-phone-wrapper .popup-footer button {color:<?php echo $popup_call_phone_data['color_close_button']; ?>; }
<?php } ?>
<?php if ($popup_call_phone_data['background_send_button']) { ?>
#popup-call-phone-wrapper .popup-footer a {background:<?php echo $popup_call_phone_data['background_send_button']; ?>; }
<?php } ?>
<?php if ($popup_call_phone_data['background_close_button']) { ?>
#popup-call-phone-wrapper .popup-footer button {background:<?php echo $popup_call_phone_data['background_close_button']; ?>; }
<?php } ?>
<?php if ($popup_call_phone_data['background_send_button_hover']) { ?>
#popup-call-phone-wrapper .popup-footer a:hover {background:<?php echo $popup_call_phone_data['background_send_button_hover']; ?>; }
<?php } ?>
<?php if ($popup_call_phone_data['background_close_button_hover']) { ?>
#popup-call-phone-wrapper .popup-footer button:hover {background:<?php echo $popup_call_phone_data['background_close_button_hover']; ?>; }
<?php } ?>
<?php if ($popup_call_phone_data['border_send_button']) { ?>
#popup-call-phone-wrapper .popup-footer a {border-color:<?php echo $popup_call_phone_data['border_send_button']; ?>; }
<?php } ?>
<?php if ($popup_call_phone_data['border_close_button']) { ?>
#popup-call-phone-wrapper .popup-footer button {border-color:<?php echo $popup_call_phone_data['border_close_button']; ?>; }
<?php } ?>
<?php if ($popup_call_phone_data['border_send_button_hover']) { ?>
#popup-call-phone-wrapper .popup-footer a:hover {border-color:<?php echo $popup_call_phone_data['border_send_button_hover']; ?>; }
<?php } ?>
<?php if ($popup_call_phone_data['border_close_button_hover']) { ?>
#popup-call-phone-wrapper .popup-footer button:hover {border-color:<?php echo $popup_call_phone_data['border_close_button_hover']; ?>; }
<?php } ?>
</style>
</div>
