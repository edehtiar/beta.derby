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

function getName(option_id) {
	setTimeout(function(){
		$('#option-name-content-' + option_id).load('index.php?route=editors/option/getOptionName&token=' + getURLVar('token') + '&option_id=' + option_id);
	}, 10);
}

function editSort(option_id) {
	var sort_order = $('#input-sort' + option_id).val();						
							
	$.ajax({
		url: 'index.php?route=editors/option/editOptionSort&token=' + getURLVar('token') + '&option_id=' + option_id + '&sort_order=' + sort_order,
		type: 'post',
		dataType: 'json',
		success: function(json) {									
			if (json['error']) {								
				$('.messages-body').html('<div class="alert alert-danger alert-messages"><i class="fa fa-check-circle"></i> ' + json['error'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);
			}
									
			if (json['success']) {
				$('.messages-body').html('<div class="alert alert-success alert-messages"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1000).fadeOut(500);			
				
				if (sort_order != '') {
					$('#option-sort' + option_id).html(sort_order);
				} else {
					$('#option-sort' + option_id).html('0');
				}

				$('#close-sort-' + option_id).trigger('click');
			}
		}
	});
}

function sortClear(option_id) {
	$('#input-sort' + option_id).val('');
}

function editOptionValue(option_id) {	
	$('#modal-option-edit').modal('show');
		
	$('#modal-option-edit').on('hide.bs.modal', function() {
		$('#modal-option-content').empty();
	});
	
	$('#modal-option-content').load('index.php?route=editors/option/editOptionValue&token=' + getURLVar('token') + '&option_id=' + option_id);
}