<div class="modal-header">
  <button type="button" class="pull-right btn btn-danger btn-sm" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
  <h4 class="modal-title"><?php echo $entry_description; ?></h4>
</div>
<div class="modal-body" id="body-mass-product-description">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-mass-product-description" class="form-horizontal">	
	<ul class="nav nav-tabs" id="language-description">
	  <?php foreach ($languages as $language) { ?>
		<li><a href="#language-description<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
	  <?php } ?>
	</ul>
	<div class="tab-content">
	  <?php foreach ($languages as $language) { ?>
		<div class="tab-pane" id="language-description<?php echo $language['language_id']; ?>">
		  <div class="form-group">
			<div class="col-sm-12">
			  <textarea name="product_description[<?php echo $language['language_id']; ?>][description]" placeholder="<?php echo $entry_description; ?>" id="input-description<?php echo $language['language_id']; ?>" class="form-control"></textarea>
			</div>
		  </div>
	    </div>
	  <?php } ?>
	</div>
  </form>
</div>
<div class="modal-footer">
  <div class="text-center"><a data-form="form-mass-product-description" class="button-save btn btn-info btn-lg"><?php echo $button_save; ?></a></div>
</div>
<script type="text/javascript"><!--
$(".button-save").on('click', function(){		
	<?php foreach ($languages as $language) { ?>
	$('#input-description<?php echo $language['language_id']; ?>').summernote();
	var content = $('textarea[name="product_description[<?php echo $language['language_id']; ?>][description]"]').html($('#input-description<?php echo $language['language_id']; ?>').code());
	<?php } ?>	
	$.ajax({
		url: $('#' + $(this).data('form')).attr('action'),
		type: 'post',
		dataType: 'json',
		data: $('#product-list input[type=\'checkbox\']:checked, #' + $(this).data('form') + ' textarea, content'),
		success: function(json) {
			if (json['error']) {
				$('#form-mass-product-description').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
				
				$('.alert-danger').delay(1500).fadeOut(500);		
			}
								
			if (json['success']) {
				$('#form-mass-product-description').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
				
				setTimeout(function(){
					$('#modal-product-edit').modal('hide');
				}, 1000)
			}
		}
	});
});  


//--></script>
<script type="text/javascript"><!--
$('#language-description a:first').tab('show');
//--></script>
<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
$('#input-description<?php echo $language['language_id']; ?>').summernote({
	height: 300,
	lang: '<?php echo $config_admin_language; ?>',
	toolbar: [
        ['style', ['style']],
        ['font', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
        ['fontname', ['fontname']],
        ['fontsize', ['fontsize']],
        ['color', ['color']],
        ['para', ['ul', 'ol', 'paragraph']],
        ['height', ['height']],
        ['table', ['table']],
        ['insert', ['hr']],
        ['view', ['codeview']]
    ]
});
<?php } ?>
//--></script> 