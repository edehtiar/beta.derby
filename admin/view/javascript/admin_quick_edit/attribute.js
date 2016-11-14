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

function getName(attribute_id) {
	setTimeout(function(){
		$('#attribute-name-content-' + attribute_id).load('index.php?route=editors/attribute/getAttributeName&token=' + getURLVar('token') + '&attribute_id=' + attribute_id);
	}, 10);
}

function editAttributeGroup(attribute_id) {
	var selected_attribute_group_id = $('#input-attribute-group' + attribute_id).val();	
	var attribute_group_name = $('#input-attribute-group' + attribute_id).find('option:selected').text(); 
							
	$.ajax({
		url: 'index.php?route=editors/attribute/editAttributeGroup&token=' + getURLVar('token') + '&attribute_id=' + attribute_id + '&attribute_group_id=' + selected_attribute_group_id,
		type: 'post',
		dataType: 'json',
		success: function(json) {									
			if (json['error']) {								
				$('.messages-body').html('<div class="alert alert-danger alert-messages"><i class="fa fa-check-circle"></i> ' + json['error'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);
			}
									
			if (json['success']) {
				$('.messages-body').html('<div class="alert alert-success alert-messages"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1000).fadeOut(500);			
								
				$('#attribute-group' + attribute_id).html(attribute_group_name);
				$('#close-attribute-group-' + attribute_id).trigger('click');
			}
		}
	});
}

function editSort(attribute_id) {
	var sort_order = $('#input-sort' + attribute_id).val();						
							
	$.ajax({
		url: 'index.php?route=editors/attribute/editAttributeSort&token=' + getURLVar('token') + '&attribute_id=' + attribute_id + '&sort_order=' + sort_order,
		type: 'post',
		dataType: 'json',
		success: function(json) {									
			if (json['error']) {								
				$('.messages-body').html('<div class="alert alert-danger alert-messages"><i class="fa fa-check-circle"></i> ' + json['error'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);
			}
									
			if (json['success']) {
				$('.messages-body').html('<div class="alert alert-success alert-messages"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1000).fadeOut(500);			
				
				if (sort_order != '') {
					$('#attribute-sort' + attribute_id).html(sort_order);
				} else {
					$('#attribute-sort' + attribute_id).html('0');
				}

				$('#close-sort-' + attribute_id).trigger('click');
			}
		}
	});
}

function sortClear(attribute_id) {
	$('#input-sort' + attribute_id).val('');
}

function getGroupName(attribute_group_id) {
	setTimeout(function(){
		$('#attribute-group-name-content-' + attribute_group_id).load('index.php?route=editors/attribute_group/getAttributeGroupName&token=' + getURLVar('token') + '&attribute_group_id=' + attribute_group_id);
	}, 10);
}

function editGroupSort(attribute_group_id) {
	var sort_order = $('#input-sort-group' + attribute_group_id).val();						
							
	$.ajax({
		url: 'index.php?route=editors/attribute_group/editAttributeGroupSort&token=' + getURLVar('token') + '&attribute_group_id=' + attribute_group_id + '&sort_order=' + sort_order,
		type: 'post',
		dataType: 'json',
		success: function(json) {									
			if (json['error']) {								
				$('.messages-body').html('<div class="alert alert-danger alert-messages"><i class="fa fa-check-circle"></i> ' + json['error'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1500).fadeOut(500);
			}
									
			if (json['success']) {
				$('.messages-body').html('<div class="alert alert-success alert-messages"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');$('.maxy-backdrop, .messages-body').show().delay(1000).fadeOut(500);			
				
				if (sort_order != '') {
					$('#attribute-group-sort' + attribute_group_id).html(sort_order);
				} else {
					$('#attribute-group-sort' + attribute_group_id).html('0');
				}

				$('#close-group-sort-' + attribute_group_id).trigger('click');
			}
		}
	});
}

function sortGroupClear(attribute_group_id) {
	$('#input-sort-group' + attribute_group_id).val('');
}