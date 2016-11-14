<?php
// Heading
$_['heading_title']    = 'Simple Redirect Master';

$_['text_module']      = 'Modules';
$_['text_edit']        = 'Edit Redirects';
$_['text_add_redirect'] = 'Adding new redirect';
$_['text_advanced'] = 'Advanced';
$_['text_ajax_no_response'] = 'No response';
$_['text_confirm_delete'] = 'Are you sure you want delete this?';
$_['text_confirm_leave_page'] = 'Are you sure? Unsaved data will be lost';
$_['text_developer'] = 'Simple Redirect Master v%1$s<br>&copy; %2$s %3$s.<br>If you have questions, problems with module or propositions, please contact me: <a href="mailto:%4$s">%4$s</a>';
$_['text_not_show_again'] = 'Dont\'t show again';
$_['text_pre_action_content'] = 'Content of register pre action file';
$_['text_search'] = 'Search';
$_['text_success_add'] = 'Redirect successfully added!';
$_['text_success_delete_redirect'] = 'Redirect successfully deleted!';
$_['text_success_save_redirect'] = 'Redirect successfully modified!';
$_['text_success_warning_disable'] = 'Warning successfully disabled!';
$_['text_success_warning_action_pre_action'] = 'Pre action successfully registered!';
$_['text_code_301'] = 'Permanent redirect (301 Moved Permanently)';
$_['text_code_302'] = 'Temporary redirect (302 Found)';

// Entry
$_['entry_status']     = 'Status';

// Error
$_['error_permission'] = 'Warning: You do not have permission to modify current module!';
$_['error_add_redirect'] = 'Couldn\'t add redirect!';
$_['error_ajax'] = 'Error';
$_['error_delete_redirect'] = 'Couldn\'t delete redirect!';
$_['error_empty_from'] = 'From value cannot be empty';
$_['error_empty_redirect_id'] = 'Couldn\'t find redirect! Try to reload page.';
$_['error_empty_to'] = 'To value cannot be empty';
$_['error_from_not_unique'] = 'Such from value already exists. You can use search to find it';
$_['error_pre_action_file_not_writable'] = 'File that should contain register of pre action is not writable!';
$_['error_request'] = 'Error, only POST request allowed';
$_['error_save_redirect'] = 'Error while saving redirect!';
$_['error_warning_type'] = 'Not allowed!';
$_['error_from_to_same'] = 'From and to values cannot be the same!';
$_['error_warning_action_pre_action'] = 'Couldn\'t add pre action registration.';

// Action
$_['action_add_pre_action'] = 'Register';

// Button
$_['button_create'] = 'Create';
$_['button_ok'] = 'Ok';
$_['button_no'] = 'No';
$_['button_yes'] = 'Yes';

// Column
$_['column_from'] = 'From';
$_['column_to'] = 'To';
$_['column_code'] = 'Code';
$_['column_status'] = 'Status';
$_['column_action'] = 'Actions';

// Entry
$_['entry_from'] = 'From';
$_['entry_to'] = 'To';
$_['entry_code'] = 'Code';
$_['entry_status'] = 'Status';
$_['entry_per_page'] = 'Per page';

// Help
$_['help_from'] = 'Where redirect triggers from, e.g: /products-old';
$_['help_to'] = 'Where we should redirect to, e.g: /products';
$_['help_code'] = 'Which status server should return, if you move page to another address and want search engine forget about old and know about new one, you should select 301 status';
$_['help_pre_action_file_manual_insert'] = 'You can manually add content below into <code>%s</code> file.';

// Warning
$_['warning_no_pre_action'] = 'Pre action registration not found. Module won\'t work without it!';