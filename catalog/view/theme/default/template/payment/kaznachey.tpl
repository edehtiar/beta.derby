<form action="<?php echo $action; ?>" accept-charset="utf-8" method="post" id="payment">
	<? echo $cc_type; ?>
	<? echo $cc_agreed; ?>
	<div class="buttons">
		<input type="submit" value="<?php echo $button_confirm; ?>" class="btn btn-primary" />
	</div>
</form>

<script type="text/javascript"><!--
(function(){ 
var cc_a = $('#cc_agreed');
	 cc_a.on('click', function(){
		if(cc_a.is(':checked')){	
			$('#payment').find('.error').text('');
		}else{
			cc_a.after('<span class="error">Примите условие!</span>');
		}
	 });
})(); 
//--></script> 